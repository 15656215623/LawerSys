package cn.com.service;
import java.io.File;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cn.com.bean.AuDemo;
import cn.com.tools.RandomStr;
import cn.com.tools.Upfile;
import com.opensymphony.xwork2.ModelDriven;
@Repository(value="upMoreDemo")
@Scope("prototype")
public class UpMoreDemo implements ModelDriven<AuDemo>{
	@Autowired
	private SessionFactory sf;
	@Autowired
	private AuDemo demo;
	private File[] file;
	public File[] getFile() {
		return file;
	}
	public void setFile(File[] file) {
		this.file = file;
	}
	@Override
	public AuDemo getModel() {
		// TODO Auto-generated method stub
		return demo;
	}
	//上传多个案例
	@Transactional
	public String updemo(){
		//获取webroot下面doc文件夹的路径
		//新建一个数组，把这个数据存储的是名称，插入到数据库中的
		int count=file.length;
		String [] dstr=new String[count];
		//获取文件名称
		for (int i = 0; i < count; i++) {
			//随机生成一个名称
			String str=RandomStr.getRandomString(6);
			System.out.println(file[i]);
			String fname=file[i].getName();
			File f = new File("D:/demo/", str+".docx");
			//if文件不存在的话，就创建一个文件
			if(!f.exists()){
				try {
					f.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//拷贝文件
			 try {
					Upfile.copyFileUsingFileChannels(file[i],f);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			//拷贝文件
			//复制图片到logo文件夹里面
			 dstr[i]="D:/demo/"+str+".docx";
		}
		Session session=sf.getCurrentSession();
		for (int i = 0; i < dstr.length; i++) {
			demo.setDemo(dstr[i]);
			session.save(demo);
			session.flush();
			session.clear();
		}
        
		return null;
	}
	//上传多个案例
}
