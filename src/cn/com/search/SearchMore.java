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
import cn.com.tools.PareString;
@Repository(value = "searchMore")
@Scope("prototype")
public class SearchMore implements RequestAware,ModelDriven<Layer>{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Layer layer;
	private String orderby;
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	//根据纠纷的类型查询
	@Transactional
	public String byMore() throws UnsupportedEncodingException{
		//最基础的sql
		String sql="select new Showlayer(c.lanme,c.laddress,c.ht,c.jd,c.ld,c.xs,c.jt,c.fc,c.jz,c.lh,l.logo,l.officename) from Comprecondition c, Layer l  where  c.lanme=l.lanme and l.laddress like ?";
		//获取城市名,类型，并且转换成中文
		String laddress=layer.getLaddress();
		laddress = new String (laddress.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(laddress);
		String kind=layer.getKinds();
		if(kind!=null&&kind!=""&&!("null".equals(kind))){
			kind = new String (kind.getBytes("ISO-8859-1"),"UTF-8");
			sql=sql+" and l.kinds like '%"+kind+"%'";
		}
		//这个是根据什么排序，是执业年限还是案例数量
		if(orderby!=null&&orderby!=""&&!"null".equals(orderby)){
			orderby = new String (orderby.getBytes("ISO-8859-1"),"UTF-8");
			if(orderby.endsWith("执业年限")){
				sql=sql+" order by l.ltime desc";
			}
            if(orderby.endsWith("案例数量")){
            	if(kind==null||kind==""||"null".equals(kind)){
            		
            	}else{
            		String sk=PareString.pared(kind);
    				sql=sql+" order by c."+sk+" desc";	
            	}
            	
			}
		}
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(sql);
		query.setString(0, "%"+laddress+"%");
		@SuppressWarnings("unchecked")
		List<Showlayer> list = query.list();
		System.out.println(list.size());
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
