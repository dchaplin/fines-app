# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(username: "David", password: "1234", password_confirmation: "1234")
user2 = User.create(username: "Mike", password: "1234", password_confirmation: "1234")
user3 = User.create(username: "Pete", password: "1234", password_confirmation: "1234")

fine1 = Fine.create(date: Time.now, description: "David made some bad jokes", status: "Pending", amount: 5, offender_id: 1, proposer_id: 2)
fine2 = Fine.create(date: Time.now, description: "Pete made some bad coffee", status: "Pending", amount: 5, offender_id: 3, proposer_id: 2)
