class UsersController < ApplicationController
  def new
  end
  # indexはいらないの？
  
  def index
     @user = current_user
     @books =Book.all
     @users=User.all
     @booknew = Book.new
    
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @booknew = Book.new
  end

  def edit
    @user = User.find(params[:id])
  if @user==current_user
    flash[:notice] = "successfully"
  else
    @user=current_user
    redirect_to user_path(@user.id)  
  end
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)  
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
