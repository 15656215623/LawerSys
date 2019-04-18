package cn.com.service;
import java.io.File;
import java.io.IOException;
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

import cn.com.bean.AuDemo;
import cn.com.bean.LawDemo;
import cn.com.bean.Layer;
import cn.com.tools.Upfile;

import com.opensymphony.xwork2.ModelDriven;
@Repository(value="auditDemos")
@Scope("prototype")
public class AuditDemos implements RequestAware,ModelDriven<AuDemo>{
//查询需要审核的demo
	@Autowired
	private SessionFactory sf;
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
	//查询所有待审核的案例
	@Transactional
	public String querydemo(){
		Session session = sf.getCurrentSession();
		String sql = "from AuDemo where flag=0";
		Query query = session.createQuery(sql);
		@SuppressWarnings("unchecked")
		List<AuDemo> list = query.list();
		map.put("list", list);
		return "success";
	}
	//根据did下载案例
	@Transactional
	public String downfile(){
		Session session = sf.getCurrentSession();
		String sql = "from AuDemo where did=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, demo.getDid());
		AuDemo ad = (AuDemo) query.uniqueResult();
		String dd=ad.getDemo();
		File source=new File(dd);
		String sname=dd.split("/")[2];
		File arm=new File("D:/down/",sname);
		if(!arm.exists()){
			try {
				arm.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//开始下载
		try {
			Upfile.copyFileUsingFileChannels(source,arm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//开始下载
		return null;
	}
	
	//审核案例通过，把audemo里面flag变成1，插入数据到layer表里
	@Transactional
	public String over_Audit(){
		Session session = sf.getCurrentSession();
		//把audemo表里的flag变成1
		String sql = "update  AuDemo set flag=1 where did=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, demo.getDid());
		query.executeUpdate();
		//以一个数组
		String kinds=demo.getKinds();
		String [] watch={"ht","jd","ld","xs","jt","fc","jz","lh"};
		String [] sz={"合同纠纷","借贷纠纷","劳动纠纷","刑事辩护","交通事故","房产纠纷","建筑纠纷","离婚纠纷"};
		for (int i = 0; i < sz.length; i++) {
			if(kinds.equals(sz[i])){
				//插入到表中
				String osql="update Comprecondition set "+watch[i]+"="+watch[i]+"+1 where lanme=?";
				Query qother = session.createQuery(osql);
				qother.setString(0, demo.getLanme());
				qother.executeUpdate();
			}
		}
		//以一个数组
		LawDemo ld=new LawDemo();
		ld.setDemo(demo.getDemo());
		ld.setLanme(demo.getLanme());
		ld.setKinds(demo.getKinds());
		session.save(ld);
		return null;
	}
	//审核案例通过，把audemo里面flag变成1，插入数据到layer表里
	@Autowired
	private AuDemo demo;
	@Override
	public AuDemo getModel() {
		// TODO Auto-generated method stub
		return demo;
	}
	
}
