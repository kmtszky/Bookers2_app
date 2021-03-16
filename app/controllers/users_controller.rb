class UsersController < ApplicationController
  before_action :new_book_registration, only: [:index, :show]

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end

  end

  private

  def new_book_registration
    @book = Book.new
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
