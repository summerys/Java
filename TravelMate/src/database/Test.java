//package database;
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//
//import data.DataStorage;
//import data.*;
//
//public class Test {
//	public static DataStorage ds = new DataStorage();
//	public static void main(String [] args){
//		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//		SqlDriver sqld = new SqlDriver();
//		sqld.connect();
//		sqld.getAirportsData();
//		System.out.println(DataStorage.airportsMap);
//		System.out.println(DataStorage.airportsMap.size());
//		try{
//			
//		} catch(Exception e){
//			e.printStackTrace();
//		}
//		sqld.stop();
//		
//	}
//}