package summer.create.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import summer.create.service.CreateRestService;

@RestController
public class CreateRestController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "createRestService")
	private CreateRestService createRestService;
	
	@RequestMapping(value = "/createREST/saveTodo.do", method = RequestMethod.GET)
	public void saveTodo(HttpServletRequest req, HttpSession session) throws Exception {
		String subject = req.getParameter("subject");
		String date = req.getParameter("date");
		String contents = req.getParameter("contents");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("subject", subject);
		param.put("date", date);
		param.put("contents", contents);
		
		createRestService.saveTodo(param);
	}
}