class UsersController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new

  end

  def new
    @book = Book.new
  end

  def create
    @books =Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id

     if @book.save
        flash[:notice] = "You have created book successfully."
      redirect_to '/books#show'
     else
      render :books
     end

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
  end

end
