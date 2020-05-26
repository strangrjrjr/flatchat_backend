class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :convesation_id, :text, :created_at
end
