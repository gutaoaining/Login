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

public class gradeShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException,IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");//设置输出编码,防止乱码
		PrintWriter out = response.getWriter();
		List<Map<String, Object>> listmap=new ArrayList<Map<String,Object>>();
		Map<String, Object> map=null;
		String sql=null;
		if(request.getParameter("keyword")==null){
			 sql="select * from physical_data limit 50";
		}else{
			String keyword=new String(request.getParameter("keyword").getBytes("ISO-8859-1"),"utf-8");
			sql="select * from physical_data where classname="+"'"+keyword+"'";
		    System.out.println(keyword);
		}
		ResultSet rs = null;
		try {
			rs=DB.getStatement().executeQuery(sql);
			while (rs.next()) {
				String stunumber=rs.getString("stunumber");
				String classname=rs.getString("classname");
				String name=rs.getString("name");
				String height=rs.getString("height");
				String weight=rs.getString("weight");
				String VitalCapacity=rs.getString("VitalCapacity");
				String run50=rs.getString("run50");
				String StandJump=rs.getString("StandJump");
				String SitReach=rs.getString("SitReach");
				String run800or1000=rs.getString("run800or1000");
				String situporChinning=rs.getString("situporChinning");
				map=new HashMap<String,Object>();
				map.put("stunumber", stunumber);
				map.put("classname",classname);
				map.put("name",name);
				map.put("height",height);
				map.put("weight", weight);
				map.put("VitalCapacity",VitalCapacity);
				map.put("run50",run50);
				map.put("StandJump",StandJump);
				map.put("SitReach",SitReach);
				map.put("run800or1000",run800or1000);
				map.put("situporChinning",situporChinning);
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
