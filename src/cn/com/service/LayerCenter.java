package cn.com.service;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.com.bean.Layer;
import cn.com.tools.RandomStr;
import cn.com.tools.Upfile;

import com.opensymphony.xwork2.ModelDriven;
@Repository(value="layerCenter")
@Scope("prototype")
public class LayerCenter implements ModelDriven<Layer>,RequestAware {
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Layer layer;
	private File file;
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
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
		return "success";
	}
	//修改资料，执证id和姓名不可以改，其他都可以改
	@Transactional
	public String updata_data(){
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
		return "success";
	}
	//执行修改资料
	@Transactional
	public String update(){
		Session session=sf.getCurrentSession();
		String sql="update Layer set password=?,laddress=?,officename=?,ltime=?,instroduce=? where lanme=?";
		Query query=session.createQuery(sql);
		String name=layer.getLanme();
		query.setString(0, layer.getPassword());
		query.setString(1, layer.getLaddress());
		query.setString(2, layer.getOfficename());
		query.setString(3, layer.getLtime());
		query.setString(4, layer.getInstroduce());
		query.setString(5, layer.getLanme());
		System.out.println("name:"+name+"简介:"+layer.getInstroduce());
		query.executeUpdate();
		return null;
	}
	//上传头像
	@Transactional
	public String uplogo(){
		//获取文件名称
		String str=RandomStr.getRandomString(6);
		System.out.println(file);
		String fname=file.getName();
		//随机生成一个名称
		 HttpServletRequest request = ServletActionContext.getRequest();
		String path=request.getSession().getServletContext().getRealPath("/logo");
		 File f = new File(path, str+".jpg");
		//if文件不存在的话，就创建一个文件
		if(!f.exists()){
			try {
				f.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	    try {
			Upfile.copyFileUsingFileChannels(file,f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//复制图片到logo文件夹里面
		String mylogo="logo/"+str+".jpg";
		Session session=sf.getCurrentSession();
		String sql="update Layer set logo=?  where lanme=?";
		Query query=session.createQuery(sql);
		query.setString(0, mylogo);
		String name=layer.getLanme();
		query.setString(1,name );
		query.executeUpdate();
		//返回logo
		 HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			try {
				response.getWriter().write(mylogo);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
		return null;
	}
	//上传头像
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
