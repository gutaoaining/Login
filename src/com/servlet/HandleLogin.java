package com.servlet;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.bean.*;
public class HandleLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		String user=request.getParameter("user");
		System.out.println(name+" ,"+pass+","+user);
		//request.setCharacterEncoding("gb2312");
		ResultSet rs = null;
			if(user.equals("管理员")){
			try {
				rs=DB.getStatement().executeQuery("select pass from manager where name="+"'"+name+"'"+" "+"and"+" "+"pass="+"'"+pass+"'");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			boolean m = false;
			try {
				m = rs.next();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(m==true){
				response.sendRedirect("Firstpage.jsp"); 
			}else{
				response.sendRedirect("MyJsp.jsp");
			}
			}else{
				if(user.equals("普通用户")){
					try {
						rs=DB.getStatement().executeQuery("select pass from user where name="+"'"+name+"'"+" "+"and"+" "+"pass="+"'"+pass+"'");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					boolean m = false;
					try {
						m = rs.next();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(m==true){
						response.sendRedirect("Second.jsp"); 
					}else{
						response.sendRedirect("MyJsp.jsp");
					}
			}
			} 
		}
}
