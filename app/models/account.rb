class Account < ActiveRecord::Base
	belongs_to :customer
	has_many :transactions
	validates :number, 
		presence: true, 
		uniqueness: true
	validates :balance, 
		presence: true, 
		numericality: {greater_than_or_equal_to: 0}

	def withdraw(amount)
		if self.balance < amount || amount <= 0
			puts "Abheben nicht moeglich"
		else 
			self.balance -= amount
			self.save
			self.transactions.create(amount: amount, description: "Withdrawel", balance_after_transaction: self.balance)
			self.save
			puts "Abheben erfolgreich"
		end
	end

	def deposit(amount)
		if amount <= 0
				puts "Einzahlen nicht moeglich"
		else
			self.balance += amount
			self.save
			self.transactions.create(amount: amount, description: "Depository", balance_after_transaction: self.balance)
			self.save
			puts "Einzahlung erfolgreich"
		end
	end

	def transfer(amount, number)
			if self.balance < amount || amount <= 0
			puts "Ueberweisung nicht moeglich"

		else 
			self.balance -= amount			#eigene Kontostand wird um den Wert reduziert
			self.save
			account=Account.where(:number => number).first
			account.deposit(amount) 			#Emfängerkonto wir mit der Methode einzahlen um den Wert erhoeht
			
			self.transactions.create(amount: amount, description: "Transfer to " + account.number.to_s, balance_after_transaction: self.balance)
			account.transactions.create(amount: amount, description: "Transfer from " + self.number.to_s, balance_after_transaction: account.balance)
			puts "Ueberseisung erfolgreich"
		end
	end

	def statement
			puts "Accountnumber: " + self.number.to_s
			puts "Customer: " + self.customer.first_name + " " + self.customer.last_name
			self.transactions.each do |transaction|
				puts transaction.description
			end
	end

end
