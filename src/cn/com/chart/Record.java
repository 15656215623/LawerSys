package cn.com.chart;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Collections;
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

import cn.com.bean.Chart;
import cn.com.bean.Order;
import cn.com.tools.PareString;
@Repository(value = "record")
@Scope("prototype")
public class Record implements RequestAware{
	@Autowired
	private SessionFactory sf;
	private String  self;
	private String  other;
	private int oid;
	
	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getSelf() {
		return self;
	}

	public void setSelf(String self) {
		this.self = self;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	//接收从后台传过来的参数
	private String lawerlogo;
	private String selflogo;
	private String kinds;
	public void setLawerlogo(String lawerlogo) {
		this.lawerlogo = lawerlogo;
	}
	
	public String getLawerlogo() {
		return lawerlogo;
	}

	public String getSelflogo() {
		return selflogo;
	}

	public String getKinds() {
		return kinds;
	}

	public void setSelflogo(String selflogo) {
		this.selflogo = selflogo;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	//用户方
	@Transactional
	public String queryh() {
		Session session=sf.getCurrentSession();
		//根据时间查询前三条信息
		String sql="from Chart where self=? and other=? order by time desc";
		Query query=session.createQuery(sql);
		 query.setMaxResults(3);
		//把从前台传递过来的数据转码
	    try {
	    	self = new String (self.getBytes("ISO-8859-1"),"UTF-8");
	    	other = new String (other.getBytes("ISO-8859-1"),"UTF-8");
	    	kinds = new String (kinds.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    query.setString(0, self);
	    query.setString(1,other);
		List<Chart> list=query.list();
		//倒序输出
		Collections.reverse(list);
		map.put("list",list);
		
		//把这个咨询的类型存储到订单里面
		Order o=new Order();
	    o.setOid(oid);
		o.setSelf(self);
		o.setOther(other);
		o.setKinds(kinds);
		//获取当前时间
		SimpleDateFormat sim=new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
		Date dd=new Date();
		String time=sim.format(dd);
		o.setTime(time);
		//存储到数据库里面
		session.save(o);
		//添加咨询类型
		//获取类型，给这个表user数目加一
				String kk=PareString.pared(kinds);
				String sqls="update User set "+kk+"="+kk+"+1 where username=?";
				Query qs = session.createQuery(sqls);
				qs.setString(0, self);
				qs.executeUpdate();
		
		return "success";
	}
	//律师方
	@Transactional
	public String lqueryh() {
		Session session=sf.getCurrentSession();
		//根据时间查询前三条信息
		String sql="from Chart where self=? and other=? and lflag=0 order by time desc";
		Query query=session.createQuery(sql);
	    try {
	    	self = new String (self.getBytes("ISO-8859-1"),"UTF-8");
	    	other = new String (other.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    query.setString(0, self);
	    query.setString(1,other);
		List<Chart> list=query.list();
		//倒序显示
		Collections.reverse(list);
		map.put("list",list);
		//先把未读的消息变成1
		String sq="update Chart set lflag=1 where  self=? and other=?";
		Query quers=session.createQuery(sq);
		quers.setString(0, self);
		quers.setString(1,other);
		quers.executeUpdate();
		//先把未读的消息变成1
		//倒序输出
		
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
