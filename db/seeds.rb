# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserConversation.destroy_all
Message.destroy_all
User.destroy_all
Conversation.destroy_all

User.create(username: "Roger", password: "passw0rd", first_name: "Roger", last_name: "Robertson")
User.create(username: "Jazz", password: "passw0rd", first_name: "Jazz", last_name: "Bozzner")
User.create(username: "John", password: "passw0rd", first_name: "John", last_name: "Souza")

puts "Users Seeded"

Conversation.create(title: "self.isolate", description: "Just the coolest mod")

puts "Conversations Seeded"

UserConversation.create(user_id: User.first.id, conversation_id: Conversation.first.id)
UserConversation.create(user_id: User.second.id, conversation_id: Conversation.first.id)
UserConversation.create(user_id: User.third.id, conversation_id: Conversation.first.id)


puts "UserConversations Seeded"

puts "Seeding completed"
