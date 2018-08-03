package br.com.ifpe.dangerous.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.dangerous.model.Municipio;
import br.com.ifpe.dangerous.model.MunicipioDao;

public class MunicipioConverter implements Converter<String, Municipio> {
	
	public Municipio convert(String id) {
			MunicipioDao dao = new MunicipioDao();
			return dao.buscarPorId(Integer.valueOf(id));
	}
	
}
