package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.bean.*;
import com.google.gson.Gson;

public class listShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		//request.setCharacterEncoding("gbk");
		//   request.setCharacterEncoding("utf-8");
		String sql=null;
		PrintWriter out = response.getWriter();
		List<Map<String, Object>> listmap=new ArrayList<Map<String,Object>>();
		Map<String, Object> map=null;
		if(request.getParameter("data")==null){
			sql="select * from tb_students limit 50 ";
		}else{
			String keyword=new String(request.getParameter("data").getBytes("ISO-8859-1"),"utf-8");
			sql="select * from tb_students where class_name="+"'"+keyword+"'";
			System.out.println(sql);
		}
		
		ResultSet rs = null;
		try {
			rs=DB.getStatement().executeQuery(sql);
			while (rs.next()) {
				String stunumber=rs.getString("stunumber");
				String stuname=rs.getString("stuname");
				String class_id=rs.getString("class_id");
				String class_name=rs.getString("class_name");
				String nationalid=rs.getString("nationalid");
				String sex=rs.getString("sex");
				String stu_sources=rs.getString("stu_sources");
				String birthday=rs.getString("birthday");
				String stu_enr=rs.getString("stu_enr");
				String per_id=rs.getString("per_id");
				String stu_adress=rs.getString("stu_adress");
				map=new HashMap<String,Object>();
				map.put("stunumber", stunumber);
				map.put("stuname",stuname);
				map.put("class_id",class_id);
				map.put("class_name",class_name);
				map.put("nationalid",nationalid);
				map.put("sex", sex);
				map.put("stu_sources",stu_sources);
				map.put("birthday",birthday);
				map.put("stu_enr",stu_enr);
				map.put("per_id",per_id);
				map.put("stu_adress",stu_adress);
				listmap.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			rs.close();
			DB.getStatement().close();
			DB.getConn().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Gson gson=new Gson();//将List<Map<String, Object>>转为json数据
		String json=gson.toJson(listmap);
	    out.write(json.toString());
	}

}
