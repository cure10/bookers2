class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully!"
      redirect_to user_path(@user)
    else
      # @user = current_user
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    unless params[:id].to_i == current_user.id
    redirect_to user_path(current_user)
    end
  end

end

