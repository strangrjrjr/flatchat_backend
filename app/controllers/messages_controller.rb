class MessagesController < ApplicationController

    def create ## need to validate in this create message that a user has access to that specific conversatio
        conversation = Conversation.find(message_params[:conversation_id])
        message = Message.new(message_params)
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
