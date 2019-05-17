package summer.alarm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import summer.alarm.service.AlarmService;

@Controller
public class AlarmController {
    Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "alarmService")
	private AlarmService alarmService;
	
 	@RequestMapping(value = "/alarm/alarmPage.do")
	public ModelAndView alarmPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView("alarm/alarmPage");
		
		return mv;
	}
}
