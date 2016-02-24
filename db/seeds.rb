# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
jean=User.create!(first_name:"Jean", last_name:"Dupont", email:"jean.dupont@test.fr", password:"12345678", address:"16 villa Gaudelet 75011")
