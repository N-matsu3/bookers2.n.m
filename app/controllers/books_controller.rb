class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new
    @user = @book.user = current_user


  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user = current_user
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
      render :edit
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

end