package summer.alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.alarm.dao.AlarmRestDAO;
import summer.list.dao.ListRestDAO;

@Service("alarmRestService")
public class AlarmRestServiceImpl implements AlarmRestService {
	@Resource(name="alarmRestDAO")
    private AlarmRestDAO alarmRestDAO;

	@Resource(name="listRestDAO")
    private ListRestDAO listRestDAO;

    Logger log = Logger.getLogger(this.getClass());

	@Override
	public List<Map<String, Object>> expireTodo(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		
		return alarmRestDAO.expireTodo(param);
	}

	@Override
	public void updateExpireTodoStatus(List<Map<String, Object>> list, String status) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("status", status);
		
		for(int i = 0;i < list.size();i++) {
			String list_key = (String) list.get(i).get("list_key");
			param.put("list_key", list_key);
			listRestDAO.updateStatus(param);
		}
	}

	@Override
	public void updateExpireTodo(List<Map<String, Object>> list) throws Exception {
		// TODO Auto-generated method stub
		for(int i = 0;i < list.size();i++) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("list_key", list.get(i).get("list_key"));
			String priority = listRestDAO.getPriority(param);
			
			if(priority != null && !priority.equals("")) {
				param.put("priority", priority);
				listRestDAO.removePriority(param);
				listRestDAO.pullPriorityNum(param);
			}
		}
	}
}