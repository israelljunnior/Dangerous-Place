package br.com.ifpe.dangerous.converters;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.dangerous.model.Publicacao;
import br.com.ifpe.dangerous.model.PublicacaoDao;


public class PublicacaoConverter  implements Converter<String, Publicacao> {
	
	public Publicacao convert(String id) {
		PublicacaoDao dao = new PublicacaoDao();
			return dao.buscarPorId(Integer.valueOf(id));
	}

}
