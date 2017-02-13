package au.com.ppalika.mylibrary.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import au.com.ppalika.mylibrary.dao.impl.BooksDAOImpl;
import au.com.ppalika.mylibrary.dao.impl.MembersDAOImpl;
import au.com.ppalika.mylibrary.model.Book;
import au.com.ppalika.mylibrary.model.Member;
import au.com.ppalika.mylibrary.model.MemberBooks;

/**
 * @author ppalika
 * 
 * Main Controller for handling all incoming requests.
 */
@Controller
public class SpringController {
	
	private static final Logger logger = LoggerFactory.getLogger(SpringController.class);
	
	@Autowired
	BooksDAOImpl booksDAO;
	
	
	@Autowired
	MembersDAOImpl membersDAO;
	
	/**
	 * 
	 * @param locale
	 * @param model
	 * @return redirect path
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "redirect:/books";
	}
	
	/**
	 * 
	 * @param model
	 * @return model after populating the view and attributes
	 * @throws IOException
	 */
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public ModelAndView listBooks(ModelAndView model) throws IOException{
		
		logger.info("In books list request");
		
		List<Book> bookList=booksDAO.findAll();
		for (Book book : bookList) {
			logger.info(book.toString());
		}
		model.setViewName("listBooks");
		model.addObject("bookList" , bookList);
		return model;
	}
	
	/**
	 * 
	 * @param model
	 * @return model after populating the view and attributes
	 * @throws IOException
	 */
	@RequestMapping(value = "/members", method = RequestMethod.GET)
	public ModelAndView listMembers(ModelAndView model) throws IOException{
		
		logger.info("In Members list request");
		
		List<Member> membersList=membersDAO.findAll();
		for (Member member : membersList) {
			logger.info(member.toString());
		}
		model.setViewName("listMembers");
		model.addObject("membersList" , membersList);
		return model;
	}
	
	/**
	 * 
	 * @param model
	 * @return response as JSON string.
	 * @throws IOException
	 */
	@RequestMapping(value="/listBooks", params = "memberId",  method = RequestMethod.GET)
	public ResponseEntity<MemberBooks>  listBooksJson(@RequestParam("memberId") String memberId) throws IOException{
		
		logger.info("Retrieving books lent for memberId:" + memberId);
		MemberBooks memberBooks=membersDAO.getBooksByMemberId(memberId);
		
		return new ResponseEntity<MemberBooks>(memberBooks, HttpStatus.OK);
	}
	
	
}
