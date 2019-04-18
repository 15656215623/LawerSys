package cn.com.service;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.com.bean.User;

import com.opensymphony.xwork2.ModelDriven;
@Repository(value = "userCenter")
@Scope("prototype")
public class UserCenter implements ModelDriven<User>{
@Autowired
private User user;
@Autowired
private SessionFactory sf;
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
//修改密码
	@Transactional
	public String repass(){
		Session  session=sf.getCurrentSession();
		String sql="update User set password=?  where username=?";
		Query query=session.createQuery(sql);
		query.setString(0,user.getPassword());
		query.setString(1,user.getUsername());
		query.executeUpdate();
		return null;
	}
}
