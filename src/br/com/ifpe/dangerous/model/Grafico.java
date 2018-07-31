package br.com.ifpe.dangerous.model;

import java.io.File;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

public class Grafico {

  public static void main( String[ ] args ) throws Exception {
      DefaultPieDataset dataset = new DefaultPieDataset( );
      dataset.setValue("Assassinatos", new Double( 20 ) );
      dataset.setValue("Acidentes de Trânsito", new Double( 20 ) );
      dataset.setValue("Assaltos", new Double( 40 ) );    

      JFreeChart chart = ChartFactory.createPieChart(
         "Estatisticas Pernambuco",dataset,true,true,false);
         
      int width = 640;   
      int height = 480;  
      File pieChart = new File( "chil.png" ); 
      ChartUtilities.saveChartAsPNG( pieChart , chart , width , height );   
   }
}
