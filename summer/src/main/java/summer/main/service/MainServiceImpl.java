package summer.main.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.main.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	@Resource(name="mainDAO")
    private MainDAO mainDAO;

    Logger log = Logger.getLogger(this.getClass());
}