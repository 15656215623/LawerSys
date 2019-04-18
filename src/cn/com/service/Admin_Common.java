package cn.com.service;
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
import cn.com.bean.User;
@Repository(value = "admin_Common")
@Scope("prototype")
public class Admin_Common implements RequestAware{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private User user;
	//当前页
    private int i;
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
	//统计当前用户的数量
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	// 管理员-用户模块 对普通用户和律师用户的删除，分页查询
	@Transactional
	public String quertuser() {
		Session session = sf.getCurrentSession();
		String sql = "from User";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		//总数量   第几页，从前台返回的数据
		count=list.size();
		//每页显示10条数据
		int allpage=count/8+1;//总共allpage页
		//如果当前页是-1的话，就是1；如果当前页面是最后一页+1的话，就变成1
		if(i<=0){i=1;}
		if(i>allpage){i=allpage;}
		int s=(i-1)*8;
		int e=8;
		if(i==allpage){e=count-s;}
		String sqls = "from User";
		Query querys = session.createQuery(sqls);
        querys.setFirstResult(s);
        querys.setMaxResults(e);
		List<User> lists = querys.list();
		// 通过Json的形式传送给前台
		// ajax实现从注册到登录
	    map.put("list", lists);
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
