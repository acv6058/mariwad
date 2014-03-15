# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create!([{ :username => 'admin',  :first_name => "Admin", :last_name => "User", :email => 'user@example.com', :password => 'password1234', :password_confirmation => 'password1234', :role_id => 1, :status => 1}])
roles = Role.create!([{ :code => 'Adm',  :name => "Admin", :is_active => true}, { :code => 'Ed',  :name => "Editor", :is_active => true}])

