package application;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StrPrint {

			
			
		 public static <T> void removeDuplicates(List<T> list) {
		        List<T> uniqueList = new ArrayList<T>();
		        for (T item : list) {
		            boolean isDuplicate = false;
		            for (T uniqueItem : uniqueList) {
		                if (item.getClass().equals(uniqueItem.getClass()) && item.equals(uniqueItem)) {
		                    isDuplicate = true;
		                    break;
		                }
		            }
		            if (!isDuplicate) {
		            	System.out.println("!isDuplicate:"+!isDuplicate);
		            	
		                uniqueList.add(item);
		            }
		        }
		        list.clear();
		        list.addAll(uniqueList);
		    }

		    public static void main(String[] args) {
		      
		        
		        List<String> words = Arrays.asList("cat", "dog", "elephant", "cat", "lion");
		        ArrayList<List> array=new   ArrayList<List>(words);
		        
		        
		        
		        System.out.println("Before removing duplicates: " + array);

		        removeDuplicates(words);

		        System.out.println("After removing duplicates: " + array);
		    }
	
	
	}