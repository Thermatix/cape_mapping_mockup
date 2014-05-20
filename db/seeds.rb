# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#   create_table :users do |t|
      # t.string :name
      # t.string :company
      # t.string :password
      # t.string :p
      # t.references :map

require 'awesome_print'
test = User.create({name: 'test', company: 'test', password: 'testTest', password_confirmation: 'testTest'})
if test.save
	ap 'test account successfully created!'
	ap test

	ap 'setting test as admin'
	test.set_admin
	if test.save
		ap 'test set as admin!'
		ap test
		ap test.permissions
		test.destroy
	else
		ap 'something went wrong'
		ap test
		test.destroy
	end
else
	ap 'something went wrong'
	ap test
	ap test.errors
end

