package dashboard;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.klab.ibatis.SqlSessionManager;
import com.klab.svc.IAction;


@WebServlet("/HkmcDashBoard")
public class DashboardAction extends HttpServlet
{
	/**
	 * @author 김희은 (khe930@kr.ibm.com)
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		JsonObject result = new JsonObject();
		try
		{			
			Map<String, Object> resText = null;
			
			List list = SqlSessionManager.getSqlMapClient().queryForList("HKMCDash.cntCall1R"); //Real-time call total
			if ( list.size() > 0 )
				resText = (Map<String, Object>)list.get(0);	
			result.addProperty("cnt1", resText.toString());
			
			List list2 = SqlSessionManager.getSqlMapClient().queryForList("HKMCDash.cntCall2R"); //Real-time call pass
			if ( list2.size() > 0 )
				resText = (Map<String, Object>)list2.get(0);
			result.addProperty("cnt2", resText.toString());
			
			List list3 = SqlSessionManager.getSqlMapClient().queryForList("HKMCDash.cntCall1T"); //Real-time call pass
			if ( list3.size() > 0 )
				resText = (Map<String, Object>)list3.get(0);
			result.addProperty("cnt3", resText.toString());
			
			List list4 = SqlSessionManager.getSqlMapClient().queryForList("HKMCDash.cntCall2T"); //Real-time call pass
			if ( list4.size() > 0 )
				resText = (Map<String, Object>)list4.get(0);
			result.addProperty("cnt4", resText.toString());
			
		}catch(Exception ex) {
			ex.printStackTrace();
			result.addProperty("returnCode", "FAIL");
			result.addProperty("results", ex.getMessage());
		}
		response.setContentType("text/plain; charset=utf-8");
        response.getWriter().print(result.toString());
	}
}
