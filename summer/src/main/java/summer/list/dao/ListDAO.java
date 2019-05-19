package summer.list.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import summer.common.dao.AbstractDAO;

@Repository("listDAO")
public class ListDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> getTodoDetail(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("list.getTodoDetail", param);
	}

}