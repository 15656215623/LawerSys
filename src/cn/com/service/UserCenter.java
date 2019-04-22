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

import cn.com.bean.User;

import com.opensymphony.xwork2.ModelDriven;
@Repository(value = "userCenter")
@Scope("prototype")
public class UserCenter implements ModelDriven<User>,RequestAware{
@Autowired
private User user;
@Autowired
private SessionFactory sf;
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
//修改密码
	@Transactional
	public String repass(){
		Session  session=sf.getCurrentSession();
		String sql="update User set password=?  where username=?";
		Query query=session.createQuery(sql);
		query.setString(0,user.getPassword());
		query.setString(1,user.getUsername());
		query.executeUpdate();
		return null;
	}
	//用户统计咨询类型
	@Transactional
	public String countkinds(){
		Session  session=sf.getCurrentSession();
		String sql="from User where username=?";
		Query query=session.createQuery(sql);
		String u=user.getUsername();
		try {
			u = new String (u.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0,u);
		User user=(User) query.uniqueResult();
		map.put("user", user);
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
