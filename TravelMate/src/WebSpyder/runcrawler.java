package WebSpyder;

import java.util.ArrayList;

public class runcrawler extends Thread{
	 	String s1="<a href=\"http://";
	    String url="http://www.roadtripamerica.com/forum/";
	    static int i=0;
	    static ArrayList<String> urlconntion=new ArrayList<String>();   
	    static ArrayList<String> result = new ArrayList<String>();

	    public void run() {

	        newCrawler cr=new newCrawler(url,s1,urlconntion);
	        String s2=cr.find();
	        while(urlconntion.size() <= 20){
	            synchronized(this)
	            {
	            if(s2==null){
	                cr=new newCrawler(url,s1,urlconntion);
	                s2=cr.find();
	                 }
	            //System.out.println(s2);
	            if(!s2.equals(null)){
	            	cr=new newCrawler(s2, s1,urlconntion);
	            	urlconntion.add(s2);  
	            }      
	            s2=cr.find();       
	            }
	        }
	        while(result.size() <= 3){
		        for(int i=0; i<urlconntion.size(); i++){
		        	if(urlconntion.get(i).contains("list") || urlconntion.get(i).contains("content")){
		        		result.add(urlconntion.get(i));
		        	}
		        }
	        }
	    }   
	    
	    public static int TheSize(){
	    	System.out.print("");
	    	return result.size();
	    }
	    
	    public static ArrayList<String> GetData(){
	    	return result;
	    }
}
