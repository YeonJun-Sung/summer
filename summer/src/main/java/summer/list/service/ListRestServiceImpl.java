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
	public int getListSize() throws Exception {
		// TODO Auto-generated method stub
		return listRestDAO.getListSize();
	}

	@Override
	public void editTodo(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		listRestDAO.editTodo(param);
		String date = (String) param.get("date");
		if(date != null && date.equals(""))
			listRestDAO.editTodoDate(param);
	}

}