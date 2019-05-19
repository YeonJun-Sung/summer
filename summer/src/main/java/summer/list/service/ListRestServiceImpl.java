package summer.list.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.list.dao.ListRestDAO;

@Service("listRestService")
public class ListRestServiceImpl implements ListRestService {
	@Resource(name="listRestDAO")
    private ListRestDAO listRestDAO;

    Logger log = Logger.getLogger(this.getClass());

	@Override
	public List<Map<String, Object>> getList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return listRestDAO.getList(param);
	}

	@Override
	public int getListSize(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return listRestDAO.getListSize(param);
	}

	@Override
	public void editTodo(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		listRestDAO.editTodo(param);
		String date = (String) param.get("date");
		if(date != null && !date.equals(""))
			listRestDAO.editTodoDate(param);
	}

	@Override
	public void deleteTodo(List<Map<String, Object>> list) throws Exception {
		// TODO Auto-generated method stub
		listRestDAO.deleteTodoPriority(list);
		listRestDAO.deleteTodoStatus(list);
		listRestDAO.deleteTodo(list);
	}

	@Override
	public void setPriority(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		String pre = (String) param.get("pre_priority");
		String target = (String) param.get("priority");

		if(pre == null || pre.equals(""))
			listRestDAO.pushPriorityNum(param);
		else if(Integer.parseInt(pre) > Integer.parseInt(target))
			listRestDAO.pushPriorityNum(param);
		else if(Integer.parseInt(pre) < Integer.parseInt(target))
			listRestDAO.pullPriorityNum(param);
		listRestDAO.setPriority(param);
	}

	@Override
	public void updateStatus(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		listRestDAO.updateStatus(param);
	}

	@Override
	public String getPriority(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return listRestDAO.getPriority(param);
	}

	@Override
	public void removePriority(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		listRestDAO.removePriority(param);
		listRestDAO.pullPriorityNum(param);
	}

	@Override
	public void completeTodo(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		listRestDAO.completeTodo(param);
	}
}