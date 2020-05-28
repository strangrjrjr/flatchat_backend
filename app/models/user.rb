class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    
    has_many :user_conversations
    has_many :conversations, through: :user_conversations
    has_many :messages

end
