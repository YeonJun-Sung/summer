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
	
	@RequestMapping(value = "/listREST/getList.do", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> getList(HttpServletRequest req, HttpSession session) throws Exception {
		String offset = req.getParameter("offset");
		String check = req.getParameter("check");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("offset", offset);
		param.put("check", check);
		try {
			List<Map<String, Object>> list = listRestService.getList(param);
			
			return new ResponseEntity<List<Map<String, Object>>>(list, HttpStatus.OK);
		}
		catch (Exception e) {
			return new ResponseEntity<List<Map<String, Object>>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/listREST/getListSize.do", method = RequestMethod.GET)
	public ResponseEntity<Integer> getListSize(HttpServletRequest req, HttpSession session) throws Exception {
		String check = req.getParameter("check");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("check", check);
		try {
			int list_size = listRestService.getListSize(param);
			
			return new ResponseEntity<Integer>(list_size, HttpStatus.OK);
		}
		catch (Exception e) {
			return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/listREST/editTodo.do", method = RequestMethod.POST)
	public void editTodo(HttpServletRequest req, HttpSession session) throws Exception {
		try {
			String subject = req.getParameter("subject");
			String date = req.getParameter("date");
			String contents = req.getParameter("contents");
			String list_key = req.getParameter("list_key");
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("subject", subject);
			param.put("date", date);
			param.put("contents", contents);
			param.put("list_key", list_key);
			
			listRestService.editTodo(param);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/listREST/deleteTodo.do", method = RequestMethod.POST)
	public void deleteTodo(HttpServletRequest req, HttpSession session) throws Exception {
		try {
			String list_key = req.getParameter("list_key");
			String[] key_arr = list_key.split("/");
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			for(int i = 0;i < key_arr.length;i++) {
				if(key_arr[i] != null && !key_arr[i].equals("")) {
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("list_key", key_arr[i]);
					list.add(param);
				}
			}
			
			listRestService.deleteTodo(list);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/listREST/setPriority.do", method = RequestMethod.POST)
	public void setPriority(HttpServletRequest req, HttpSession session) throws Exception {
		try {
			String priority = req.getParameter("priority");
			String list_key = req.getParameter("list_key");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("priority", priority);
			param.put("list_key", list_key);
			String pre_priority = listRestService.getPriority(param);

			param.put("pre_priority", pre_priority);
			listRestService.setPriority(param);
			
			param.put("status", 1);
			listRestService.updateStatus(param);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/listREST/removePriority.do", method = RequestMethod.POST)
	public void removePriority(HttpServletRequest req, HttpSession session) throws Exception {
		try {
			String list_key = req.getParameter("list_key");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("list_key", list_key);
			String priority = listRestService.getPriority(param);
			
			param.put("priority", priority);
			listRestService.removePriority(param);
			
			param.put("status", 2);
			listRestService.updateStatus(param);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}