class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: users
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            UserConversation.create(user_id: @user.id, conversation_id: Conversation.first.id)
            @token = encode_token({ user_id: @user.id })
            render json: { jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end


    private

        def user_params
            params.require(:user).permit(:username, :password, :first_name, :last_name)
        end
  
end
