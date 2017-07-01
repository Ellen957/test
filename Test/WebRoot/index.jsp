<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="CheckUser.Check" %>
<%@ page import="Data.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	//执行删除servlet
		function del(id){
			if(confirm("确认删除？"))
				{
					var choice = document.getElementById("del");
					choice.action = "http://localhost:8080/Test/Del?id="+id+"";
					choice.method="post";
					choice.submit();
					
				}
			else{
				alert("cancel");
				
			}
		}
	
	function Add(btn){
		
			var tab = document.getElementById("table");
			var tab2 = btn.parentNode.parentNode.rowIndex+1;
			
			var tr = tab.insertRow(tab2);
			for(var i=0;i<5;i++){
				if(i==0){
					var td = tr.insertCell();
					td.innerHTML = "<input type='text'name='ID'/>";
				}
				if(i==1){
					var td = tr.insertCell();
					td.innerHTML = "<input type='text'name='Name' />";
				}
				if(i==2){
					var td = tr.insertCell();
					td.innerHTML = "<input type='text'name='Sex'/>";
				}if(i==3){
					var td = tr.insertCell();
					td.innerHTML = "<input type='text'name='Age'/>";
				}if(i==4){
					var td = tr.insertCell();
					td.innerHTML = "<input type='submit' onclick='add()'/>";
				}
				
			}
			
		
	}
	function add(){
		var choice = document.getElementById("del");
		choice.action = "http://localhost:8080/Test/Add";
		choice.method="post";
		choice.submit();			
	}
	
	function edit(userID,btn){
		var tab = document.getElementById("table");
		var tab2 = btn.parentNode.parentNode.rowIndex+1;
		var ID = parseInt(userID);
		
		var tr = tab.insertRow(tab2);
		for(var i=0;i<5;i++){
			if(i==0){
				var td = tr.insertCell();
				td.innerHTML = userID;
			}
			if(i==1){
				var td = tr.insertCell();
				td.innerHTML = "<input type='text'name='Name' />";
			}
			if(i==2){
				var td = tr.insertCell();
				td.innerHTML = "<input type='text'name='Sex'/>";
			}if(i==3){
				var td = tr.insertCell();
				td.innerHTML = "<input type='text'name='Age'/>";
			}if(i==4){
				var td = tr.insertCell();
				td.innerHTML = "<input type='submit' onclick='editInfor("+ID+")'/>";
			}
				
		}
		
	}
	function editInfor(userID){
		
		var choice = document.getElementById("del");
		choice.action = "http://localhost:8080/Test/Edit?userID="+userID+"";
		choice.method="post";
		choice.submit();	
	}
	</script>
  </head>
  
  <body>
  <form id="del">
    <table border=1px id="table">
	  	<tr >
	    	<th>ID</th>
	    	<th>姓名</th>
	    	<th>性别</th>
	    	<th>年龄</th>
	    	<th>编辑</th>
	    </tr>    
	      <%
  try{
  	Check check = new Check();
  		//读取所有如数放入List中 
  		List<User> list = (List<User>)check.ShowUser();
  		for(int i=0;i<list.size();i++){
  			User user = (User)list.get(i);
  			int id = user.getID();
  			//循环输出list
  			{
  				%>
  					<tr id="editorTr">
  						<td id="userID"><%=user.getID() %></td>
  						<td><%=user.getName() %></td>
  						<td><%=user.getSex()%></td>
  						<td><%=user.getAge() %></td>
  						<td>
	  						<input type="submit" value="删除" onclick="del(<%=id%>)"/>
	  						<input type="submit" value="添加"  onclick="Add(this);return false;"/>
	  						<input type="submit" value="编辑"onclick="edit(<%=user.getID() %>,this);return false"/>
  						</td>
  						
  					</tr>
  				<%
  			}
  		}
  }catch(NullPointerException e ){
  		e.printStackTrace();
  }
  		
   %>
  	</table>
  </form>


  </body>
</html>
