package summer.create.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.create.dao.CreateDAO;

@Service("createService")
public class CreateServiceImpl implements CreateService {
	@Resource(name="createDAO")
    private CreateDAO createDAO;

    Logger log = Logger.getLogger(this.getClass());
}