package summer.alarm.controller;

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
import summer.alarm.service.AlarmRestService;

@RestController
public class AlarmRestController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "alarmRestService")
	private AlarmRestService alarmRestService;

	@RequestMapping(value = "/alarmREST/expireTodo.do")
	public ResponseEntity<List<Map<String, Object>>> expireTodo(HttpServletRequest req, HttpSession session) throws Exception {
		try {
			String check = req.getParameter("check");
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("check", check);
			List<Map<String, Object>> list = alarmRestService.expireTodo(param);

			alarmRestService.updateExpireTodo(list);
			alarmRestService.updateExpireTodoStatus(list, "0");
			
			return new ResponseEntity<List<Map<String, Object>>>(list, HttpStatus.OK);
		}
		catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<Map<String, Object>>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/alarmREST/alarmCompleteExpireTodo.do")
	public void alarmCompleteExpireTodo(HttpServletRequest req, HttpSession session) throws Exception {
		try {
			String list_keys = req.getParameter("list_keys");
			String[] list_key = list_keys.split("/");
			
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			for(int i = 0;i < list_key.length;i++) {
				if(list_key != null && !list_key[i].equals("")) {
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("list_key", list_key[i]);
					list.add(param);
				}
			}
			
			alarmRestService.updateExpireTodoStatus(list, "-1");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}