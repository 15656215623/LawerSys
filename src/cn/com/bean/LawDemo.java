package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="lawDemo")
public class LawDemo {
private int id;
private String lanme;
private String demo;
private String kinds;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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

}
