package com.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.bean.*;
public class Editdata extends HttpServlet {
   private static final long serialVersionUID=1L;
   public void init(ServletConfig config) throws ServletException{
	   super.init(config);
   }
   public void doGet(HttpServletRequest request,HttpServletResponse response)
   throws ServletException,IOException{
	   doPost(request,response);
   }
public void doPost(HttpServletRequest request,HttpServletResponse response)
   throws ServletException,IOException{
	   request.setCharacterEncoding("utf-8");
	   int n=Integer.parseInt(request.getParameter("sum").toString());
	   for(int i=0;i<n;i++){
		 String stu=String.valueOf(i);
		 String id=request.getParameter(stu);
		 String data[]=new String[8]; 
	     for(int j=0;j<8;j++){	    
	     String tem=String.valueOf(i)+"_"+String.valueOf(j);
	     data[j]=request.getParameter(tem).toString();
	     }
	    String sql="update physical_data set height='"+data[0]+"',weight='"+data[1]+"',VitalCapacity='"+data[2]+"',run50='"+data[3]+"',StandJump='"+data[4]+"',SitReach='"+data[5]+"',run800or1000='"+data[6]+"',situporChinning='"+data[7]+"' where stunumber="+id;
	     try {
			DB.getStatement().executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	   try {
			DB.getStatement().close();
			DB.getConn().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("/tablecheck.jsp");
		dispatcher.forward(request, response);
   }
}
