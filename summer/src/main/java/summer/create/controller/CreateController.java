package summer.create.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summer.create.service.CreateService;

@Controller
public class CreateController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "createService")
	private CreateService createService;
	
 	@RequestMapping(value = "/create/createPage.do")
	public ModelAndView createPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView("create/createPage");
		return mv;
	}
}
