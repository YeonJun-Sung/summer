package summer.create.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.create.dao.CreateRestDAO;

@Service("createRestService")
public class CreateRestServiceImpl implements CreateRestService {
	@Resource(name="createRestDAO")
    private CreateRestDAO createRestDAO;

    Logger log = Logger.getLogger(this.getClass());

	@Override
	public void saveTodo(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		String key = createRestDAO.saveTodo(param);
		param.put("list_key", key);
		createRestDAO.saveTodoPriority(param);
		createRestDAO.saveTodoStatus(param);
	}
}