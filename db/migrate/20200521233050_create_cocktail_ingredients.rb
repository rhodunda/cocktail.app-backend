class CreateCocktailIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_ingredients do |t|
      t.string :cocktail_id
      t.string :ingredient_id

      t.timestamps
    end
  end
end
