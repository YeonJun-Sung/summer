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

	public int getListSize(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (int) selectOne("listRest.getListSize", param);
	}

	public void editTodo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.editTodo", param);
	}

	public void editTodoDate(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.editTodoDate", param);
	}

	public void deleteTodo(List<Map<String, Object>> list) {
		// TODO Auto-generated method stub
		delete("listRest.deleteTodo", list);
	}

	public void deleteTodoPriority(List<Map<String, Object>> list) {
		// TODO Auto-generated method stub
		delete("listRest.deleteTodoPriority", list);
	}

	public void deleteTodoStatus(List<Map<String, Object>> list) {
		// TODO Auto-generated method stub
		delete("listRest.deleteTodoStatus", list);
	}

	public void pushPriorityNum(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.pushPriorityNum", param);
	}

	public void setPriority(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.setPriority", param);
	}

	public void updateStatus(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.updateStatus", param);
	}

	public String getPriority(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (String) selectOne("listRest.getPriority", param);
	}

	public void removePriority(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.removePriority", param);
	}

	public void pullPriorityNum(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.pullPriorityNum", param);
	}

	public void completeTodo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		update("listRest.completeTodo", param);
	}

}