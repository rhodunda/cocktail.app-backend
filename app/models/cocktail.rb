class Cocktail < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :cocktailIngredients
    has_many :ingredients, through: :cocktailIngredients
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', optional: true

    def self.cocktails_by_char(char)
        cocktails = []

        api_response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{char}"
        
        cocktails += Cocktail.all.select { |c| c.name.first === char }
        cocktails += render_api_cocktails(api_response, cocktails)

        cocktails.sort_by { |cocktail| cocktail.name }
    end

    def self.cocktails_by_name(name)
        cocktails = []

        api_response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
        
        cocktails += self.where("lower(name) LIKE ?", "%#{name}%")
        cocktails += render_api_cocktails(api_response, cocktails)

        cocktails.sort_by { |cocktail| cocktail.name }
    end

    def self.render_api_cocktails(api_response, cocktails)
        api_cocktail_arr = []
        if api_response
            api_cocktails = JSON.parse(api_response)['drinks']
            if api_cocktails
                api_cocktails.each do |c|
                    cocktail = parseApiCocktail(c)
                    if !cocktails.find { |arr_cocktail| arr_cocktail.name == cocktail.name }
                        api_cocktail_arr.push(cocktail)
                    end
                end
            end
        end

        api_cocktail_arr
    end

    def self.parseApiCocktail(apiCocktail)
        cocktail = Cocktail.new
        ingredients = []
        cocktail.name = apiCocktail['strDrink']
        cocktail.image = apiCocktail['strDrinkThumb']
        cocktail.instructions = apiCocktail['strInstructions']

        15.times do |index|
            if !apiCocktail["strIngredient#{index + 1}"] || apiCocktail["strIngredient#{index + 1}"].empty?
                break
            else
                ingredient = Ingredient.new(name: apiCocktail["strIngredient#{index + 1}"])
                cocktail.ingredients << ingredient
                cocktail.cocktailIngredients[index].measure = apiCocktail["strMeasure#{index + 1}"].to_s.strip
            end
        end

        cocktail
    end
end
