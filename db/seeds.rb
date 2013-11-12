# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(:name => :admin)
Role.create(:name => :user)
User.create(:firstname => "Aleksey", :lastname => "Margasov", :username => "amargasov", :email => "alexei@margasov.ru", :password => '12345678', :password_confirmation => '12345678')
User.last.roles=Role.where(:name => 'admin')
