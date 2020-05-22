class Review < ApplicationRecord
    belongs_to :user
    belongs_to :cocktail
end
