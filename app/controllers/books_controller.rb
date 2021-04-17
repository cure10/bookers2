class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = @user.books
    if @book.save
      flash[:notice] = "successfully"
      redirect_to "/books"
    else
      render :index
    end
  end

  def show
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def  update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
