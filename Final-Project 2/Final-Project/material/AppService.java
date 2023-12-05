package com.lp.business;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.lp.dao.AppDAO;
import com.lp.dao.Transaction;
import com.lp.form.Product;

public class AppService {

	public static Map<String,Integer> getUserRecomendations(String userid)
	{
		Map<String,Integer> frequencyMap=new HashMap<String,Integer>();
		
		List<Transaction> myTransactions=AppDAO.getTransactionListByUser(userid);
		
		System.out.println("my transactions\t"+myTransactions);
		
		List<Transaction> userTransactions=AppDAO.getOthersTransactionsList(userid);
		
		System.out.println("others transactions\t"+userTransactions);
		
		for(Transaction mytransaction : myTransactions)
		{
			for(Transaction usertransaction : userTransactions)
			{
				if(mytransaction.getProductId()==usertransaction.getProductId())
				{
					System.out.println("matched \t"+mytransaction.getProductId()+"\t"+usertransaction.getProductId());
					
					if(frequencyMap.containsKey(usertransaction.getUserid()))
					{
						System.out.println("in count updated");
						
						frequencyMap.put(usertransaction.getUserid(),frequencyMap.get(usertransaction.getUserid())+1);
					}
					else
					{
						System.out.println("in count setting");
						
						frequencyMap.put(usertransaction.getUserid(),1);
					}
				}
			}
		}
		
	    MyComparator comp=new MyComparator(frequencyMap);

	    Map<String,Integer> newMap = new TreeMap<String, Integer>(comp);
	    newMap.putAll(frequencyMap);
	    
	    return newMap;
	}
	
	public static List<Product> getTopListedProducts()
	{
		List<Product> products=new ArrayList<Product>();
		
		Map<Integer,Integer> topMap=AppDAO.getTopListedProducts();
		
		MyComparator comp=new MyComparator(topMap);

	    Map<Integer,Integer> newMap = new TreeMap<Integer, Integer>(comp);
	    newMap.putAll(topMap);
	    
	    for(Integer i : newMap.keySet())
	    {
	    	products.add(AppDAO.getProductById(i));
	    }
	    
	    System.out.println(products);
	    
	    return products;
	}
	
	static class MyComparator implements Comparator {

		Map map;

		public MyComparator(Map map) {
			this.map = map;
		}

		public int compare(Object o1, Object o2) {
			
			Integer i1=(Integer)map.get(o2);
			Integer i2=(Integer)map.get(o1);
			
			if(i1<i2)
			{
				return 1;
				
			}
			
			return -1;
		}
	}
}
