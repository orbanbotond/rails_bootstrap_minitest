# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({ email: 'root@searchercompany.com', password: 'r00tr00tr00t', password_confirmation: 'r00tr00tr00t', role: 'admin' })
   # user = User.create({ email: 'client1@searchercompany.com', password: 'client1', password_confirmation: 'client1' })
   # user = User.create({ email: 'client2@searchercompany.com', password: 'client2', password_confirmation: 'client2' })
   # user = User.create({ email: 'client1@searchercompany.com', password: 'client1', password_confirmation: 'client1' })
