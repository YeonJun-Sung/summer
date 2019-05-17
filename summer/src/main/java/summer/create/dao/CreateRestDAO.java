package summer.create.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import summer.common.dao.AbstractDAO;

@Repository("createRestDAO")
public class CreateRestDAO extends AbstractDAO {

	public String saveTodo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		insert("createRest.saveTodo", param);
		String key = (String) param.get("list_key");
		return key;
	}

	public void saveTodoPriority(Map<String, Object> param) {
		// TODO Auto-generated method stub
		insert("createRest.saveTodoPriority", param);
	}

	public void saveTodoStatus(Map<String, Object> param) {
		// TODO Auto-generated method stub
		insert("createRest.saveTodoStatus", param);
	}
}