package converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.dangerous.model.Regiao;
import br.com.ifpe.dangerous.model.RegiaoDao;

public class RegiaoConverter implements Converter<String, Regiao> {
	
	public Regiao convert(String id) {
			RegiaoDao dao = new RegiaoDao();
			return dao.buscarPorId(Integer.valueOf(id));
	}

}
