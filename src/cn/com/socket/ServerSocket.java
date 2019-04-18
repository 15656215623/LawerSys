/*package cn.com.socket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/serverSocket")
public class ServerSocket {
	// 时间
	private SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// 一个线程集合存储session线程会话
	private Map<ServerSocket,String> map = new ConcurrentHashMap<ServerSocket,String>();
	private Session session;
	@OnOpen
	public void open(Session session) {
		// 把当前的session存储起来，以便后来的时候服务器转发数据
		this.session = session;
		map.put(this,"");
	}

	@OnClose
	public void close() {
		System.out.println("关闭连接");
	}

	@OnMessage
	public void getMessage(String str, Session session) {
		// 除非使用模板，不然获取的只是一个节点，使用模板的话获取当前会话连接的服务器的所有连接的客户端节点
		// Set<Session> set=session.getOpenSessions();
		   map.put(this,str);
		   System.out.println(+map.size());
		for (ServerSocket s : map.keySet()) {
			System.out.println("this:"+this+"客户端的信息：" + str);
			// 服务器把信息分为是自己的还是其他人发的，再加上时间，然后群发到连接的用户session会话里面
			String time = sim.format(new Date());
			String info = str + "时间：" + time;
			// 会话异步发送消息
			s.session.getAsyncRemote().sendText(info);
		}

	}

	@OnError
	public void error(Throwable t) {
		// 添加错误操作
	}

}
*/