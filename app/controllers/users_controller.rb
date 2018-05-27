class UsersController < ApplicationController

  def create
    user = User.create(params.permit(:email, :password))
    if user && user.persisted?
      render json: {user: user.attributes_with_token}, status: :created
    else
      render json: {message: "Creation failed!"}, status: :unprocessable_entity
    end
  end

  def authenticate
    token = request.headers['Authorization']
    command = AuthenticateUser.call(token: token)
    if command.success?
      render json: command.result, status: :ok
    else
      render json: command_error_json(command), status: :unauthorized
    end
  end

end