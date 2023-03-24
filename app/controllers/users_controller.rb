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
    @book = Book.find(params[:id])

    if @book.update(book_params)
       flash[:notice] = "Book was successfully created."

      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
