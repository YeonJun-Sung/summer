package summer.alarm.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface AlarmRestService {
	List<Map<String, Object>> expireTodo(Map<String, Object> param) throws Exception;
	void updateExpireTodoStatus(List<Map<String, Object>> list, String status) throws Exception;
	void updateExpireTodo(List<Map<String, Object>> list) throws Exception;
}