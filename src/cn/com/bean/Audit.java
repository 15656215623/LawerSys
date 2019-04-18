package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="audit")
public class Audit {
private int lid;
private String caste;
private String lanme;
private String laddress;
private String officename;
private String liseid;
private String ltime;
private String kinds;
private int flag;
private String password;
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getFlag() {
	return flag;
}
public void setFlag(int flag) {
	this.flag = flag;
}
public String getCaste() {
	return caste;
}
public void setCaste(String caste) {
	this.caste = caste;
}
public int getLid() {
	return lid;
}
public void setLid(int lid) {
	this.lid = lid;
}
public String getLanme() {
	return lanme;
}
public void setLanme(String lanme) {
	this.lanme = lanme;
}
public String getLaddress() {
	return laddress;
}
public void setLaddress(String laddress) {
	this.laddress = laddress;
}
public String getOfficename() {
	return officename;
}
public void setOfficename(String officename) {
	this.officename = officename;
}
public String getLiseid() {
	return liseid;
}
public void setLiseid(String liseid) {
	this.liseid = liseid;
}
public String getLtime() {
	return ltime;
}
public void setLtime(String ltime) {
	this.ltime = ltime;
}
public String getKinds() {
	return kinds;
}
public void setKinds(String kinds) {
	this.kinds = kinds;
}

}
