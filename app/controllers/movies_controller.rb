# app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  
  def index
    @movies = Movie.all.order(created_at: :desc)
  end
  
  def new
    @movie = current_user.movies.new
  end
  
  def create
    @movie = current_user.movies.new(movie_params)
    
    if @movie.save
      redirect_to movies_path, notice: 'Filme adicionado com sucesso!'
    else
      render :new
    end
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def edit
    @movie = current_user.movies.find(params[:id])
  end
  
  def update
    @movie = current_user.movies.find(params[:id])
    
    if @movie.update(movie_params)
      redirect_to movies_path, notice: 'Filme atualizado com sucesso!'
    else
      render :edit
    end
  end
  
  def destroy
    @movie = current_user.movies.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: 'Filme removido com sucesso!'
  end
  
  private
  
  def movie_params
    params.require(:movie).permit(:title, :description, :genre, :release_year)
  end
end