class UsersController < ApplicationController

  def create
    user = User.create(params.permit(:email, :password))
    if user
      render json: {token: user.attributes_with_token}, status: :created
    else
      render json: {message: "Creation failed!"}, status: :unprocessable_entity
    end
  end

end