package WebSpyder;

import java.util.ArrayList;

public class WebCrawler {
	public static String GetBackURL(){
        runcrawler t1=new runcrawler();
        runcrawler t2=new runcrawler();
        runcrawler t3=new runcrawler();
        t1.start();
        t2.start();
        t3.start();     
        
        while(runcrawler.TheSize() < 3){
        }
        
        ArrayList<String> temp = runcrawler.GetData();
        String s = "";
        
        for(int i=0; i<temp.size(); i++){
        	s += "<a href=" + temp.get(i) + ">" + temp.get(i) + "<br>" + "<br>";
        }
        
        return s;
        
    }
	
	public static void main(String args[]) {
		System.out.println("In");
		System.out.println(GetBackURL());
		
	}
}
