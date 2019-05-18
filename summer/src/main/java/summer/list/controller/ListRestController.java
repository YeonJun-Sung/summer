package summer.list.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import summer.list.service.ListRestService;

@RestController
public class ListRestController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "listRestService")
	private ListRestService listRestService;
	
	@RequestMapping(value = "/listREST/getList.do", method = RequestMethod.POST)
	public ResponseEntity<List<Map<String, Object>>> getList(HttpServletRequest req, HttpSession session) throws Exception {
		String offset = req.getParameter("offset");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("offset", offset);
		List<Map<String, Object>> list = listRestService.getList(param);
		
		return new ResponseEntity<List<Map<String, Object>>>(list, HttpStatus.OK);
	}
}