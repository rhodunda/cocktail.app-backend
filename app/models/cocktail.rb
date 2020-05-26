class Cocktail < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :cocktailIngredients
    has_many :ingredients, through: :cocktailIngredients
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', optional: true

    def self.get_cocktails(first_character)
        cocktails = []

        cocktails += Cocktail.all.select { |c| c.name.first === first_character }

        apiResponse = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{first_character}"

        if apiResponse
            apiCocktails = JSON.parse(apiResponse)['drinks']
            if apiCocktails
                apiCocktails.each do |c|
                    cocktail = parseApiCocktail(c)
                    if !cocktails.find { |arr_cocktail| arr_cocktail.name == cocktail.name }
                        cocktails.push(cocktail)
                    end
                end
            end
        end

        cocktails
    end

    def self.parseApiCocktail(apiCocktail)
        cocktail = Cocktail.new
        ingredients = []
        cocktail.name = apiCocktail['strDrink']
        cocktail.image = apiCocktail['strDrinkThumb']

        15.times do |index|
            if !apiCocktail["strIngredient#{index + 1}"]
                break
            else
                ingredient = Ingredient.new(name: apiCocktail["strIngredient#{index + 1}"])
                cocktail.ingredients << ingredient
            end
        end

        cocktail
    end
end
