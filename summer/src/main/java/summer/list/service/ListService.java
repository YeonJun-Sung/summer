package summer.list.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface ListService {

	Map<String, Object> getTodoDetail(String list_key) throws Exception;
}