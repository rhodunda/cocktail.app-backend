# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'


DBcocktailAPI = RestClient.get 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s='


# rm_array.each do |character|
#     Character.create(
#     name: character[“name”],
#     status: character[“status”],
#     species: character[“species”],
#     gender: character[“gender”],
#     image: character[“image”]
#     )
#    end

puts "creating user..."

brandon = User.create(email: 'brandon@brandon.com', password: 'brandon')
moxxie = User.create(email: 'moxxie@moxxie.com', password: 'moxxie')
bryan = User.create(email: 'bryan@bryan.com', password: 'bryan')

puts "creating cocktails..."

cocktail1 = Cocktail.create(name: "Mojito", image:"https://www.thecocktaildb.com/images/media/drink/3z6xdi1589574603.jpg")
cocktail2 = Cocktail.create(name: "Margarita", image:"https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")
cocktail3 = Cocktail.create(name: "Manhattan", image:"https://www.thecocktaildb.com/images/media/drink/hz7p4t1589575281.jpg")
cocktail3 = Cocktail.create(name: "Whiskey Sour", image:"https://www.thecocktaildb.com/images/media/drink/hbkfsh1589574990.jpg")
cocktail3 = Cocktail.create(name: "English Rose Cocktail", image:"https://www.thecocktaildb.com/images/media/drink/yxwrpp1441208697.jpg")

puts "creating Ingredients..."

Ingredients1 = Ingredient.create(name: "Tomato Juice", image: "https://www.thecocktaildb.com/images/ingredients/Tomato%20Juice.png")
Ingredients2 = Ingredient.create(name: "Peach Juice", image: "https://www.thecocktaildb.com/images/ingredients/Peach%20juice.png")
Ingredients3 = Ingredient.create(name: "Apricot Brandy", image: "https://www.thecocktaildb.com/images/ingredients/Apricot%20Brandy.png")
Ingredients4 = Ingredient.create(name: "Kahlua", image: "https://www.thecocktaildb.com/images/ingredients/Kahlua.png")
Ingredients5 = Ingredient.create(name: "Blue Maui", image: "https://www.thecocktaildb.com/images/ingredients/Blue%20Maui.png")

puts "creating Favorites..."

favorites1 = Favorite.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
favorites2 = Favorite.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
favorites3 = Favorite.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
favorites4 = Favorite.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
favorites5 = Favorite.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
favorites6 = Favorite.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)

puts "creating reviews..."

review1 = Review.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id, rating: 10, content: "amazing content go's there")
review2 = Review.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id, rating: 1, content: "amazing content go's there")
review3 = Review.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id, rating: 5, content: "amazing content go's there")
review4 = Review.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id, rating: 3, content: "amazing content go's there")
review5 = Review.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id, rating: 7, content: "amazing content go's there")
review6 = Review.create(user_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id, rating: 9, content: "amazing content go's there")

puts "creating cocktail_ingredients..."

cocktailIngredients1 = CocktailIngredient.create(ingredient_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
cocktailIngredients2 = CocktailIngredient.create(ingredient_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
cocktailIngredients3 = CocktailIngredient.create(ingredient_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
cocktailIngredients4 = CocktailIngredient.create(ingredient_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
cocktailIngredients5 = CocktailIngredient.create(ingredient_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)
cocktailIngredients6 = CocktailIngredient.create(ingredient_id: User.all.sample.id, cocktail_id: Cocktail.all.sample.id)

puts "Seed's done Loading!!!!"

