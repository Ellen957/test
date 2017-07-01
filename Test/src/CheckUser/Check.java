/**
 * 
 */
package CheckUser;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Data.User;
import Util.DBConn;

/**
 * @author Administrator
 *
 */
public class Check {
	List<User> list =new  ArrayList<User>();
	public Check(){}
	
	public List ShowUser(){
		int num=0;
		ResultSet rs = null;
		DBConn conn = new DBConn();
		rs = conn.doSelect("select * from person");
		
		try{
			while(rs.next()){
				User user = new User();
				user.setID(rs.getInt("ID"));
				user.setName(rs.getString("Name"));
				user.setSex(rs.getString("Sex"));
				user.setAge(rs.getInt("Age"));
				
				list.add(user);
				num++;
			}
			System.out.println("读取了几条数据"+num);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean Del(int id){
		//查找是否有这条消息
		ResultSet rs = null;
		boolean Result = true;
		DBConn conn = new DBConn();
		rs = conn.doSelect("select * from person where ID = '"+id+"'");
		try {
			if(rs.next()){
				System.out.println("查询有此ID用户");
			}else
				return false;
			
			//删除此id用户
			Result = conn.doDelete("delete from person where ID = '"+id+"'");
			if(Result){
				System.out.println("删除成功");
				return Result;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return false;
	}

	public boolean Add(User user){
		ResultSet rs = null;
		boolean Result = false;
		DBConn conn = new DBConn();
		rs = conn.doAdd("insert into person values('"+user.getID()+"','"+user.getName()+"','"+user.getSex()+"','"+user.getAge()+"')");
		Result = true;
		return Result;
	}

	public boolean Edit(User user){
		boolean Result = false;
		DBConn conn = new DBConn();
		Result = conn.doUpdate("update person set Name = '"+user.getName()+"',Sex = '"+user.getSex()+"',Age = '"+user.getAge()+"' where ID = '"+user.getID()+"'");
		return Result;
	}
}
	
