# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.find_by_username('admin')
if admin.nil?
admin = User.create!([{ :username => 'admin',  :first_name => "Admin", :last_name => "User", :email => 'user@example.com', :password => 'password1234', :password_confirmation => 'password1234', :role_id => 1, :status => 1}])
end
roles = Role.all
if roles.empty?
Role.create!([
				{ :code => 'Adm',  :name => "Admin", :is_active => true},
				{ :code => 'Ed',  :name => "Editor", :is_active => true}
			])
end
homepage = Page.root
if homepage.nil?
homepage = Page.create!({:page_title => 'Home', :page_url => '/', :body => '<p>Lorem ipsum dolor sit amet</p>', :activate => true ,:is_root => true})
end
contactpage = Page.contact
if contactpage.nil?
contactpage = Page.create!({:page_title => 'Contact Us', :page_url => 'contact-us', :body => '', :activate => true ,:is_contact => true})
end

