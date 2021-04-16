class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order
    @user = current_user
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
    @books = Book.page(params[:page]).reverse_order
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def  update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
