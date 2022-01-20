class BooksController < ApplicationController

  def show
    @book=Book.find(params[:id]) 
  end

  def index
    @books=Book.all
  end

  def new
    @book=Book.new
    redirect_to books_path
  end

  def create
    @book= Book.new(book_params)
    if @book.save
      flash[:success]="Book was successfully updated."
    redirect_to books_path(@book.id)
    else
      flash.now[:danger]="失敗したよ。"
    render:new
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
    
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
