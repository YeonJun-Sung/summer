package summer.list.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.list.dao.ListDAO;

@Service("listService")
public class ListServiceImpl implements ListService {
	@Resource(name="listDAO")
    private ListDAO listDAO;

    Logger log = Logger.getLogger(this.getClass());
}