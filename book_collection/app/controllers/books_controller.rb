class BooksController < ApplicationController
  def index #root
    @books = Book.all
  end
  

  def show #displays every attribute of a book entry
    @book = Book.find(params[:id])
  end


  def new #add new entry, default values for fields left empty
    @book = Book.new
    #list of genres to be used in dropdown
    @genre_list = ['Other', 'Action and Adventure', 'Classics', 'Comic Book/Graphic Novel', 'Detective and Mystery', 'Fantasy', 'Horror', 'Literary Fiction', 'Romance', 'Science Fiction', 'Short Story', 'Suspense and Thriller', 'Biography', 'History', 'Poerty', 'True Crime']
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book entry added successfully."
      redirect_to(books_path)
    else
      render('new')
    end
  end


  def edit #prepopulated with information
    @book = Book.find(params[:id])
    #list of genres to be used in dropdown
    @genre_list = ['Other', 'Action and Adventure', 'Classics', 'Comic Book/Graphic Novel', 'Detective and Mystery', 'Fantasy', 'Horror', 'Literary Fiction', 'Romance', 'Science Fiction', 'Short Story', 'Suspense and Thriller', 'Biography', 'History', 'Poerty', 'True Crime']
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book entry updated successfully."
      redirect_to(book_path(@book))
    else
      render('edit')
    end
  end


  def delete #confirm that user wants to delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Entry for the book '#{@book.title}' deleted successfully."
    redirect_to(books_path)
  end



  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end

end
