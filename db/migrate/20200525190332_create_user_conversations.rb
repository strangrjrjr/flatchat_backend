class CreateUserConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_conversations do |t|
      t.boolean :admin
      t.integer :user_id
      t.integer :conversation_id
      t.timestamps
    end
  end
end
