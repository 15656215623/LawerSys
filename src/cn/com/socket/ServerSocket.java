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
/*@ServerEndpoint("/mysocket/{Id}")*/
public class ServerSocket {
	// 日期格式化
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");	
	//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	private static Map<String,ServerSocket> webSocketSet = new ConcurrentHashMap<String,ServerSocket>();
	//与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;
	private String userId;
	@OnOpen
	public void open(@PathParam("Id")String userIds,Session session) {
		// 添加初始化操作
		System.out.println("---初始化----userId:"+userIds);
		this.session = session;
		System.out.println(session);
		//获取当前登录用户的id+
		this.userId = userIds;
		webSocketSet.put(userIds,this);     //加入set中
		System.out.println("有新连接加入！当前在线人数为" +webSocketSet.size());
		
	}
	

	@OnMessage
	public void getMessage(String message, Session session1) {
		// 把客户端的消息解析为JSON对象
		JSONObject jsonObject = JSONObject.fromObject(message);
		// 在消息中添加发送日期
		jsonObject.put("date", DATE_FORMAT.format(new Date()));
		// -----------------------把消息发送给所有连接的会话--------------------------------
		System.out.println("来自客户端的消息"+this.userId+":" + message);
		Set<String> str=webSocketSet.keySet();
        for(String item: str){
        	System.out.println("this:"+this);
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
 
