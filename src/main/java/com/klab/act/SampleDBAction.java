package com.klab.act;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.klab.ibatis.SqlSessionManager;
import com.klab.svc.IAction;

/**
 * @author 최의신 (choies@kr.ibm.com)
 *
 */
public class SampleDBAction implements IAction
{
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Map<String, Object> doAction(String actionId, Map<String, Object> params)
	{
		Map<String, Object> rs = null;
		List rows;
		
		try
		{
			System.out.println(" !!!!!!!!!!!! actionId=" + actionId);
			System.out.println(" !!!!!!!!!!!! get params=" + params);
			switch (actionId) {
			// 선호하는 모델
			case "acarkind" : //차종정보
					//params.get("carkind");
				break;
				
			case "acaroption" : 
				//params.get("carkind");
				//params.get("caroption1");
				//params.get("caroption2");
				//params.get("caroption3");
				
				HashMap<String,String> map = new HashMap<String,String>();

				
				map.put("carkind",   "그랜저IG 자가용 디젤 2.2 모던");
				map.put("caroption1",   "파노라마 썬루프");
				map.put("caroption2",   "튜익스 컴포트 패키지");
				map.put("caroption3",   "");
				
				System.out.println("map=" + map);
				
			    rows = SqlSessionManager.getSqlMapClient().queryForList("HKMC.carOption",map);
				if ( rows.size() > 0 ) {
					rs = (Map<String, Object>)rows.get(0);
				}
				break;
				
			case "Model Range" : 
				break;
				
			case "Price for Gasoline 2.4 Premium" : 
				break;
				
			case "Car Detail Options" : 
				break;
				
			case "Best Selling Model" : 
				break;
				
			case "Price for Gasoline 2.4 Modern/Premium/Premium Special" : 
				break;
				
			case "Car Detail Comparison" : 
				break;
				
			case "Car Detail Option list" : 
				break;
				
			case "Price for each Options and sum" : 
				break;
				
			case "Model Recommendation Matching current Vehicle" : 
				break;
				
			case "Chat time alert trigger" : 
				break;

			case "retrieve_car_info" : 
				
				System.out.println("action 처리 완료!!!!!!!!!!!!!!!!!!!!!!");
				
				params.put("field1", "F1_22");
				
			    rows = SqlSessionManager.getSqlMapClient().queryForList("HKMC.test2Parm", params);
				if ( rows.size() > 0 ) {
					rs = (Map<String, Object>)rows.get(0);
				}
				
				break;
				
				
			default: 
				break;
			}
			
//			params.put("field1", "F1_22");
//			
//		    rows = SqlSessionManager.getSqlMapClient().queryForList("HKMC.test2Parm", params);
//			if ( rows.size() > 0 ) {
//				rs = (Map<String, Object>)rows.get(0);
//			}

			
//			params.put("field1", "F1_22");
//			
//			List rows = SqlSessionManager.getSqlMapClient().queryForList("HKMC.test2Parm", params);
//			if ( rows.size() > 0 ) {
//				rs = (Map<String, Object>)rows.get(0);
//			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return rs;
	}
}
