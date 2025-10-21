# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    redirect_to profile_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])
    
    # Verifica se o usuário existe e se a senha coincide
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login realizado com sucesso!'
    else
      flash.now[:alert] = 'Email ou senha inválidos'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logout realizado com sucesso!'
  end
end