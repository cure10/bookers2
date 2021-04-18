class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to "/books"
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @book_new = Book.new
    @user = current_user
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def  update
    # @book = Book.find(params[:id])
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
    params.require(:book).permit(:title, :body)
  end
end
