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


@WebServlet("/timeCnt")
public class TimeCnt extends HttpServlet
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
			
			List list = SqlSessionManager.getSqlMapClient().queryForList("HKMCDash.cntTime"); //Real-time call total
			if ( list.size() > 0 )
				for(int i=0;i<list.size();i++){
					resText = (Map<String, Object>)list.get(i);		
					result.addProperty("cnt"+i, resText.toString());
				}
		}catch(Exception ex) {
			ex.printStackTrace();
			result.addProperty("returnCode", "FAIL");
			result.addProperty("results", ex.getMessage());
		}
		response.setContentType("text/plain; charset=utf-8");
        response.getWriter().print(result.toString());
	}
}
