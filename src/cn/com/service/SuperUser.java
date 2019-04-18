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
import com.opensymphony.xwork2.ModelDriven;
import cn.com.bean.SuperAdmin;
@Repository(value="superUser")
@Scope("prototype")
public class SuperUser  implements ModelDriven<SuperAdmin>{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private SuperAdmin user;
	@Transactional
	public String login_user(){
//		普通用户登录
		Session session=sf.getCurrentSession();
		String sql="from SuperAdmin where username=? and password=?";
		Query query=session.createQuery(sql);
		query.setString(0, user.getUsername());
		query.setString(1, user.getPassword());
		SuperAdmin u=(SuperAdmin)query.uniqueResult();
		 String toast="";
		 if(u!=null){
			 toast="success"; 
		 }else{
			 toast="fail"; 
		 }
		 HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			try {
				response.getWriter().write(toast);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return null;
	}
	@Override
	public SuperAdmin getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}
