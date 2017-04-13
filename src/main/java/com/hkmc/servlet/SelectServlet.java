package com.hkmc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.klab.ibatis.SqlSessionManager;

/**
 * @author 최의신 (choies@kr.ibm.com)
 *
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
    	String sqlMap = request.getParameter("sqlMap");
    	
		if ( sqlMap != null )
		{
			JsonObject result = new JsonObject();
			
			try
			{
				System.out.println("@.@ MAP ID = " + sqlMap);
				
				Object rs = SqlSessionManager.getSqlMapClient().queryForList(sqlMap);
				
				System.out.println("@.@ MAP QUERY : " + rs.toString());	
				
				result.addProperty("returnCode", "OK");
				result.addProperty("results", rs.toString());
			}catch(Exception ex) {
				result.addProperty("returnCode", "FAIL");
				result.addProperty("results", ex.getMessage());
			}
			
			response.setContentType("text/plain");
	        response.getWriter().print(result.toString());
		}
		else {
			response.setContentType("text/plain");
	        response.getWriter().print("ERROR");
		}
	}
}
