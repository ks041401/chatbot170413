package com.klab.act;

import java.util.HashMap;
import java.util.Map;

import com.klab.svc.IAction;

/**
 * @author 최의신 (choies@kr.ibm.com)
 *
 */
public class SamplePostAction implements IAction
{
	@Override
	public Map<String, Object> doAction(String actionId, Map<String, Object> params)
	{
		Map<String, Object> rs = new HashMap<String, Object>();
		
		rs.put("URL", "http://www.ibm.com");
		
		return rs;
	}
}
