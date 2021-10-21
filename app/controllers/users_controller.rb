class UsersController < ApplicationController
  def create
    user = User.new(book_params)
     @user.save
    redirect_to usr_path(user.id)
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
     redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
     render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
