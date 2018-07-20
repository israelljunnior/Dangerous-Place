package br.com.ifpe.dangerous.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.dangerous.model.Adm;
import br.com.ifpe.dangerous.model.AdmDao;

public class AdmConverter  implements Converter<String, Adm> {

	public Adm convert(String id) {
		AdmDao dao = new AdmDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}

}
