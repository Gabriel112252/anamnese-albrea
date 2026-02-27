class UsersController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "Usuário atualizado com sucesso", status: :see_other
    else
      render :new
    end
  end

  def edit
  end

  def update
    if user_params[:password].blank?
      if @user.update(user_params.except(:password, :password_confirmation))
        redirect_to users_path, notice: "Usuário atualizado com sucesso", status: :see_other
      else
        render :edit
      end
    else
      if @user.update(user_params)
        redirect_to users_path, notice: "Usuário atualizado com sucesso", status: :see_other
      else
        render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end