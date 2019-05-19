package summer.list.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.list.dao.ListDAO;

@Service("listService")
public class ListServiceImpl implements ListService {
	@Resource(name="listDAO")
    private ListDAO listDAO;

    Logger log = Logger.getLogger(this.getClass());

	@Override
	public Map<String, Object> getTodoDetail(String list_key) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("list_key", list_key);
		return listDAO.getTodoDetail(param);
	}
}