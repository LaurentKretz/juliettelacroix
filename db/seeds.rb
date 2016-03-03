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
  Review.destroy_all
  User.destroy_all
  Sample.destroy_all
  Kit.destroy_all
  Perfume.destroy_all

  jean = User.create!(first_name:"Jean", last_name:"Dupont", email:"jean.dupont@test.fr", password:"12345678", admin:true)
  jean.addresses.create!(first_name:"Jean", last_name:"Dupont", street:"11 villa gaudelet", zip_code:"75011", city:"Paris")
  order1 = jean.orders.create!(address:Address.first)
  perfume1 = Perfume.create!(
    name:"Winter Love",
    description:"Best flagrance for winter",
    introduction: "Vision moderne de l'éternelle Eau de Cologne, cette création en respecte le canevas, pour mieux la sublimer. Le trio néroli / fleur d'oranger / bergamote, plein de tendresse, évoque immédiatement l'enfance. On sourit, forcément. La note est verte, très naturelle, un peu amère, avec une vraie dimension florale. Le musc fond sur la peau et intrigue... A la fois propre et obscène, doux et légèrement salé. Indélébile pour sa tenue, le parfum remplit la pièce et vous accompagnera toute la journée.",
    inspiration: "J'ai créé ce parfum après être retourné dans la maison de campagne de mes grands-parents. Enfant, je passais des heures à jouer dans le grenier, adorant l'odeur du vieux fauteuil en cuir dans lequel je venais lire en cachette, et la fenêtre ouverte sur la forêt de pins nous séparant de la mer. Les effluves des embruns et du sable chaud pour amis.",
    note1: "Une composition texturée, entre acidulation fruitée et rondeur musquée.",
    note2: "La note s'arrondit et se pose avec grâce. Des reflets vanillés, balsamiques et légèrement cacaotés comblent et apaisent. Le sillage et la tenue sont fantastiques.",
    sku: "winter_love_75ml",
    price: 95,
    picture_url: "perfume_yellow.jpg"
  )
  perfume2 = Perfume.create!(
    name:"Fresh Summer",
    description:"A summer night in the air",
    introduction: "Vision moderne de l'éternelle Eau de Cologne, cette création en respecte le canevas.",
    inspiration: "Parmi le vert et la floraison de toutes les plantes les plus belles, je flâne. Je délibère ici, je rêve par là. L’heure s’arrête, ou plutôt s’étend pleinement, se déplier et s’amplifier. Ce parfum au coeur de pêche et à la note épicée vous rappelera vos plus belles virées estsivales entre mer et montagnes. L'attaque est franche, la seconde note est fraiche et délicate, comme un fruit d'été.",
    note1: "Une composition texturée, entre acidulation fruitée et rondeur musquée.",
    note2: "La note s'arrondit et se pose avec grâce. Des reflets vanillés, balsamiques et légèrement cacaotés comblent et apaisent. Le sillage et la tenue sont fantastiques.",
    sku: "fresh_summer_75ml",
    price: 95,
    picture_url: "perfume_purple.jpg"
  )
  perfume3 = Perfume.create!(
    name:"Spring Free",
    description:"Free your mind and live your life",
    introduction: "Vision moderne de l'éternelle Eau de Cologne, cette création en respecte le canevas, pour mieux la sublimer. Le trio néroli / fleur d'oranger / bergamote, plein de tendresse, évoque immédiatement l'enfance. On sourit, forcément. La note est verte, très naturelle, un peu amère, avec une vraie dimension florale. Le musc fond sur la peau et intrigue... A la fois propre et obscène, doux et légèrement salé. Indélébile pour sa tenue, le parfum remplit la pièce et vous accompagnera toute la journée.",
    inspiration: "J'ai créé ce parfum après être retourné dans la maison de campagne de mes grands-parents. Enfant, je passais des heures à jouer dans le grenier, adorant l'odeur du vieux fauteuil en cuir dans lequel je venais lire en cachette, et la fenêtre ouverte sur la forêt de pins nous séparant de la mer. Les effluves des embruns et du sable chaud pour amis.",
    note1: "Une composition texturée, entre acidulation fruitée et rondeur musquée.",
    note2: "La note s'arrondit et se pose avec grâce. Des reflets vanillés, balsamiques et légèrement cacaotés comblent et apaisent. Le sillage et la tenue sont fantastiques.",
    sku: "spring_free_75ml",
    price: 95,
    picture_url: "perfume_green.jpg"
  )
  perfume4 = Perfume.create!(
    name:"All night long",
    description:"Night never ends",
    introduction: "Vision moderne de l'éternelle Eau de Cologne, cette création en respecte le canevas, pour mieux la sublimer. Le trio néroli / fleur d'oranger / bergamote, plein de tendresse, évoque immédiatement l'enfance. On sourit, forcément. La note est verte, très naturelle, un peu amère, avec une vraie dimension florale. Le musc fond sur la peau et intrigue... A la fois propre et obscène, doux et légèrement salé. Indélébile pour sa tenue, le parfum remplit la pièce et vous accompagnera toute la journée.",
    inspiration: "J'ai créé ce parfum après être retourné dans la maison de campagne de mes grands-parents. Enfant, je passais des heures à jouer dans le grenier, adorant l'odeur du vieux fauteuil en cuir dans lequel je venais lire en cachette, et la fenêtre ouverte sur la forêt de pins nous séparant de la mer. Les effluves des embruns et du sable chaud pour amis.",
    note1: "Une composition texturée, entre acidulation fruitée et rondeur musquée.",
    note2: "La note s'arrondit et se pose avec grâce. Des reflets vanillés, balsamiques et légèrement cacaotés comblent et apaisent. Le sillage et la tenue sont fantastiques.",
    sku: "all_night_long_75ml",
    price: 95,
    picture_url: "perfume_pink.jpg"
  )
  perfume5 = Perfume.create!(
    name:"Autumn soul",
    description:"Summer ends, Winter starts, you are",
    introduction: "Vision moderne de l'éternelle Eau de Cologne, cette création en respecte le canevas, pour mieux la sublimer. Le trio néroli / fleur d'oranger / bergamote, plein de tendresse, évoque immédiatement l'enfance. On sourit, forcément. La note est verte, très naturelle, un peu amère, avec une vraie dimension florale. Le musc fond sur la peau et intrigue... A la fois propre et obscène, doux et légèrement salé. Indélébile pour sa tenue, le parfum remplit la pièce et vous accompagnera toute la journée.",
    inspiration: "Le vent tourbillonnant, qui rabat les volets, et là-bas dord la forêt comme une chevelure. Une première note vivifiante, un coeur musqué et charpenté, pour un ensemble vivifiant et facile à porter.",
    note1: "Une composition texturée, entre acidulation fruitée et rondeur musquée.",
    note2: "La note s'arrondit et se pose avec grâce. Des reflets vanillés, balsamiques et légèrement cacaotés comblent et apaisent. Le sillage et la tenue sont fantastiques.",
    sku: "autumn_soul_75ml",
    price: 95,
    picture_url: "perfume.jpg"
  )
  kit1 = Kit.create!(
    name:"Collection 1",
    description:"Our first collection",
    sku: "collection_1_discovery_package",
    price: 5)
  sample1 = perfume1.samples.create!(kit:Kit.first)
  sample2 = perfume2.samples.create!(kit:Kit.first)
  sample3 = perfume3.samples.create!(kit:Kit.first)
  sample4 = perfume4.samples.create!(kit:Kit.first)
  sample5 = perfume5.samples.create!(kit:Kit.first)
  order_item1 = OrderItem.create!(quantity:1, product_type:'Kit', product:Kit.first, order: Order.first)
  review1 = perfume1.reviews.create!(user:User.first, comment:"I love it")



