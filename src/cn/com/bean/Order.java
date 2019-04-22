package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="order")
public class Order {
private int oid;
private String self;
private String other;
private String time;
private String kinds;
private String content;
private int start;
public int getOid() {
	return oid;
}
public void setOid(int oid) {
	this.oid = oid;
}
public String getSelf() {
	return self;
}
public void setSelf(String self) {
	this.self = self;
}
public String getOther() {
	return other;
}
public void setOther(String other) {
	this.other = other;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getKinds() {
	return kinds;
}
public void setKinds(String kinds) {
	this.kinds = kinds;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getStart() {
	return start;
}
public void setStart(int start) {
	this.start = start;
}

}
