class AddInstructionsToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :instructions, :text
  end
end
