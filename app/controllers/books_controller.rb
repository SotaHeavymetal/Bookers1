class BooksController < ApplicationController

  def top
  end
  
  def show
    @book=Book.find(params[:id]) 
  end

  def index
    @books=Book.all 
    @book=Book.new
  end

  def new
    @book=Book.new 
  end

  def create
    @book= Book.new(book_params)
    if @book.save
      flash[:success]="Book was successfully created."
    redirect_to book_path(@book)
    else
    render 'books/index'
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    if book.update(book_params)
      flash[:success]="Book was successfully updated."
    redirect_to (book)
    else
    render 'books/edit'
    end
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
