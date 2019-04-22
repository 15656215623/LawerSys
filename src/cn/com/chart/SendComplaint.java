package cn.com.chart;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.opensymphony.xwork2.ModelDriven;
@Repository(value = "sendComplaint")
@Scope("prototype")
public class SendComplaint implements ModelDriven<Complaint>,RequestAware{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Complaint com;
	//投诉
	@Transactional
	public String mycomplaint(){
		Session session = sf.getCurrentSession();
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dd=new Date();
		String time=sim.format(dd);
		com.setTime(time);
		session.save(com);
		return null;
	}
	//我的投诉信息
	@Transactional
	public String comp(){
		Session session = sf.getCurrentSession();
		String user=com.getUser();
		String sql="from Complaint where user=?";
		Query query=session.createQuery(sql);
		try {
			user = new String (user.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, user);
		List<Complaint> list=query.list();
		map.put("list",list);
		return "success";
	}
	@Override
	public Complaint getModel() {
		// TODO Auto-generated method stub
		return com;
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
