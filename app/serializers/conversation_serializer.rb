class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :messages
  has_many :users
end
