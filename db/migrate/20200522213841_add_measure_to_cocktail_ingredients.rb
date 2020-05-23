class AddMeasureToCocktailIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktail_ingredients, :measure, :string
  end
end
