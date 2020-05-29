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

    def self.cocktails_by_ingredient(ingredient)
        cocktails = []

        api_response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"

        cocktails += self.select { |cocktail| cocktail.ingredients.map { |i| i.name.downcase }.include? ingredient.downcase }
        cocktails += render_api_cocktails(api_response, cocktails)

        cocktails.sort_by { |cocktail| cocktail.name }
    end

    def self.render_api_cocktails(api_response, cocktails)
        api_cocktail_arr = []
        if api_response && !api_response.empty?
            api_cocktails = JSON.parse(api_response)['drinks']
            if api_cocktails
                api_cocktails.each do |c|
                    cocktail = parse_api_cocktail_show(c)
                    if !cocktails.find { |arr_cocktail| arr_cocktail.name == cocktail.name }
                        api_cocktail_arr.push(cocktail)
                    end
                end
            end
        end

        api_cocktail_arr
    end

    def self.parse_api_cocktail_show(api_cocktail)
        cocktail = Cocktail.new
        ingredients = []
        cocktail.name = api_cocktail['strDrink']
        cocktail.image = api_cocktail['strDrinkThumb']
        cocktail.instructions = api_cocktail['strInstructions']

        15.times do |index|
            if !api_cocktail["strIngredient#{index + 1}"] || api_cocktail["strIngredient#{index + 1}"].empty?
                break
            else
                ingredient = Ingredient.new(name: api_cocktail["strIngredient#{index + 1}"])
                cocktail.ingredients << ingredient
                cocktail.cocktailIngredients[index].measure = api_cocktail["strMeasure#{index + 1}"].to_s.strip
            end
        end

        cocktail
    end

    def self.create_cocktail_with_ingredients(params)
        cocktail_ingredients = params[:cocktailIngredients]
        ingredients = params[:ingredients]

        cocktail = Cocktail.new(name: params[:name], image: params[:image], instructions: params[:instructions])
        if !cocktail.save
            return
        end

        ingredients.length.times do |index|
            ingredient = Ingredient.find_by(name: ingredients[index][:name])
            if !ingredient
                ingredient = Ingredient.new(name: ingredients[index][:name])
                ingredient.save
            end
            
            if cocktail.id && ingredient.id
                CocktailIngredient.create(cocktail: cocktail, ingredient: ingredient, measure: cocktail_ingredients[index][:measure])
            end
        end

        cocktail
    end

    def self.get_show_info(id, name)
        if id
            cocktail = Cocktail.find_by(id: id)
        else
            cocktail = self.cocktails_by_name(name).first
        end

        cocktail
    end

    def add_ingredient(params)
        if !params[:name].empty?
            ingredient = Ingredient.where("LOWER(name) = ?", params[:name].downcase).first
            if !ingredient
                ingredient = Ingredient.create(name: params[:name]);
            end
            cocktail_ingredient = CocktailIngredient.create(ingredient: ingredient, cocktail: self, measure: params[:measure])

            { ingredient: ingredient, cocktail_ingredient: cocktail_ingredient }
        end
    end
end
