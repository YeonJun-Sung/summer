package summer.create.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface CreateRestService {
	void saveTodo(Map<String, Object> param) throws Exception;
}