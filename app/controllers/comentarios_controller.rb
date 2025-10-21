# app/controllers/comentarios_controller.rb
class ComentariosController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  
  def create
    @movie = Movie.find(params[:movie_id])
    @comentario = Comentario.new(comentario_params)
    @comentario.movie_id = @movie.id
    @comentario.user_id = current_user.id
    
    if @comentario.save
      redirect_to movie_path(@movie), notice: 'Comentário adicionado com sucesso!'
    else
      redirect_to movie_path(@movie), alert: 'Erro ao adicionar comentário.'
    end
  end
  
  def destroy
    @comentario = Comentario.find_by(id: params[:id], user_id: current_user.id)
    if @comentario
      @movie = Movie.find(@comentario.movie_id)
      @comentario.destroy
      redirect_to movie_path(@movie), notice: 'Comentário removido com sucesso!'
    else
      redirect_to movies_path, alert: 'Comentário não encontrado.'
    end
  end
  
  private
  
  def comentario_params
    params.require(:comentario).permit(:conteudo)
  end
end