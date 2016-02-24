# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  OrderItem.destroy_all
  Order.destroy_all
  Address.destroy_all
  User.destroy_all
  Sample.destroy_all
  Kit.destroy_all
  Perfume.destroy_all

  jean=User.create!(first_name:"Jean", last_name:"Dupont", email:"jean.dupont@test.fr", password:"12345678")
  jean.addresses.create!(first_name:"Jean", last_name:"Dupont", street:"11 villa gaudelet", zip_code:"75011", city:"Paris")
  order1=jean.orders.create!
  order1.address=Address.first
  order1.save
  perfume1=Perfume.create!(name:"Winter Love", description:"Best flagrance for winter")
  perfume2=Perfume.create!(name:"Fresh Summer", description:"A summer night in the air")
  perfume3=Perfume.create!(name:"Spring Free", description:"Free your mind and live your life")
  perfume4=Perfume.create!(name:"All night long", description:"Night never ends")
  perfume5=Perfume.create!(name:"Autumn soul", description:"Summer ends, Winter starts, you are")
  kit1=Kit.create!(name:"Collection 1", description:"Our first collection")
  sample1=perfume1.samples.create!
  sample1.kit=kit1
  sample1.save
  sample2=perfume2.samples.create!
  sample2.kit=kit1
  sample2.save
  sample3=perfume3.samples.create!
  sample3.kit=kit1
  sample3.save
  sample4=perfume4.samples.create!
  sample4.kit=kit1
  sample4.save
  sample5=perfume5.samples.create!
  sample5.kit=kit1
  sample5.save
  kit1.save
  order_item1=OrderItem.create!(quantity:1, product_type:'Kit')
  order_item1.product = Kit.first
  order_item1.order = Order.first
  order_item1.save



