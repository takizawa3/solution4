class BooksController < ApplicationController
  def new
     @book = Book.new
  end
  
   # 投稿データの保存
  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    if @booknew.save
      flash[:notice] = "successfully"
      redirect_to book_path(@booknew),method: :get
    else
      @user = current_user
      @books =Book.all
      
      flash[:notice] = "error"
      render :index
      # 上の違う
    end
  end

  def index
    @books =Book.all
    @user = current_user
    @booknew = Book.new
   
  end

  def show
    @book = Book.find(params[:id])
    @user= @book.user
    @books = Book.all
    @booknew = Book.new
    @post_comment = BookComment.new
  end
  
  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)  
    @book.user_id = current_user.id
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id),method: :get
  else
    flash[:notice] = "error"
    render :edit
  end
  end

  def edit
    @book = Book.find(params[:id])
    @user= @book.user
    if @user==current_user
      flash[:notice] = "successfully"
      @book = Book.find(params[:id])
    else
      @booknew = Book.new
      redirect_to books_path,method: :get
    end
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)if params[:book].present?
  end
end
