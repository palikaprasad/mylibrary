package au.com.ppalika.mylibrary.model;

/**
 * Created by ppalika
 */
public class Book {
    private int id;
    private String title;
    private String author;
    private String ISBN;
    
    
	public Book(int id, String title, String author, String iSBN) {
		this.id = id;
		this.title = title;
		this.author = author;
		ISBN = iSBN;
	}

	public Book() {
		super();
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", author=" + author + ", ISBN=" + ISBN + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

}
