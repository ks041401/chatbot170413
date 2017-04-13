package com.hkmc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.klab.svc.ConversationSession;
import com.klab.svc.WatsonConversation;

/**
 * @author 최의신 (choies@kr.ibm.com)
 *
 */
@WebServlet("/HkmcChatbot")
public class HkmcServlet extends HttpServlet
{
	private static final String ATTR_NAME = "Watson.Conversation";
	
	private WatsonConversation watsonConv;
	private ConversationLogger convLogger;
	
	@Override
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
		watsonConv = new WatsonConversation();
		
		convLogger = new ConversationLogger();
		convLogger.start();
	}

	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#destroy()
	 */
	@Override
	public void destroy()
	{
		convLogger.shutdown();
		super.destroy();
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		JsonObject result = new JsonObject();
		boolean isKr = "KR".equals(request.getParameter("lang"));
		
		System.out.println("@.@ " + request.getParameter("lang"));
		
		String text = request.getParameter("say");
		if ( text == null || text.length() == 0 )
		{
			result.addProperty("returnCode", "FAIL");
			result.addProperty("results", "EMPTY");
		}
		else {
			ConversationSession session = null;
			
			Object attr = request.getSession().getAttribute(ATTR_NAME);
			
			if ( attr == null ) {
				session = new ConversationSession();
				request.getSession().setAttribute(ATTR_NAME, session);
			}
			else {
				session = (ConversationSession)attr;
			}
			
			try
			{
				if ( "@@hello".equals(text) ) {
					session.getContext().clear();
					text = text.substring(2);
				}
				
				watsonConv.message(session, text, isKr);

				// 대화 저장
				session.setKorean(isKr);
				convLogger.addDialog(session);
				
				result.addProperty("returnCode", "OK");
				
				StringBuffer resText = new StringBuffer();
				List<String> list = session.getOutputString();
				for(int i = 0; i < list.size(); i++)
				{
					resText.append(list.get(i));
					if ( i < list.size()-1 )
						resText.append("<br>");
				}
				
//				result.addProperty("results", String.join("<br>", session.getOutputString()));
				result.addProperty("results", resText.toString());
				if ( session.getPostResult() != null )
					result.add("action", session.getPostResult());
				
				result.addProperty("debug", session.getDebug());
			}catch(Exception ex) {
				ex.printStackTrace();
				result.addProperty("returnCode", "FAIL");
				result.addProperty("results", ex.getMessage());
			}
		}
		
		response.setContentType("text/plain; charset=utf-8");
        response.getWriter().print(result.toString());
	}
}