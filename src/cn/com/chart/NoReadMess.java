package cn.com.chart;
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
@Repository(value = "noReadMess")
@Scope("prototype")
public class NoReadMess implements RequestAware{
	@Autowired
	private SessionFactory sf;
	private String other;
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	@Transactional
	public String UserMess(){
		Session session=sf.getCurrentSession();
		try {
			//转换编码
			other = new String (other.getBytes("ISO-8859-1"),"UTF-8");
			//查询
			String sql="select distinct  self from Chart where other=?  and lflag=0 ";
		    Query query=session.createQuery(sql);
		    query.setString(0, other);
		    List<String> user=query.list();
		    map.put("user", user);
		    
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	
	
	private Map<String, Object> map;
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		map=arg0;
	}
}
