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

import cn.com.bean.Chart;
@Repository(value = "operateRecord")
@Scope("prototype")
public class OperateRecord implements RequestAware{
	@Autowired
	private SessionFactory sf;
	private String other;
	private String self;
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
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
	//查询所有记录
	@Transactional
	public String queryAll(){
		Session session=sf.getCurrentSession();
		String sql="from Chart where self=? and other=?";
		Query query=session.createQuery(sql);
		try {
			other = new String (other.getBytes("ISO-8859-1"),"UTF-8");
			self = new String (self.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, self);
		query.setString(1, other);
		List<Chart> list=query.list();
		map.put("list", list);
		return "success";
	}
	//删除记录
	@Transactional
	public String queryDelete(){
		Session session=sf.getCurrentSession();
		String sql="delete  Chart where self=? and other=?";
		Query query=session.createQuery(sql);
		query.setString(0, self);
		query.setString(1, other);
		query.executeUpdate();
		return "success";
	}
}
