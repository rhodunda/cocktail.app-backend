class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :cocktail_id, :rating, :content
end
