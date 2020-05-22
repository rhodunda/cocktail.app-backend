# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
brandon = User.create(email: 'brandon@brandon.com')
moxxie = User.create(email: 'moxxie@moxxie.com')
bryan = User.create(email: 'bryan@bryan.com')
require 'rest-client'

DBcocktailAPI = RestClient.get 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s='

# DBcooktailAPI.each do |cocktail|
# can we get all the cocktails?
#     end

puts "destorying data..."

User.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all
Favorite.destroy_all
Review.destroy_all
CocktailIngredient.destroy_all

puts "creating user..."

brandon = User.create(email: 'brandon@brandon.com', password: 'brandon')
moxxie = User.create(email: 'moxxie@moxxie.com', password: 'moxxie')
bryan = User.create(email: 'bryan@bryan.com', password: 'bryan')

puts "creating Ingredients..."

Ingredients1 = Ingredient.create(name: "Tomato Juice", image: "https://www.thecocktaildb.com/images/ingredients/Tomato%20Juice.png")
Ingredients2 = Ingredient.create(name: "Peach Juice", image: "https://www.thecocktaildb.com/images/ingredients/Peach%20juice.png")
Ingredients3 = Ingredient.create(name: "Apricot Brandy", image: "https://www.thecocktaildb.com/images/ingredients/Apricot%20Brandy.png")
Ingredients4 = Ingredient.create(name: "Kahlua", image: "https://www.thecocktaildb.com/images/ingredients/Kahlua.png")
Ingredients5 = Ingredient.create(name: "Blue Maui", image: "https://www.thecocktaildb.com/images/ingredients/Blue%20Maui.png")
Ingredients6 = Ingredient.create(name: "White Rum", image: "https://www.thecocktaildb.com/images/ingredients/White%20Rum.png")
Ingredients7 = Ingredient.create(name: "Fennel Seeds", image: "https://www.thecocktaildb.com/images/ingredients/Fennel%20Seeds.png")
Ingredients8 = Ingredient.create(name: "Anisette", image: "https://www.thecocktaildb.com/images/ingredients/Anisette.png")
Ingredients9 = Ingredient.create(name: "Cardamom", image: "https://www.thecocktaildb.com/images/ingredients/Cardamom.png")
Ingredients10 = Ingredient.create(name: "Hot Chocolate", image: "https://www.thecocktaildb.com/images/ingredients/Hot%20Chocolate.png")

puts "creating cocktails and cocktail ingredients..."

cocktails = [
  {name: 'Mojito', image: 'https://www.thecocktaildb.com/images/media/drink/3z6xdi1589574603.jpg'},
  {name: 'Old Fashioned', image: 'https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg'},
  {name: 'Long Island Tea', image: 'https://www.thecocktaildb.com/images/media/drink/tppn6i1589574695.jpg'},
  {name: 'Negroni', image: 'https://www.thecocktaildb.com/images/media/drink/qgdu971561574065.jpg'},
  {name: 'Whiskey Sour', image: 'https://www.thecocktaildb.com/images/media/drink/hbkfsh1589574990.jpg'},
  {name: 'Dry Martini', image: 'https://www.thecocktaildb.com/images/media/drink/6ck9yi1589574317.jpg'},
  {name: 'Daiquiri', image: 'https://www.thecocktaildb.com/images/media/drink/mrz9091589574515.jpg'},
  {name: 'Margarita', image: 'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg'},
  {name: 'Manhattan', image: 'https://www.thecocktaildb.com/images/media/drink/hz7p4t1589575281.jpg'},
  {name: 'Moscow Mule', image: 'https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg'}
]

5.times do
  cocktailSample = cocktails.sample;
  cocktail = Cocktail.create(name: cocktailSample[:name], image: cocktailSample[:image], creator: User.all.sample)
  3.times do
    CocktailIngredient.create(ingredient: Ingredient.all.sample, cocktail: cocktail)
  end
end

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

puts "Seed's done Loading!!!!"

