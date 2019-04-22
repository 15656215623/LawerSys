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
import cn.com.bean.Showlayer;
@Repository(value = "searchByGood")
@Scope("prototype")
public class SearchByGood implements RequestAware,ModelDriven<Layer>{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Layer layer;
	//根据纠纷的类型查询
	@Transactional
	public String bykind(){
		String sql="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename,l.kinds,c.start) from Comprecondition c, Layer l  where c.lanme=l.lanme and l.kinds like ? order by c.start desc";
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(sql);
		String kind=layer.getKinds();
		//把kind转换
		try {
			kind = new String (kind.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("类型:"+kind);
		query.setString(0, "%"+kind+"%");
		@SuppressWarnings("unchecked")
		List<Showlayer> list = query.list();
		map.put("list", list);
		return "success";
	}
	//根据事务所名称或者律师名称查询
	@Transactional
	public String byname(){
		//获取从后台传递过来的lid
		int id=layer.getLid();
		String sql=null;
		if(id==1){
		sql="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename,l.kinds,c.start) from Comprecondition c, Layer l  where c.lanme=l.lanme and l.lanme like ? order by c.start desc";	
		}
		if(id==2){
		sql="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename,l.kinds,c.start) from Comprecondition c, Layer l  where c.lanme=l.lanme and l.officename like ? order by c.start desc";
		}
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(sql);
		String lanme=layer.getLanme();
		//把kind转换
		try {
			lanme = new String (lanme.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("名称:"+lanme);
		query.setString(0, "%"+lanme+"%");
		@SuppressWarnings("unchecked")
		List<Showlayer> list = query.list();
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
