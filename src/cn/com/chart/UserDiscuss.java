package cn.com.chart;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cn.com.bean.Order;
import com.opensymphony.xwork2.ModelDriven;
@Repository(value = "userDiscuss")
@Scope("prototype")
public class UserDiscuss implements ModelDriven<Order> {
	@Autowired
	private SessionFactory sf;
	@Autowired
	private Order o;
	private String lanme;
	public String getLanme() {
		return lanme;
	}
	public void setLanme(String lanme) {
		this.lanme = lanme;
	}
	@Override
	public Order getModel() {
		return o;
	}
	@Transactional
	public String setStart() {
		Session session = sf.getCurrentSession();
		String sql = "update Order set start=? ,content=? where oid=?";
		int start = o.getStart();
		start = start / 3;
		int id = o.getOid();
		Query query = session.createQuery(sql);
		query.setInteger(0, start);
		query.setString(1, o.getContent());
		query.setInteger(2, id);
		query.executeUpdate();
		// 律师综合星级要改变
		String sqls = "update Comprecondition set count=count+1,start=(start*count+'"+start+"')/count where lanme=?";
		Query querys = session.createSQLQuery(sqls);
		querys.setString(0, lanme);
		System.out.println("律师名:" + lanme);
		querys.executeUpdate();
		return null;
	}

}
