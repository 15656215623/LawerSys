package cn.com.service;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cn.com.bean.Comprecondition;
@Repository(value = "LawerDemo")
@Scope("prototype")
public class LawerDemo implements RequestAware {
	@Autowired
	private SessionFactory sf;
	private String lanme;

	public String getLanme() {
		return lanme;
	}

	public void setLanme(String lanme) {
		this.lanme = lanme;
	}

	@Transactional
	public String query_kinds() {
		Session session = sf.getCurrentSession();
		String sql = "from Comprecondition where lanme=?";
		Query query = session.createQuery(sql);
		try {
			lanme = new String (lanme.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, lanme);
		System.out.println(lanme);
		Comprecondition com = (Comprecondition) query.uniqueResult();
	    map.put("c", com);
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
		map = arg0;
	}
}
