class BooksController < ApplicationController
  before_action :new_book_registration, only: [:show, :index]

  def index
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id = @book.user_id
      render :edit
    else
      render :show
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
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

  def new_book_registration
    @book = Book.new
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end