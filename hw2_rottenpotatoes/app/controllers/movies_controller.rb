class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    if( (!params.has_key?(:ratings) && session.has_key?(:ratings)) || (!params.has_key?(:order) && session.has_key?(:order))  )
      puts "HERE!"
      params[:ratings] ||= session[:ratings]
      params[:order] ||= session[:order]
      session.clear
      redirect_to movies_path(params)
    end
    session[:ratings] = params[:ratings] 
    session[:order] = params[:order]
    @all_ratings =  Movie.all_ratings
    @filtered_ratings =  params[:ratings] ? params[:ratings].keys : @all_ratings
    order =  params[:order] 
    @movies = Movie.find(:all, :conditions => {:rating => @filtered_ratings}, :order => order )
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
