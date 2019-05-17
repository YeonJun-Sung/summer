package summer.list.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summer.list.service.ListService;

@Controller
public class ListController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "listService")
	private ListService listService;
	
 	@RequestMapping(value = "/list/listPage.do")
	public ModelAndView listPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView("list/listPage");
		return mv;
	}
}
