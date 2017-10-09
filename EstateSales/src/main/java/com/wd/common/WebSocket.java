package com.wd.common;

import java.io.IOException;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.ConcurrentLinkedQueue;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class WebSocket {
	private static Queue<Session> sessionSet = new ConcurrentLinkedQueue<Session>();
    
	@OnMessage
    public void onMessage(String message, Session session) 
    	throws IOException, InterruptedException {
		final Set<Session> sessions = session.getOpenSessions();
		System.out.println("recive:"+message);
		try {
			for (Session s : sessions) {
				s.getBasicRemote().sendText("hello!client!");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	
	@OnOpen
    public void onOpen (Session currentSession) {
		 if(sessionSet.contains(currentSession) == false){
	            sessionSet.add(currentSession);
	            System.out.println("WebSocketTest.onOpen()================Add=" + sessionSet.size());
	        }
	        System.out.println("Server say：Client connected");
        
    }

    @OnClose
    public void onClose(Session currentSession) {
        if(sessionSet.contains(currentSession)){
            sessionSet.remove(currentSession);
        }
        System.out.println("Server say：Connection closed============Close=" + sessionSet.size());
    }
    public static Queue<Session> getSessionSet() {
        return sessionSet;
    }
    public void sendMessage(String msg){
			try {
				for (Session session : sessionSet) {
					session.getBasicRemote().sendText(msg);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
    }
}
