class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :cocktail_id
      t.integer :rating
      t.integer :content

      t.timestamps
    end
  end
end
