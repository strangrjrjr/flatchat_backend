class MessagesController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :logged_in?

    def create 
        conversation = Conversation.find(message_params[:conversation_id])
        message = Message.new(user_id: current_user.id, conversation_id: conversation.id, text: params[:message][:text])
        if message.save
            serialized_msg = ActiveModelSerializers::Adapter::Json.new(
                MessageSerializer.new(message)
            ).serializable_hash
            MessagesChannel.broadcast_to conversation, serialized_msg
            head :ok
        end
    end

    private
        def message_params
            params.require(:message).permit(:text, :user_id, :conversation_id)
        end

end
