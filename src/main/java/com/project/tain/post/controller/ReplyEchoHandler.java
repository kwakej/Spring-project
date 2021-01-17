package com.project.tain.post.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.tain.post.model.domain.TimeLine;

public class ReplyEchoHandler extends TextWebSocketHandler {
//	private static final List<WebSocketSession> sessions = new ArrayList<>();
//	Map<String, WebSocketSession> userSessions = new HashMap<>();
//
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		System.out.println("afterConnectionEstablished:" + session);
//		sessions.add(session);
//		String senderId = getId(session);
//		userSessions.put(senderId, session);
	
//}
	private static final List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		super.handleTextMessage(session, message);
        
		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

		switch (mapReceive.get("cmd")) {
		
		// CLIENT 입장
		case "CMD_ENTER":
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bang_id", mapReceive.get("bang_id"));
			map.put("session", session);
			sessionList.add(map);
			
			// 같은 채팅방에 입장 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				if(bang_id.equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_ENTER");
					mapToSend.put("msg", session.getId() +  "님이 입장 했습니다.");
					
					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
			
		// CLIENT 메세지
		case "CMD_MSG_SEND":
			// 같은 채팅방에 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String bang_id = (String) mapSessionList.get("bang_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (bang_id.equals(mapReceive.get("bang_id"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("bang_id", bang_id);
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("msg", session.getId() + " : " + mapReceive.get("msg"));

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
		}
	}

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);
        
		ObjectMapper objectMapper = new ObjectMapper();
		String now_bang_id = "";
		
		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String bang_id = (String) map.get("bang_id");
			WebSocketSession sess = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				now_bang_id = bang_id;
				sessionList.remove(map);
				break;
			}	
		}
		
		// 같은 채팅방에 퇴장 메세지 전송 
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			String bang_id = (String) mapSessionList.get("bang_id");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

			if (bang_id.equals(now_bang_id)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("bang_id", bang_id);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("msg", session.getId() + "님이 퇴장 했습니다.");

				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}
	}
	
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println("handleTextMessage:" + session + " : " + message);
//		System.out.println(message);
////		JSONObject object = new JSONObject(message.getPayload());
////		String type = object.getString("type");
//		String msg = message.getPayload();
//		String[] strs = msg.split(",");
//		String sendermessage = strs[0];
//		String senderId = strs[1];
//		String receiveId = strs[2];
//		userSessions.put(senderId, session);
////		WebSocketSession boardWriterSession = userSessions.get(receiveId);
////		TextMessage tmpMsg = new TextMessage(senderId + ": " + sendermessage +"    " +receiveId+ "에게");
////		boardWriterSession.sendMessage(tmpMsg);
//		for (WebSocketSession sess: sessions) {
//			sess.sendMessage(new TextMessage(senderId + ": " + sendermessage +"    " +receiveId+ "에게"));
//		}
//
////		Iterator<String> sessionIds = userSessions.keySet().iterator();
////		String sessionId = "";
////		while (sessionIds.hasNext()) {
////			sessionId = sessionIds.next();
////		}
//		//userSessions.get(receiveId).sendMessage(new TextMessage("echo:" + message.getPayload()));
//
////		String msg = message.getPayload();
////		String[] strs = msg.split(",");
////		String sendermessage = strs[0];
////		String senderId = strs[1];
////		for (WebSocketSession sess: sessions) {
////			sess.sendMessage(new TextMessage(senderId + ": " + sendermessage));
////		}
//
//		// protocol: cmd,댓글작성자,게시글작성자,bno (ex: reply,user2,user1,234)
//
////		String msg = message.getPayload();
////		if (!msg.isEmpty()) {
////			String[] strs = msg.split(",");
////			if (strs != null && strs.length == 4) {
////				String cmd = strs[0];
////				String replyWriter = strs[1];
////				String boardWriter = strs[2];
////				String bno = strs[3];
////
////				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
////				if ("reply".equals(cmd) && boardWriterSession != null) {
////					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 " + "<a href='/board/read?bno=" + bno + "'>"
////							+ bno + "</a>번 게시글에 댓글을 달았습니다!");
////					boardWriterSession.sendMessage(tmpMsg);
////				}
////			}
////		}
//	}
////		private String getId(WebSocketSession session) {
////			Map<String, Object> httpSession = session.getAttributes();
////			TimeLine loginUser = (TimeLine)httpSession.get("my_name");
////			System.out.println("getId()"+loginUser);
////				return session.getId();
////		}
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		System.out.println("afterConnectionEstablished:" + session + ":" + status);
//		userSessions.remove(session);
//	}
}
