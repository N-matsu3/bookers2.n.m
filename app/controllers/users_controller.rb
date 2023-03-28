class UsersController < ApplicationController

  def index
    @users = User.all
    @books = Book.all


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




  def edit
    @user = User.find(params[:id])

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


   private

  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
