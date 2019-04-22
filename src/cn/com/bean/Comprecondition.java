package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="comprecondition")
public class Comprecondition {
private int lid;
private String lanme;
private String laddress;
private int ht;
private int jd;
private int ld;
private int xs;
private int jt;
private int fc;
private int jz;
private int lh;
private int count;
private int start;
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public int getStart() {
	return start;
}
public void setStart(int start) {
	this.start = start;
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

}
