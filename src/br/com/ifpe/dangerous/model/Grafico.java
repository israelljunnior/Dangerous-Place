package br.com.ifpe.dangerous.model;

import java.io.File;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import br.com.ifpe.dangerous.model.*;

public class Grafico {

  public void gerarGrafico() throws Exception {
	  MunicipioCvpDao dao = new MunicipioCvpDao();
      MunicipioCvp mCvp = dao.buscarPorId(1);
      System.out.println(mCvp);
      
      DefaultPieDataset dataset = new DefaultPieDataset( );
      dataset.setValue("Assassinatos", new Double( 30 ) );
      dataset.setValue("Acidentes de Trânsito", new Double( 30 ) );
      dataset.setValue("Assaltos",  new Double ( mCvp.getTotal() ));
      
      
      
      JFreeChart chart = ChartFactory.createPieChart(
         "Estatisticas de "+mCvp.getMunicipio().getNomeMunicipio(),dataset,true,true,true);
         
      int width = 640;   
      int height = 480;  
      File pieChart = new File( "chat15.png" ); 
      ChartUtilities.saveChartAsPNG( pieChart , chart , width , height );   
      
   }
}
