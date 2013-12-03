# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(:first_name => "Anna", :last_name => "Banana" ).accounts.create(:number => 10001, :balance => 1000).transactions.create(:amount => 100, :description => "abcdefgh", :balance_after_transaction => 900)
Customer.create(:first_name => "Hanna", :last_name => "Hutson" ).accounts.create(:number => 10002, :balance => 2000).transactions.create(:amount => 500, :description => "abcdefgh", :balance_after_transaction => 1500)
Customer.create(:first_name => "Emilie", :last_name => "Emil" ).accounts.create(:number => 10003, :balance => 3000).transactions.create(:amount => 1000, :description => "abcdefgh", :balance_after_transaction => 1000)