package summer.create.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import summer.create.service.CreateRestService;

@RestController
public class CreateRestController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "createRestService")
	private CreateRestService createRestService;
	
	@RequestMapping(value = "/createREST/saveTodo.do", method = RequestMethod.POST)
	public void saveTodo(HttpServletRequest req, HttpSession session) throws Exception {
		try {
			String subject = (String) req.getAttribute("subject");
			String date = (String) req.getAttribute("date");
			String contents = (String) req.getAttribute("contents");
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("subject", subject);
			param.put("date", date);
			param.put("contents", contents);
			
			createRestService.saveTodo(param);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}