package cn.com.service;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.com.bean.Audit;
import cn.com.bean.Comprecondition;
import cn.com.bean.Layer;

import com.opensymphony.xwork2.ModelDriven;
@Repository(value="lawerRegedit")
@Scope("prototype")
public class LawerRegedit  implements ModelDriven<Audit>{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Audit audit;
	@Override
	public Audit getModel() {
		return audit;
	}
//律师注册
	/*
	 * 从前台获取audit的id，如果点击审核通过的话，就执行插入到layer表里，把audit表里想要执行删除操作
	 *
	 * 超级管理员每次查询的都是audit表里的，对这个进行审核
	 */
	@Transactional
	public String auditPass(){
		//0.插入到layer表里
		Session session=sf.getCurrentSession();
		//根据id查询表里audit的数据，把返回的数据插入到lawer表里面
		String sq="from Audit where lid=?";
		Query query=session.createQuery(sq);
		query.setInteger(0, audit.getLid());
		Audit au=(Audit) query.uniqueResult();
		Layer l=new Layer();
		l.setLid(au.getLid());
		l.setCaste(au.getCaste());		
		l.setLanme(au.getLanme());
		l.setPassword(au.getPassword());
		l.setLaddress(au.getLaddress());
		l.setOfficename(au.getOfficename());
		l.setLiseid(au.getLiseid());
		l.setLtime(au.getLtime());
		l.setKinds(au.getKinds());
		l.setLogo("logo/mr.png");
		session.save(l);
		//把lanme,laddress保存到Comm
		Comprecondition com=new Comprecondition();
		com.setLanme(au.getLanme());
		com.setLaddress(au.getLaddress());
		session.save(com);
		//2.把表里的flag变成1
		String sql="update Audit set flag=? where lid=?";
		Query qu=session.createQuery(sql);
		qu.setInteger(0, 1);
		qu.setInteger(1, audit.getLid());
		qu.executeUpdate();
		return null;
	}
	//律师登录
	@Transactional
	public String login(){
		Session session=sf.getCurrentSession();
		String sql="from Layer where lanme=? and password=?";
		Query query=session.createQuery(sql);
		query.setString(0, audit.getLanme());
		query.setString(1, audit.getPassword());
		Layer u=(Layer)query.uniqueResult();
		  String logo="";
		 if(u!=null){
			 logo=u.getLogo();
		 }else{
			 logo="fail"; 
		 }
		 HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			try {
				response.getWriter().write(logo);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
		return null;
	}
	
}
