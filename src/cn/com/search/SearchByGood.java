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

import com.opensymphony.xwork2.ModelDriven;

import cn.com.bean.Layer;
import cn.com.bean.ShowLayer;
@Repository(value = "searchByGood")
@Scope("prototype")
public class SearchByGood implements RequestAware,ModelDriven<Layer>{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Layer layer;
	private String condition;
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	@Transactional
	public String bykind(){
		String sql="select new ShowLayer(a.lid, a.lanme, a.laddress, a.ht, a.jd, a.ld, a.xs, a.jt, a.fc, a.jz, a.lh, l.logo, l.officename) from Comprecondition a , Layer l where a.lanme=l.lanme and l.kinds like ?";
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(sql);
		//把kind转换
		String kind=layer.getKinds();
		try {
			kind = new String (kind.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, "%"+kind+"%");
		@SuppressWarnings("unchecked")
		List<ShowLayer> list = query.list();
		map.put("list", list);
		return "success";
	}
	//根据名字0或者是律师事务所名称查询1
	@Transactional
	public String byname(){
		//获取condition,是0就查询名字是1就查询律师事务所的名字
		Session session = sf.getCurrentSession();
		Query query =null;
		String sql="";
		if(condition.equals("1")){
			sql="select new ShowLayer(a.lid, a.lanme,a.laddress, a.ht, a.jd,a.ld, a.xs, a.jt, a.fc, a.jz,a.lh,l.logo,l.officename)  from Comprecondition a , Layer l where a.lanme=l.lanme and l.officename like ?";			
		}else{
			sql="select new ShowLayer(a.lid, a.lanme,a.laddress, a.ht, a.jd,a.ld, a.xs, a.jt, a.fc, a.jz,a.lh,l.logo,l.officename)  from Comprecondition a , Layer l where a.lanme=l.lanme and l.lanme like ?";			
		}
		query = session.createQuery(sql);
		query.setString(0, "%"+layer.getLanme()+"%");
		List<ShowLayer> list = query.list();
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
	public Layer getModel() {
		// TODO Auto-generated method stub
		return layer;
	}
}
