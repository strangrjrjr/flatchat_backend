class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            serialized_user = ActiveModelSerializers::Adapter::Json.new(UserSerializer.new(user)).serializable_hash
            ActionCable.server.broadcast 'users_channel', serialized_user head :ok
        end
    end


    private

        def user_params
            params.require(:user).permit(:username, :password_digest, :first_name, :last_name)
        end
  
end
