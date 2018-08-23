package br.com.ifpe.dangerous.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.dangerous.model.Tema;
import br.com.ifpe.dangerous.model.TemaDao;

public class TemaConverter implements Converter<String, Tema> {
	public Tema convert(String id) {
		TemaDao dao = new TemaDao();
		return dao.buscarPorId(Integer.valueOf(id));
	}

}
