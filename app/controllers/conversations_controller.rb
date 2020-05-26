class ConversationsController < ApplicationController

    def index
        conversations = Conversation.all
        render json: conversations
    end

    def create
        conversation = Conversation.new(conversation_params)
        if conversation.save
            serialized_convo = ActiveModelSerializers::Adapter::Json.new(ConversationSerializer.new(conversation)).serializable_hash
            ActionCable.server.broadcast 'conversations_channel', serialized_convo
            head :ok
        end
    end

    def delete
        conversation = Conversation.find(conversation_params)
        conversation.destroy
    end


    private

        def conversation_params
            params.require(:conversation).permit(:id, :title, :description)
        end
end
