package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.bean.*;

public class listDel extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String stunumber=request.getParameter("stunumber").toString();
		String sql="delete from tb_students where stunumber="+stunumber;
		System.out.println(sql);
		try {
			DB.getStatement().executeUpdate(sql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			DB.getStatement().close();
			DB.getConn().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
