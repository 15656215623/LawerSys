package cn.com.chart;
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

import cn.com.bean.Complaint;
import cn.com.bean.UComplaint;
@Repository(value = "userComp")
@Scope("prototype")
public class UserComp  implements RequestAware{
	@Autowired
	private SessionFactory sf;
	//接收用户的投诉
	private int cid;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	//查询用户的投诉
	@Transactional
	public String user(){
		Session session = sf.getCurrentSession();
		String sql="from Complaint";
		Query query=session.createQuery(sql);
		List<Complaint> list=query.list();
		map.put("list",list);
		return "success";
	}
	//撤销用户投诉
	@Transactional
	public String delete(){
		Session session = sf.getCurrentSession();
		String sql="delete Complaint where cid=?";
		Query query=session.createQuery(sql);
		query.setInteger(0,cid);
		query.executeUpdate();
		return "success";
	}
	//查询律师的投诉
	@Transactional
	public String layer(){
		Session session = sf.getCurrentSession();
		String sql="from UComplaint";
		Query query=session.createQuery(sql);
		List<UComplaint> list=query.list();
		map.put("list",list);
		return "success";
	}
	//撤销律师的投诉
	@Transactional
	public String deleteL(){
		Session session = sf.getCurrentSession();
		String sql="delete UComplaint where cid=?";
		Query query=session.createQuery(sql);
		query.setInteger(0,cid);
		query.executeUpdate();
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
