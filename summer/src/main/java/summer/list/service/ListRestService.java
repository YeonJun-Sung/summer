package summer.list.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface ListRestService {

	List<Map<String, Object>> getList(Map<String, Object> param) throws Exception;
	int getListSize() throws Exception;
	void editTodo(Map<String, Object> param) throws Exception;
	void deleteTodo(List<Map<String, Object>> list) throws Exception;
}