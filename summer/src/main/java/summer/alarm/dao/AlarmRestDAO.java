package summer.alarm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import summer.common.dao.AbstractDAO;

@Repository("alarmRestDAO")
public class AlarmRestDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> expireTodo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("listRest.expireTodo", param);
	}

	public void updateExpireTodoStatus(List<Map<String, Object>> list) {
		// TODO Auto-generated method stub
		update("listRest.updateExpireTodoStatus", list);
	}
}