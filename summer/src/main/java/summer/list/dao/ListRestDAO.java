package summer.list.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import summer.common.dao.AbstractDAO;

@Repository("listRestDAO")
public class ListRestDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("listRest.getList", param);
	}

	public int getListSize() {
		// TODO Auto-generated method stub
		return (int) selectOne("listRest.getListSize", "");
	}

	public void editTodo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.editTodo", param);
	}

	public void editTodoDate(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.editTodoDate", param);
	}

}