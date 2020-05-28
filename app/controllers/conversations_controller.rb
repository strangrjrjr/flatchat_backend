class ConversationsController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :logged_in?


    def index
        conversations = Conversation.all
        conversations = conversations.select{|conversation| conversation.users.map{|user| user.id}.include?(current_user.id)}
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
