package WebSpyder;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

public class newCrawler {
	 String url=null;
	    String prefix=null;
	    ArrayList<String> address;

	    newCrawler(String url,String prefix, ArrayList<String> input){

	        this.url=url;
	        this.prefix=prefix;
	        address = input;

	    }

	    public String find(){
	        URL u=null;
	        URLConnection con=null;
	        BufferedReader bfr=null;
	        String rpurl=null;
	        try {
	            u=new URL(url);
	            con=u.openConnection();
	            con.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");  
	            InputStream is=con.getInputStream();
	            bfr=new BufferedReader(new InputStreamReader(is));
	            String s;
	            while((s=bfr.readLine())!=null){
	                if(s.indexOf(prefix)>=0)
	                     {
	                        rpurl=getUrl(s);
	                        if(urlrepetition(rpurl)!=-1){
	                            return rpurl;
	                        }
	                     }
	            }
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }finally{
	            try {
	                bfr.close();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	        return null;

	    }

	    public int urlrepetition(String rpurl){

	        for(int i=0; i<address.size(); i++){
	        	if(address.get(i).equals(rpurl)){
	        		return -1;
	        	}
	        }
	        return 1;
	    }

	    public String getUrl(String s){

	        int index1=s.indexOf(prefix);
	        s=s.substring(index1+9);
	        int index2=s.indexOf("\"");
	        s=s.substring(0,index2);
	        return s;
	    }

}
