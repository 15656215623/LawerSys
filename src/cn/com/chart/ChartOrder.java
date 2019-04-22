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

import cn.com.bean.Order;
@Repository(value = "chartOrder")
@Scope("prototype")
public class ChartOrder implements RequestAware{
	@Autowired
	private SessionFactory sf;
	private String user;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	//我的订单
	@Transactional
	public String qorder(){
		Session session=sf.getCurrentSession();
		String sql="from Order where self=?";
		Query query=session.createQuery(sql);
		try {
			user = new String (user.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, user);
		List<Order> list=query.list();
		map.put("list", list);
		return "success";
	}
	//律师查询用户评价
	@Transactional
	public String query_pl(){
		Session session=sf.getCurrentSession();
		String sql="from Order where other=?";
		Query query=session.createQuery(sql);
		try {
			user = new String (user.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, user);
		List<Order> list=query.list();
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
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		map=arg0;
	}
}
