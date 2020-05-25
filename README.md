# User Stories
- As a user, I want to log in
- As a user, I want to see a list of conversations
- As a user, I should be able to select contacts for a conversation
- As a user, I want to see a list of contacts globally
- As a user, I want to send a message
- As a user, I want to receive a message
- As a user, I want to see all messages in a conversation
- As a user, I want to log out
- As a user, I want to see ONLY that conversation's messages
- As a user, I want to create a conversation
- As a user, I want to delete a conversation
- As a user, I want to add people to my already existing conversation
- As a user, I want to be able to send images
- As a user, I should be notified that a new user has appeared
- As a user, I want my messages encrypted over the air

# MVP
- As a user, I want to log in
- As a user, I want to see a list of conversations
- As a user, I should be able to select contacts for a conversation
- As a user, I want to send a message
- As a user, I want to receive a message
- As a user, I want to see all messages in a conversation
- As a user, I want to log out
- As a user, I want to see ONLY that conversation's messages
- As a user, I want to create a conversation
- As a user, I want to delete a conversation

# Stretch
- As a user, I should be notified that a new user has appeared
- As a user, I want to be able to send images
- As a user, I want to see a list of contacts globally
- As a user, I want to add people to my already existing conversation
- As a user, I want my messages encrypted over the air
- As a user, I want an avatar for my profile

# DB
- User 
    - Relationships
        - has_many userconversations
        - has_many conversations through user_conversations
        - has_many messages
        - Stretch - has_many users, through friendships
    - Properties
        - id
        - username (verify uniqueness)
        - password_digest
        - first_name
        - last_name
        - avatar (stretch) the last airbender
        - email (mailer with verification)
- Conversation
    - Relationships
        - has_many user_conversations
        - has_many messages
        - has_many users through user_conversations
    - Properties
        - id
        - title
        - description
- Message
    - Relationships
        - belongs_to user
        - belongs_to conversation
    - Properties
        - id
        - text
- UserConversation
    - Relationships
        - belongs_to user
        - belongs_to conversation
    - Properties
        - id
        - admin boolean

# Wireframe

- Jazz is working on this

# Styling

- Bootstrap
- Materialize

# Week Flow

- Mornings code together, Afternoons code alone

- Monday
    - Morning
        - Planning
        - Basic Rails setup (DB)
    - Afternoon
- Tuesday
    - Morning
        - Basic react setup
        - Websocket setup
    - Afternoon
        - API
        - Front end bare bones
- Wednesday
    - Morning
        - Auth
    - Afternoon
        - Deploying
- Thursday
    - Finish styling
    - Testing
- Friday
    - Prepare presentation