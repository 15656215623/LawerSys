package cn.com.socket;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import net.sf.json.JSONObject;
@ServerEndpoint("/mysocket/{Id}")
public class MySocket {
	// 日期格式化
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");	
	private static Map<String,MySocket> webSocketSet = new ConcurrentHashMap<String,MySocket>();
	private Session session;
	private String userId;
	@OnOpen
	public void open(@PathParam("Id")String userIds,Session session) {
		this.session = session;
		this.userId = userIds;
		webSocketSet.put(userIds,this);     
	}
	

	@OnMessage
	public void getMessage(String message, Session session1) {
		JSONObject jsonObject = JSONObject.fromObject(message);
		jsonObject.put("date", DATE_FORMAT.format(new Date()));
		System.out.println("来自客户端的消息"+this.userId+":" + message);
		Set<String> str=webSocketSet.keySet();
        for(String item: str){
             try {
            	 //当前用户右侧显示，非本用户左侧显示
            	
            	 if(this.userId.equals( webSocketSet.get(item).userId)){jsonObject.put("isSelf", true);}
            	 else{jsonObject.put("isSelf", false);}
     			 // 发送JSON格式的消息
            	 webSocketSet.get(item).sendMessage(jsonObject.toString());
             } catch (IOException e) {
                 e.printStackTrace();
                 continue;
             }
         }
        	
	}
	
 
	@OnClose
	public void close() {
		// 添加关闭会话时的操作
		webSocketSet.remove(this);  //从set中删除
	}
 
	
	@OnError
	public void error(Throwable t) {
		// 添加处理错误的操作
		System.out.println("发生错误");
		t.printStackTrace();
	}
	
	

     public synchronized  void  sendMessage(String message) throws IOException{
         this.session.getAsyncRemote().sendText(message);//非阻塞式的
     }
 
}
 
