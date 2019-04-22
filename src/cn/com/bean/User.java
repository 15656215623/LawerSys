package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="user")
public class User {
private int uid;
private String username;
private String password;
private int ht;
private int jd;
private int ld;
private int xs;
private int jt;
private int fc;
private int jz;
private int lh;

public int getHt() {
	return ht;
}
public void setHt(int ht) {
	this.ht = ht;
}
public int getJd() {
	return jd;
}
public void setJd(int jd) {
	this.jd = jd;
}
public int getLd() {
	return ld;
}
public void setLd(int ld) {
	this.ld = ld;
}
public int getXs() {
	return xs;
}
public void setXs(int xs) {
	this.xs = xs;
}
public int getJt() {
	return jt;
}
public void setJt(int jt) {
	this.jt = jt;
}
public int getFc() {
	return fc;
}
public void setFc(int fc) {
	this.fc = fc;
}
public int getJz() {
	return jz;
}
public void setJz(int jz) {
	this.jz = jz;
}
public int getLh() {
	return lh;
}
public void setLh(int lh) {
	this.lh = lh;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
