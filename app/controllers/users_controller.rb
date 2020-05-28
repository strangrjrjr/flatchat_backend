class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: users
    end

    def create
        @user = User.create(user_params)
#         byebug
        if @user.valid?
            # serialized_user = ActiveModelSerializers::Adapter::Json.new(UserSerializer.new(user)).serializable_hash
            # ActionCable.server.broadcast 'users_channel', serialized_user
            # head :ok
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
