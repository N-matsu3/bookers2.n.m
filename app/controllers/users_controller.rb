class UsersController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

  end

  def new
    @book = Book.new
    @user = User.new(user_params)
  end

  def create
    @books =Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id

     if @book.save
        flash[:notice] = "You have created book successfully."
      redirect_to '/books#show'
     else
      render :'/users/:id'
     end

  end

  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end


  def destroy
    @book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

   private

  def users_params
    params.require(:user).permit(:name, :introduction)
  end


end
