package summer.alarm.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import summer.alarm.dao.AlarmDAO;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {
	@Resource(name="alarmDAO")
    private AlarmDAO alarmDAO;

    Logger log = Logger.getLogger(this.getClass());
}