package com.klab.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonObject;
import com.ibm.watson.developer_cloud.conversation.v1.model.Entity;
import com.ibm.watson.developer_cloud.conversation.v1.model.Intent;

/**
 * @author 최의신 (choies@kr.ibm.com)
 *
 */
@SuppressWarnings("unchecked")
public class ConversationSession
{
	public static final int CONVERSATION_TIMEOUT = 5 * 60 * 1000;	// 5분
	
	private long contextUpdateTime;
	private Map<String, Object> context;
	private List<Entity> entities;
	private List<Intent> intents;
	private List<String> outputString;
	private String inputString;
	private boolean korean;
	private JsonObject postResult;
	private String debug;
	
	public ConversationSession()
	{
		contextUpdateTime = 0;
		context = new HashMap<String, Object>();
		entities = new ArrayList<Entity>();
		intents = new ArrayList<Intent>();
		outputString = new ArrayList<String>();
	}
	
	/**
	 * @return the debug
	 */
	public String getDebug() {
		return debug;
	}

	/**
	 * @param debug the debug to set
	 */
	public void setDebug(String debug) {
		this.debug = debug;
	}

	public JsonObject getPostResult() {
		return postResult;
	}

	public void setPostResult(JsonObject postResult) {
		this.postResult = postResult;
	}

	/**
	 * @return the korean
	 */
	public boolean isKorean() {
		return korean;
	}

	/**
	 * @param korean the korean to set
	 */
	public void setKorean(boolean korean) {
		this.korean = korean;
	}

	/**
	 * 
	 */
	public void reset()
	{
		entities.clear();
		intents.clear();
		outputString.clear();
		postResult = null;
	}
	
	/**
	 * @return the context
	 */
	public Map<String, Object> getContext()
	{
		if ( System.currentTimeMillis() - contextUpdateTime >= CONVERSATION_TIMEOUT )
			context.clear();
		
		return context;
	}
	
	/**
	 * @param context the context to set
	 */
	public void putAll(Map<String, Object> context) {
		this.context.putAll(context);
		contextUpdateTime = System.currentTimeMillis();
	}
	/**
	 * @return the entities
	 */
	public List<Entity> getEntities() {
		return entities;
	}
	/**
	 * @param entities the entities to set
	 */
	public void setEntities(List<Entity> entities) {
		this.entities = entities;
	}
	/**
	 * @return the intents
	 */
	public List<Intent> getIntents() {
		return intents;
	}
	/**
	 * @param intents the intents to set
	 */
	public void setIntents(List<Intent> intents) {
		this.intents = intents;
	}
	/**
	 * @return the outputString
	 */
	public List<String> getOutputString() {
		return outputString;
	}
	/**
	 * @param outputString the outputString to set
	 */
	public void setOutputString(List<String> outputString) {
		this.outputString = outputString;
	}
	/**
	 * @return the inputString
	 */
	public String getInputString() {
		return inputString;
	}
	/**
	 * @param inputString the inputString to set
	 */
	public void setInputString(String inputString) {
		this.inputString = inputString;
	}
	
	/**
	 * @return
	 */
	public Map<String, Object> getActionResult()
	{
		Object actionResult = context.get("actionResult");

		if ( actionResult instanceof Map )
			return (Map<String, Object>)actionResult;
		
		return null;
	}
	
	/**
	 * @param rs
	 */
	public void setActionResult(Map<String, Object> rs)
	{
		if ( rs == null )
			rs = new HashMap<String, Object>();
		
		context.put("actionResult", rs);
	}
	
	/**
	 * @return
	 */
	public Map<String, Object> getParamaters()
	{
		Object params = context.get("params");

		if ( params instanceof Map )
			return (Map<String, Object>)params;
		
		return new HashMap<String, Object>();
	}
	
	/**
	 * @param params
	 */
	public void setParameters(Map<String, Object> params)
	{
		if ( params != null )
			context.put("params", params);
	}
}
