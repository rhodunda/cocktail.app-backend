class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :cocktail_id
end
