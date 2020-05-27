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
Ingredients8 = Ingredient.create(name: "Tequila", image: "https://www.thecocktaildb.com/images/ingredients/Tequila.png")
Ingredients9 = Ingredient.create(name: "Cardamom", image: "https://www.thecocktaildb.com/images/ingredients/Cardamom.png")
Ingredients10 = Ingredient.create(name: "Hot Chocolate", image: "https://www.thecocktaildb.com/images/ingredients/Hot%20Chocolate.png")

puts "creating cocktails and cocktail ingredients..."

cocktails = [
  {name: 'Mojito', image: 'https://www.thecocktaildb.com/images/media/drink/3z6xdi1589574603.jpg', instructions: 'Muddle mint leaves with sugar and lime juice. Add a splash of soda water and fill the glass with cracked ice. Pour the rum and top with soda water. Garnish and serve with straw.'},
  {name: 'Old Fashioned', image: 'https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg', instructions: 'Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved.\r\nFill the glass with ice cubes and add whiskey.\r\n\r\nGarnish with orange twist, and a cocktail cherry.'},
  {name: 'Long Island Tea', image: 'https://www.thecocktaildb.com/images/media/drink/tppn6i1589574695.jpg', instructions: 'Combine all ingredients (except cola) and pour over ice in a highball glass. Add the splash of cola for color. Decorate with a slice of lemon and serve.'},
  {name: 'Negroni', image: 'https://www.thecocktaildb.com/images/media/drink/qgdu971561574065.jpg', instructions: 'Stir into glass over ice, garnish and serve.'},
  {name: 'Whiskey Sour', image: 'https://www.thecocktaildb.com/images/media/drink/hbkfsh1589574990.jpg', instructions: 'Shake with ice. Strain into chilled glass, garnish and serve. If served \'On the rocks\', strain ingredients into old-fashioned glass filled with ice.'},
  {name: 'Dry Martini', image: 'https://www.thecocktaildb.com/images/media/drink/6ck9yi1589574317.jpg', instructions: 'Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.'},
  {name: 'Daiquiri', image: 'https://www.thecocktaildb.com/images/media/drink/mrz9091589574515.jpg', instructions: 'Pour all ingredients into shaker with ice cubes. Shake well. Strain in chilled cocktail glass.'},
  {name: 'Margarita', image: 'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg', instructions: 'Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.'},
  {name: 'Manhattan', image: 'https://www.thecocktaildb.com/images/media/drink/hz7p4t1589575281.jpg', instructions: 'Stirred over ice, strained into a chilled glass, garnished, and served up.'},
  {name: 'Moscow Mule', image: 'https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg', instructions: 'Combine vodka and ginger beer in a highball glass filled with ice. Add lime juice. Stir gently. Garnish.'}
]

measures = ['1 cup', '1 tbsp', '2 tbsp', '1 shot', '2 shots', '3 shots', '1 quart', '18 gallons']

5.times do
  cocktailSample = cocktails.sample;
  if !Cocktail.find_by(name: cocktailSample[:name])
    cocktail = Cocktail.create(name: cocktailSample[:name], image: cocktailSample[:image], instructions: cocktailSample[:instructions], creator: User.all.sample)
    3.times do
      CocktailIngredient.create(ingredient: Ingredient.all.sample, cocktail: cocktail, measure: measures.sample)
    end
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

