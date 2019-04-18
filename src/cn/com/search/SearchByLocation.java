package cn.com.search;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cn.com.bean.Showlayer;
@Repository(value = "searchByLocation")
@Scope("prototype")
public class SearchByLocation implements RequestAware{
	@Autowired
	private SessionFactory sf;
	private String laddress;
	public String getLaddress() {
		return laddress;
	}
	public void setLaddress(String laddress) {
		this.laddress = laddress;
	}
	//根据纠纷的类型查询
	@Transactional
	public String bylocat(){
		String sql="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename) from Comprecondition c, Layer l  where c.lanme=l.lanme and l.laddress like ?";
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(sql);
		//把kind转换
		try {
			laddress = new String (laddress.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, "%"+laddress+"%");
		@SuppressWarnings("unchecked")
		List<Showlayer> list = query.list();
		map.put("list", list);
		return "success";
	}
	private Map<String, Object> map;
	
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		map=arg0;
	}
}
