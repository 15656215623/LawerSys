package cn.com.search;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.opensymphony.xwork2.ModelDriven;
import cn.com.bean.Comprecondition;
@Repository(value = "moreSearch")
@Scope("prototype")
public class MoreSearch implements RequestAware,ModelDriven<Comprecondition>{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Comprecondition com;
	private String condition;
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	@Transactional
	public String Relation(){
		Session session = sf.getCurrentSession();
	
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
	public Comprecondition getModel() {
		// TODO Auto-generated method stub
		return com;
	}
}
