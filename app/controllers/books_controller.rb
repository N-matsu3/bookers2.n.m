class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]


  def index
    @books = Book.all
    @newbook = Book.new
    @user = current_user
    @book = Book.new


  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.all

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
        redirect_to book_path(@book.id)
     else
        @newbook = Book.new
        @user = current_user
        render :index
     end

   end

  def edit
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

   def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
   end

end