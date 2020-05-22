class CreateCocktailIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_ingredients do |t|
      t.references :cocktail
      t.references :ingredient

      t.timestamps
    end
  end
end
