class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @users = User.page(params[:page]).reverse_order
  end


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to "/books"
  end

  def show
    @book = Book.new
    @user = current_user
    @users = User.find(params[:id])
    @books = @users.books.page(params[:page]).reverse_order
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end

end
