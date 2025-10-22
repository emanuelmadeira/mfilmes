# app/controllers/comentarios_controller.rb
class ComentariosController < ApplicationController
  before_action :require_login, only: [:destroy]  # Apenas destroy requer login
  
  def create
    @movie = Movie.find(params[:movie_id])
    @comentario = Comentario.new(comentario_params)
    @comentario.movie_id = @movie.id
    
    # Se o usuário estiver logado, associa ao usuário
    if logged_in?
      @comentario.user_id = current_user.id
      @comentario.author_name = current_user.name  # Preenche automaticamente
    end
    
    if @comentario.save
      redirect_to movie_path(@movie), notice: 'Comentário adicionado com sucesso!'
    else
      redirect_to movie_path(@movie), alert: "Erro ao adicionar comentário: #{@comentario.errors.full_messages.join(', ')}"
    end
  end
  
  def destroy
    @comentario = Comentario.find_by(id: params[:id])
    
    # Só permite excluir se for o autor do comentário ou se for dono do filme
    if @comentario && (current_user.id == @comentario.user_id || current_user.id == @comentario.movie.user_id)
      @movie = @comentario.movie
      @comentario.destroy
      redirect_to movie_path(@movie), notice: 'Comentário removido com sucesso!'
    else
      redirect_to movies_path, alert: 'Você não tem permissão para excluir este comentário.'
    end
  end
  
  private
  
  def comentario_params
    params.require(:comentario).permit(:conteudo, :author_name)
  end
end