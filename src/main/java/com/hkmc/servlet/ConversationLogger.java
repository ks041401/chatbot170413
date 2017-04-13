package com.hkmc.servlet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;

import com.ibm.watson.developer_cloud.conversation.v1.model.Intent;
import com.klab.ibatis.SqlSessionManager;
import com.klab.svc.ConversationSession;

/**
 * @author 최의신 (choies@kr.ibm.com)
 *
 */
public class ConversationLogger extends Thread
{
	private BlockingQueue<ConversationSession> logQueue;
	private boolean running;
	
	public ConversationLogger()
	{
		logQueue = new ArrayBlockingQueue<ConversationSession>(100);
	}
	
	/**
	 * 
	 */
	public void shutdown()
	{
		running = false;
	}
	
	/**
	 * @param msg
	 */
	public void addDialog(ConversationSession msg)
	{
		try {
			logQueue.put(msg);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param msg
	 * @throws Exception
	 */
	private void insertLog(ConversationSession msg) throws Exception
	{
		System.out.println("@.@ 대화 저장...");
		String watsonPassYn = null;
		Map<String, String> convParm = new HashMap<String, String>();
		String outMsg = "";
		
		//시작인사 대화시간 입력
		if(msg.getInputString().equals("hello")) {			
			SqlSessionManager.getSqlMapClient().insert("HKMC.insertChatTime", convParm);
		}else { 
			//시작 종료인사 저장
			SqlSessionManager.getSqlMapClient().insert("HKMC.updateChatTime", convParm);
		}
		Map<String, String> parm = new HashMap<String, String>();
		
//		System.out.println("getOutputString=" + msg.getOutputString());
//		System.out.println("mgetInputStringsg=" + msg.getInputString());
//		System.out.println("getActionResult=" + msg.getActionResult());
//		System.out.println("getEntities=" + msg.getEntities());
//		System.out.println("getIntents=" + msg.getIntents());
//		System.out.println("outPut1=" + msg.getOutputString());
//		System.out.println("outPut2=" + msg.getOutputString().get(0));

		
		Map<String, String> params = null;
		
		if(msg.getInputString() != null) { // 질문내용이 있을 경우
			
			parm.put("USER_CD", "1");
			parm.put("CONV_DATA", msg.getInputString());
			parm.put("WATSON_PASS_YN", "");
			parm.put("WATSON_RETRAIN_YN", ""); //0.7
			parm.put("INTENT", "");
			SqlSessionManager.getSqlMapClient().insert("HKMC.insertChat", parm);
		
		}
		
		if(msg.getOutputString() != null) {

			parm.put("USER_CD", "2");
			if(msg.getOutputString().size()>0) {
				for(int i =0 ; i < msg.getOutputString().size() ; i++)
				{
					outMsg += msg.getOutputString().get(i);
				}
				parm.put("CONV_DATA", outMsg);
			} else {
				parm.put("CONV_DATA", "");
			}
			System.out.println("getIntents=" + msg.getIntents());
			
			if(msg.getIntents() != null) {
				
				int i = msg.getIntents().size();
				System.out.println("i=" + i);
				
				if(i>0) {
					if(msg.getIntents().get(0).getConfidence()>=0.7) {
						watsonPassYn = "Y";
					} else {
						watsonPassYn = "N";
					}	
					parm.put("INTENT", msg.getIntents().get(0).getIntent());
				}
			} else {
				watsonPassYn = "Y";
				parm.put("INTENT", "");
			}
			
			parm.put("WATSON_PASS_YN", watsonPassYn);  //Confidence 0.7 이상
			parm.put("WATSON_RETRAIN_YN", "N"); // 무조건 n 추후 크게
			SqlSessionManager.getSqlMapClient().insert("HKMC.insertChat", parm);
		}
		
		
	}
	
	
	/* (non-Javadoc)
	 * @see java.lang.Thread#run()
	 */
	public void run()
	{
		running = true;
		
        while(running)
        {
        	try
        	{
            	ConversationSession msg = logQueue.poll(1000, TimeUnit.MILLISECONDS);
            	if ( msg != null )
            	{
            		insertLog(msg);
            	}
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        }
	}
}
