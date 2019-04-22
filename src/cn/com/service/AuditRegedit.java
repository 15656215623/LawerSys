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

import cn.com.bean.Audit;

import com.opensymphony.xwork2.ModelDriven;
@Repository(value="auditRegedit")
@Scope("prototype")
public class AuditRegedit  implements ModelDriven<Audit> ,RequestAware{
@Autowired
private SessionFactory sf;
@Autowired
private Audit audit;
@Transactional
public String regedit_audit(){
	//有一个审核表，先存储在那里，如果超级管理员同意了，才会进入律师表，从审核表中删除，
	    Session session=sf.getCurrentSession();
		session.save(audit);
	   return "success";
}
//查询待审核的律师用户表
@Transactional
public String query_audit(){
	Session session=sf.getCurrentSession();
	String sql="from Audit where flag='0'";
	Query query=session.createQuery(sql);
    @SuppressWarnings("unchecked")
	List<Audit> list=query.list();
//把list集合循环遍历在前端页面上
    map.put("list", list);
	return "success";
}

public Audit getModel() {
	return audit;
}
private Map<String, Object> map;
public Map<String, Object> getMap() {
	return map;
}
public void setMap(Map<String, Object> map) {
	this.map = map;
}
public void setRequest(Map<String, Object> map) {
	// TODO Auto-generated method stub
	this.map=map;
}
}
