package com.klab.ibatis;

import java.net.URL;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/**
 * @author 최의신 (choies@kr.ibm.com)
 *
 */
public class SqlSessionManager
{
	private static SqlMapClient instance;
	
	/**
	 * 
	 */
	private static void _connection()
	{
		String VCAP_SERVICES = System.getenv("VCAP_SERVICES");
		String jdbcUrl = null;
		String userId = null;
		String passwd = null;
		
		if (VCAP_SERVICES != null) {
			JsonObject obj = (JsonObject) new JsonParser().parse(VCAP_SERVICES);
			Entry<String, JsonElement> dbEntry = null;
			Set<Entry<String, JsonElement>> entries = obj.entrySet();
			for (Entry<String, JsonElement> eachEntry : entries) {
				if (eachEntry.getKey().toLowerCase().contains("dashdb")) {
					dbEntry = eachEntry;
					break;
				}
			}
			if (dbEntry == null) {
				throw new RuntimeException("Could not find cloudantNoSQLDB key in VCAP_SERVICES env variable");
			}

			obj = (JsonObject) ((JsonArray) dbEntry.getValue()).get(0);
			obj = (JsonObject) obj.get("credentials");

			jdbcUrl = obj.get("jdbcurl").getAsString();
			userId = obj.get("username").getAsString();
			passwd = obj.get("password").getAsString();
		} else {
			throw new RuntimeException("VCAP_SERVICES not found");
		}
		
		try
		{
			Properties pro = new Properties();
	
//			jdbcUrl = "jdbc:db2://dashdb-entry-yp-dal09-07.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;";
//			userId = "dash5537";
//			passwd = "Ed6Yu1sj}L_Q";
			pro.put("driver", "com.ibm.db2.jcc.DB2Driver");
			pro.put("url", jdbcUrl);
			pro.put("username", userId);
			pro.put("password", passwd);
					
			URL u = SqlSessionManager.class.getResource("/sql-map-config.xml");
			instance = SqlMapClientBuilder.buildSqlMapClient(u.openStream(), pro); 
		}catch(Throwable ex) {
			throw new RuntimeException(ex);
		}finally{ 
			
		}
	}
	
	/**
	 * @return
	 */
	public static SqlMapClient getSqlMapClient()
	{
		if ( instance == null )
			_connection();
		
		return instance;
	}
	
}
