package com.lp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lp.form.Product;
import com.lp.form.UserForm;

public class AppDAO {

	public static int isValidUser(String username,String password)
	{
		int roleId=0;

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select role_id from login where username='"+username+"' and password='"+password+"'");

			while (rs.next()) {

				roleId=rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return roleId;
	}

	public static int getUserType(String userName)
	{
		int role_id=0;

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select role_id from login where username='"+userName+"'");

			while(rs.next())
			{
				role_id=rs.getInt("role_id");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return role_id;
	}

	public static int updatePassword(String username,String oldPassword,String newPassword)
	{
		int result=0;

		try {
			PreparedStatement ps=MyConnection.getConnection().prepareStatement("update login set password=? where username=? and password=?");
			ps.setString(1,newPassword);
			ps.setString(2,username);
			ps.setString(3,oldPassword);

			result=ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public static int isUserRegistred(String username)
	{
		int result=0;

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select count(*) from login where username='"+username+"'");

			while (rs.next()) {

				result=rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
	public static int getUserPoints(String username)
	{
		int result=0;

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select points from registration where username='"+username+"'");

			while (rs.next()) {

				result=rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public static int userRegistration(UserForm userForm)
	{
		int role_id=2;

		int result=0; 

		try {

			if(isUserRegistred(userForm.getUserName())==0)
			{
				PreparedStatement ps2=MyConnection.getConnection().prepareStatement("insert into login value(?,?,?)");

				ps2.setString(1,userForm.getUserName());
				ps2.setString(2,userForm.getPassword());
				ps2.setInt(3,role_id);
				
				ps2.executeUpdate();


				PreparedStatement ps=MyConnection.getConnection().prepareStatement("insert into registration values(?,?,?,?,?,?)");
				
				System.out.println("name dao is "+userForm.getUserName());
				
				ps.setString(1,userForm.getUserName());
				ps.setString(2,userForm.getName());
				ps.setString(3,userForm.getEmail());
				ps.setLong(4,userForm.getMobile());
				ps.setString(5,userForm.getAddress());
				ps.setInt(6,100);
				
				if(ps.executeUpdate()==1)
				{
					result=1;
				}
				else
				{
					MyConnection.getConnection().createStatement().executeUpdate("delete from login where username='"+userForm.getUserName()+"'");
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
	
	
	public static UserForm getUserById(String userid)
	{
		UserForm userForm= new UserForm();

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select * from registration where username='"+userid+"'");

			while (rs.next()) {

				userForm.setUserName(rs.getString(1));
				userForm.setName(rs.getString(2));
				userForm.setEmail(rs.getString(3));
				userForm.setMobile(rs.getLong(4));
				userForm.setAddress(rs.getString(5));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userForm;
	}
	
	//================================================================================================================================

	public static int addProdut(Product product)
	{
		int result=0; 

		try {
			PreparedStatement ps=MyConnection.getConnection().prepareStatement("insert into products values(null,?,?,?,?,?)");

			ps.setString(1,product.getName());
			ps.setString(2,product.getManifatcuredName());
			ps.setFloat(3,product.getPrice());
			ps.setString(4,product.getCategory());
			ps.setString(5,product.getDescription());


			result=ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}

	public static int updateProduct(Product p){
		int result = 0;
		try{
			System.out.println("product id is"+p.getId());
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("UPDATE products SET price=?,description=? where pid = ?");

			ps.setFloat(1,p.getPrice());
			ps.setString(2, p.getDescription());
			ps.setInt(3,p.getId());

			result = ps.executeUpdate();

			System.out.println("result value is"+result);

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;

	}
	
	public static int deleteProduct(int id){
		
		int result = 0;
		
		try{
			
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("delete from products where pid = ?");

			ps.setInt(1,id);

			result = ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;

	}

	//===============================================================================================
	
	
	public static int isCategoryExist(String category)
	{
		int result=0;

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select count(*) from category where name='"+category+"'");

			while (rs.next()) {

				result=rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public static int addCategory(String category)
	{
		int result=0; 

		try {

			PreparedStatement ps=MyConnection.getConnection().prepareStatement("insert into category values(?)");

			ps.setString(1,category);

			result=ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
	
	public static int deleteCategory(int id){
		
		int result = 0;
		
		try{
			
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("delete form category where pid = ?");

			ps.setInt(1,id);

			result = ps.executeUpdate();

		}catch(Exception e){
			System.out.println("not updated");
		}
		return result;

	}
	
	public static List<String> getCategoryList()
	{
		List<String> categoryList=new ArrayList<String>();

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select * from category");

			while (rs.next()) {

				categoryList.add(rs.getString("name"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return categoryList;
	}
	
	//=========================================================================================================================

	public static float getProductPrice(int productId)
	{
		float amt=0.0f; 

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select price from products where pid='"+productId+"'");

			while(rs.next())
			{
				amt=rs.getFloat(1);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return amt;
	}

	public static String getProductNameById(int productId)
	{
		String name=null;

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select name from products where pid='"+productId+"'");

			while(rs.next())
			{
				name=rs.getString(1);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return name;
	}
	
	public static List<Product> getProducts()
	{
		List<Product> productsList=new ArrayList<Product>();

		try {

			PreparedStatement ps=MyConnection.getConnection().prepareStatement("select * from products");

			ResultSet rs=ps.executeQuery();

			while (rs.next()) {

				Product product=new Product();
				
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setManifatcuredName(rs.getString(3));
				product.setPrice(rs.getFloat(4));
				product.setCategory(rs.getString(5));
				product.setDescription(rs.getString(6));

				productsList.add(product);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productsList;
	}
	
	public static Product getProductById(int pid)
	{
		Product product=new Product();

		try {

			PreparedStatement ps=MyConnection.getConnection().prepareStatement("select * from products where pid='"+pid+"'");

			ResultSet rs=ps.executeQuery();

			while (rs.next()) {

			
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setManifatcuredName(rs.getString(3));
				product.setPrice(rs.getFloat(4));
				product.setCategory(rs.getString(5));
				product.setDescription(rs.getString(6));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return product;
	}

	public static List<Product> getProductsByQuery(String query)
	{
		List<Product> productsList=new ArrayList<Product>();

		try {

			PreparedStatement ps=MyConnection.getConnection().prepareStatement("select * from products where name like '"+query+"' or mname like '"+query+"' or category like '"+query+"' or description like '"+query+"'");

			ResultSet srs =ps
					.executeQuery();

			while (srs.next()) {

				Product product=new Product();

				product.setId(srs.getInt(1));
				product.setName(srs.getString(2));
				product.setManifatcuredName(srs.getString(3));
				product.setPrice(srs.getFloat(4));
				product.setCategory(srs.getString(5));
				product.setDescription(srs.getString(6));

				productsList.add(product);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productsList;
	}
	
	//=======================================================================================================================================
	
	public static int addTransaction(int userid,int productid)
	{
		int result=0; 

		try {

			PreparedStatement ps=MyConnection.getConnection().prepareStatement("insert into transactions values(null,?,?,?)");

			ps.setInt(1,userid);
			ps.setInt(2,productid);
			ps.setString(2,"Orderec Received");

			result=ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
	}
	
	public static int deleteTransaction(int transactionid){
		
		int result = 0;
		
		try{
			
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("delete from transactions where id = ?");

			ps.setInt(1,transactionid);

			result = ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;

	}
	
	public static int updateTransactionStatus(int tid,String status){
		
		int result = 0;
		
		try{
			
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("update transactions set tstatus=? where id = ?");

			ps.setString(1,status);
			ps.setInt(2,tid);

			result = ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;

	}
	
	public static int updateProductStatus(int tid,String status){
		
		int result = 0;
		
		try{
			
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("update transactions set pstatus=? where id = ?");

			ps.setString(1,status);
			ps.setInt(2,tid);

			result = ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;

	}
	
	public static int updatePoints(String userid,int points){
		
		int result = 0;
		
		try{
			
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("update registration set points=points-? where username = ?");

			ps.setInt(1,points);
			ps.setString(2,userid);

			result = ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;

	}
	
	public static int addPoints(String userid,int points){
		
		int result = 0;
		
		try{
			
			PreparedStatement ps = MyConnection.getConnection().prepareStatement("update registration set points=points+? where username = ?");

			ps.setInt(1,points);
			ps.setString(2,userid);

			result = ps.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}
		return result;

	}
	
	
	public static List<Transaction> getTransactionsList()
	{
		List<Transaction> transactions=new ArrayList<Transaction>();

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select * from transactions");

			while (rs.next()) {
				
				Transaction transaction=new Transaction();
				
				transaction.setId(rs.getInt("id"));
				transaction.setUserid(rs.getString("userid"));
				transaction.setProductId(rs.getInt("productid"));
				
				transactions.add(transaction);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return transactions;
	}
	
	public static List<Transaction> getOthersTransactionsList(String user)
	{
		List<Transaction> transactions=new ArrayList<Transaction>();

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select * from transactions where userid!='"+user+"'");

			while (rs.next()) {
				
				Transaction transaction=new Transaction();
				
				transaction.setId(rs.getInt("id"));
				transaction.setUserid(rs.getString("userid"));
				transaction.setProductId(rs.getInt("productid"));
				
				transactions.add(transaction);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return transactions;
	}
	
	public static List<Transaction> getTransactionListByUser(String userid)
	{
		List<Transaction> transactions=new ArrayList<Transaction>();

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select * from transactions where userid='"+userid+"'");

			while (rs.next()) {
				
				Transaction transaction=new Transaction();
				
				transaction.setId(rs.getInt("id"));
				transaction.setUserid(rs.getString("userid"));
				transaction.setProductId(rs.getInt("productid"));
				
				transactions.add(transaction);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return transactions;
	}
	
	public static List<Transaction> getTransactionListByProduct(int productid)
	{
		List<Transaction> transactions=new ArrayList<Transaction>();

		try {

			ResultSet rs=MyConnection.getConnection().createStatement().executeQuery("select * from transactions where productid='"+productid+"'");

			while (rs.next()) {
				
				Transaction transaction=new Transaction();
				
				transaction.setId(rs.getInt("id"));
				transaction.setUserid(rs.getString("userid"));
				transaction.setProductId(rs.getInt("productid"));
				
				transactions.add(transaction);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return transactions;
	}
	
	public static Map<Integer,Integer> getTopListedProducts()
	{
		Map<Integer,Integer> topMap=new HashMap<Integer,Integer>();
		
		try {
			
			ArrayList<Integer> list=new ArrayList<Integer>();
			
			ResultSet rs1=MyConnection.getConnection().createStatement().executeQuery("SELECT DISTINCT productid FROM transactions");
			
			while(rs1.next())
			{
				list.add(rs1.getInt(1));
			}
	
			for(Integer i : list)
			{
				ResultSet rs2=MyConnection.getConnection().createStatement().executeQuery("SELECT count(productid) FROM transactions where productid='"+i+"'");
				
				while(rs2.next())
				{
					topMap.put(i,rs2.getInt(1));
				}
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		System.out.println(topMap);
		
		return topMap;
	} 
}
