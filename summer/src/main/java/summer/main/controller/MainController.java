package summer.main.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summer.main.service.MainService;

@Controller
public class MainController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mainService")
	private MainService mainService;
	
 	@RequestMapping(value = "/main/mainPage.do")
	public ResponseEntity<ModelAndView> mainPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
		try {
			ModelAndView mv = new ModelAndView("main/mainPage");
			return new ResponseEntity<ModelAndView>(mv, HttpStatus.OK);
		}
		catch(Exception e) {
			return new ResponseEntity<ModelAndView>(HttpStatus.BAD_REQUEST);
		}
	}
}