package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="uComplaint")
public class UComplaint {
//投诉信息
	private int cid;
	private String lawer;
	private String user;
	private String content;
	private String time;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getLawer() {
		return lawer;
	}
	public void setLawer(String lawer) {
		this.lawer = lawer;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
