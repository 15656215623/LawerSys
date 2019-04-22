package cn.com.service;
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

import com.opensymphony.xwork2.ModelDriven;

import cn.com.bean.Showlayer;
import cn.com.bean.User;
import cn.com.tools.PareString;
@Repository(value = "pushLawer")
@Scope("prototype")
public class PushLawer implements RequestAware,ModelDriven<User>{
	@Autowired
	private SessionFactory sf;
	//获取用户名
	@Autowired
	private User u;
	//用户推送
	@Transactional
	public String push(){
		Session session = sf.getCurrentSession();
		String sql = "from User where username=?";
		String use=u.getUsername();
		try {
			use = new String (use.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Query query = session.createQuery(sql);
		query.setString(0, use);
		User u=(User) query.uniqueResult();
		int [] sz={u.getHt(),u.getJd(),u.getLd(),u.getXs(),u.getJt(),u.getFc(),u.getJz(),u.getLh()};
		//比较最大的值
		int i=PareString.max(sz);
		String[] str = { "合同纠纷", "借贷纠纷", "劳动纠纷", "刑事辩护", "交通事故", "房产纠纷",
				"建筑工程", "离婚纠纷" };
		String sqls="";
		Query qus=null;
		if(sz[i]==0){
			//随机推送
			sqls="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename,l.kinds,c.start) from Comprecondition c, Layer l  where c.lanme=l.lanme order by c.start desc";
			qus=session.createQuery(sqls);
		}else{
			//推送str[i]类型的
			sqls="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename,l.kinds,c.start) from Comprecondition c, Layer l  where c.lanme=l.lanme and l.kinds like ? order by c.start desc";
			qus=session.createQuery(sqls);
			qus.setString(0, "%"+str[i]+"%");
			//设置查询的条数为3
		}
		qus.setMaxResults(3);
		List<Showlayer> list = qus.list();
		map.put("list", list);
		return "success";
	}
	//游客推送
	@Transactional
	public String apush(){
		Session session = sf.getCurrentSession();
		String sqls="";
		Query qus=null;
			//按星级随机推送
			sqls="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename,l.kinds,c.start) from Comprecondition c, Layer l  where c.lanme=l.lanme order by c.start desc";
			qus=session.createQuery(sqls);
	
		qus.setMaxResults(3);
		List<Showlayer> list = qus.list();
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
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return u;
	}
}
