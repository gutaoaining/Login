package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.bean.*;

public class listEdit extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String stunumber=request.getParameter("stunumber").toString();
		String stuname=request.getParameter("stuname").toString();
		String class_id=request.getParameter("class_id").toString();
		String class_name=request.getParameter("class_name").toString();
		String nationalid=request.getParameter("nationalid").toString();
		String sex=request.getParameter("sex").toString();
		String stu_sources=request.getParameter("stu_sources").toString();
		String birthday=request.getParameter("birthday").toString();
		String stu_enr=request.getParameter("stu_enr").toString();
		String per_id=request.getParameter("per_id").toString();
		String stu_adress=request.getParameter("stu_adress").toString();
	    System.out.println(stunumber);
		String sql="update tb_students set stuname='"+stuname+"',class_id='"+class_id+"',class_name='"+class_name+"',sex='"+sex+"',stu_sources='"+stu_sources+"',birthday='"+birthday+"',stu_enr='"+stu_enr+"',per_id='"+per_id+"',stu_adress='"+stu_adress+"',nationalid='"+nationalid+"' where stunumber="+stunumber;
		List<Map<Object, Object>> listmap=new ArrayList<Map<Object,Object>>();
		  Map<Object, Object> map=new HashMap<Object, Object>();
		try {
			if((stunumber!=null)&&(!(stunumber.equals("")))){
			DB.getStatement().executeUpdate(sql);
			map.put("success",true);
			map.put("message","³É¹¦£¡");
			listmap.add(map);
			Gson gson=new Gson();
			String json=gson.toJson(listmap);
			response.getWriter().write(json.toString());
			}else{
				map.put("success",false);
				map.put("message","Ê§°Ü£¡");
				listmap.add(map);
				Gson gson=new Gson();
				String json=gson.toJson(listmap);
				response.getWriter().write(json.toString());
			}
		} catch (Exception e) {
			map.put("success",false);
			map.put("message","Ê§°Ü£¡");
			listmap.add(map);
			Gson gson=new Gson();
			String json=gson.toJson(listmap);
			response.getWriter().write(json.toString());
		}
		try {
			DB.getStatement().close();
			DB.getConn().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
