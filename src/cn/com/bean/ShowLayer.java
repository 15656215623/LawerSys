package cn.com.bean;
import org.springframework.stereotype.Repository;
@Repository(value="showlayer")
public class Showlayer {
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
	private String logo;
	private int start;
	private String kinds;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	private String officename;
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
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getOfficename() {
		return officename;
	}
	public void setOfficename(String officename) {
		this.officename = officename;
	}
	public Showlayer() {
		super();
	}
	public Showlayer(String lanme, String laddress, int ht, int jd,
			int ld, int xs, int jt, int fc, int jz, int lh, String logo,
			String officename,String kinds,int start) {
		super();
		this.lanme = lanme;
		this.laddress = laddress;
		this.ht = ht;
		this.jd = jd;
		this.ld = ld;
		this.xs = xs;
		this.jt = jt;
		this.fc = fc;
		this.jz = jz;
		this.lh = lh;
		this.logo = logo;
		this.kinds = kinds;
		this.start = start;
		this.officename = officename;
	}
	
}
