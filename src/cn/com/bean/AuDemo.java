package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="auDemo")
public class AuDemo {
private int did;
private String lanme;
private String demo;
private String kinds;
private int flag;
public int getDid() {
	return did;
}
public void setDid(int did) {
	this.did = did;
}
public String getLanme() {
	return lanme;
}
public void setLanme(String lanme) {
	this.lanme = lanme;
}
public String getDemo() {
	return demo;
}
public void setDemo(String demo) {
	this.demo = demo;
}

public String getKinds() {
	return kinds;
}
public void setKinds(String kinds) {
	this.kinds = kinds;
}
public int getFlag() {
	return flag;
}
public void setFlag(int flag) {
	this.flag = flag;
}

}
