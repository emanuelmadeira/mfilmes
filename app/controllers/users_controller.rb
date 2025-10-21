
class UsersController < ApplicationController
  before_action :require_login, only: [:profile, :edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Conta criada com sucesso!'
    else
      render :new
    end
  end

  def profile
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Perfil atualizado com sucesso!'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: 'Por favor, faça login para acessar esta página.'
    end
  end
end