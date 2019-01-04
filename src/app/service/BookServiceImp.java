package app.service;

import app.domain.Book;
import app.domain.Category;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookServiceImp implements BookService{
    private List<Category> categories;
    private List<Book> books;

    public BookServiceImp(){
        categories = new ArrayList<Category>();
        Category category1 = new Category(1, "computing");
        Category category2 = new Category(2, "Travel");
        Category category3 = new Category(3, "health");
        categories.add(category1);
        categories.add(category2);
        categories.add(category3);

        books = new ArrayList<Book>();
        books.add(new Book(1L, "343242342",
                "servlet", category1, "syw"));
        books.add(new Book(2L, "42342442",
                "japan", category2, "zzz"));
    }

    public List<Category> getAllCategories(){
        return categories;
    }

    public Category getCategory(int id){
        for(Category category : categories){
            if(category.getId() == id){
                return category;
            }
        }
        return null;
    }

    public List<Book> getAllBooks(){
        return books;
    }

    public Book save(Book book){
        book.setId(getNextId());
        books.add(book);
        return book;
    }

    public Book get(long id){
        for(Book book : books){
            if(id == book.getId()){
                return book;
            }
        }
        return null;
    }

    public Book update(Book book){
        int bookCount = books.size();
        for(int i = 0; i < bookCount; i++){
            Book savedBook = books.get(i);
            if(savedBook.getId() == book.getId()){
                books.set(i, book);
                return book;
            }
        }
        return null;
    }

    public Book getBook(long id){
        for(Book book : books){
            if(book.getId() == id){
                return book;
            }
        }
        return null;
    }

    public long getNextId(){
        long id = 0L;
        for(Book book : books){
            long bookId = book.getId();
            if(bookId > id){
                id = bookId;
            }
        }
        return id + 1;
    }
}
