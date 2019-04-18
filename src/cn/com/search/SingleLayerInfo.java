package cn.com.search;
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
import cn.com.bean.Comprecondition;
import cn.com.bean.Layer;
import com.opensymphony.xwork2.ModelDriven;
@Repository(value="singleLayerInfo")
@Scope("prototype")
public class SingleLayerInfo implements ModelDriven<Layer>,RequestAware {
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Layer layer;
	@Override
	public Layer getModel() {
		// TODO Auto-generated method stub
		return layer;
	}
	//查询资料，根据lame
	@Transactional
	public String querydata(){
		Session session=sf.getCurrentSession();
		String sql="from Layer where lanme=?";
		Query query=session.createQuery(sql);
		String name=layer.getLanme();
		try {
			 name = new String (name.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.setString(0, name);
		Layer ly=(Layer) query.uniqueResult();
		map.put("layer", ly);
		//再查询案例
		String sqls = "from Comprecondition where lanme=?";
		Query ques = session.createQuery(sqls);
		ques.setString(0, name);
		Comprecondition com = (Comprecondition) ques.uniqueResult();
		map.put("demo", com);
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
		map=arg0;
	}

}
