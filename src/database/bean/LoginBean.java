package database.bean;

import java.sql.*;
public class LoginBean {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   String name;
	   String pass; 
	   String user;
		   public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}

		public String getPass() {
			return pass;
		}

		public void setPass(String pass) {
			this.pass = pass;
		}

		public String getUser() {
			return user;
		}

		public void setUser(String user) {
			this.user = user;
		}
	   public LoginBean(){
	       try {
	         Class.forName("org.gjt.mm.mysql.Driver");
	       }catch(java.lang.ClassNotFoundException e){
	    	   System.out.println(e.getMessage());
	       }
	  
	   }
	   public ResultSet executeQuery(String sql){
		   try{
			   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
			   stmt = conn.createStatement();
			   rs=stmt.executeQuery(sql);
		   }catch(SQLException e){
			   System.out.println(e.getMessage());
		   }finally{}
		   return rs;     
	   }
      public int checkManager(){
    	  int flags=0;
    	  LoginBean conn=new LoginBean();
    	  System.out.println(name);
    	  System.out.println(pass);
    	  System.out.println(user);
    	  if(user.equals("π‹¿Ì‘±")){
    	  String sql="select pass from manager where name="+"'"+name+"'";
    	  ResultSet rs=conn.executeQuery(sql);
    	  if ((name != null) && (!name.equals("")))
			try {
				while (rs.next()) {
				   String s = null;
				try {
					s = rs.getString("pass");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				    if (s.equals(pass)){ 
				    flags=1;
				    }        
                 return flags;
             }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	  }else{
    		  String sql="select pass from user where name="+"'"+name+"'";
        	  ResultSet rs=conn.executeQuery(sql);
        	  if ((name != null) && (!name.equals("")))
    			try {
    				while (rs.next()) {
    				   String s = null;
    				try {
    					s = rs.getString("pass");
    				} catch (SQLException e) {
    					// TODO Auto-generated catch block
    					e.printStackTrace();
    				}
    				    if (s.equals(pass)){ 
    				    flags=2;
    				    }        
                     return flags;
                 }
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    	  }
		return flags;
	   
}
}
