package cn.com.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Repository(value = "admin_Delete")
@Scope("prototype")
public class Admin_Delete {
//管理员模块-删除用户
	private int uid;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Autowired
	private SessionFactory sf;
	@Transactional
	public String delete_user() {
		//删除律师表的操作
		Session session = sf.getCurrentSession();
		String sql = "delete from Layer where lid=?";
		Query query=session.createQuery(sql);
		query.setInteger(0, uid);
		query.executeUpdate();
		//删除以后，就开始跳转到admin_u
		return "success";
	}
	//删除普通用户
	@Transactional
	public String delete_comm() {
		//删除律师表的操作
		Session session = sf.getCurrentSession();
		String sql = "delete from User where uid=?";
		Query query=session.createQuery(sql);
		query.setInteger(0, uid);
		query.executeUpdate();
		//删除以后，就开始跳转到admin_u
		return "success";
	}
}
