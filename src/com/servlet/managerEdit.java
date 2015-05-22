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

public class managerEdit extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String stunumber=request.getParameter("stunumber").toString();
		String classname=request.getParameter("classname").toString();
		String name=request.getParameter("name").toString();
		String height=request.getParameter("height").toString();
		String weight=request.getParameter("weight").toString();
		String VitalCapacity=request.getParameter("VitalCapacity").toString();
		String run50=request.getParameter("run50").toString();
		String StandJump=request.getParameter("StandJump").toString();
		String SitReach=request.getParameter("SitReach").toString();
		String run800or1000=request.getParameter("run800or1000").toString();
		String situporChinning=request.getParameter("situporChinning").toString();
		String sql="update physical_data set classname='"+classname+"',name='"+name+"',height='"+height+"',weight='"+weight+"',VitalCapacity='"+VitalCapacity+"',run50='"+run50+"',StandJump='"+StandJump+"',SitReach='"+SitReach+"',run800or1000='"+run800or1000+"',situporChinning='"+situporChinning+"' where stunumber="+stunumber;
		List<Map<Object, Object>> listmap=new ArrayList<Map<Object,Object>>();
		  Map<Object, Object> map=new HashMap<Object, Object>();
		try {
			if((stunumber!=null)&&(!(stunumber.equals("")))){
			DB.getStatement().executeUpdate(sql);
			map.put("success", true);
			map.put("message", "成功");
			listmap.add(map);
			Gson gson=new Gson();
			String json=gson.toJson(listmap);
			response.getWriter().write(json.toString());
			}else{	
				map.put("success",false);
				map.put("message","失败！");
				listmap.add(map);
				Gson gson=new Gson();
				String json=gson.toJson(listmap);
				response.getWriter().write(json.toString());
			}
		} catch (Exception e) {
			map.put("success",false);
			map.put("message","失败！");
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
