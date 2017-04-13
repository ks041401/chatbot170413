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
public class CarOptionAction implements IAction
{
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Map<String, Object> doAction(String actionId, Map<String, Object> params)
	{
		Map<String, Object> rs = null;
		List rows;
		
		try
		{
			System.out.println("params=" + params);
//			HashMap<String,String> map = new HashMap<String,String>();
//			
//			map.put("carkind",   "그랜저IG 자가용 디젤 2.2 모던");
//			map.put("caroption1",   "파노라마 썬루프");
//			map.put("caroption2",   "튜익스 컴포트 패키지");
//			map.put("caroption3",   "");
//			
//			System.out.println("map=" + map);
			
		    rows = SqlSessionManager.getSqlMapClient().queryForList("HKMC.carOption",params);
			if ( rows.size() > 0 ) {
				rs = (Map<String, Object>)rows.get(0);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return rs;
	}
}
