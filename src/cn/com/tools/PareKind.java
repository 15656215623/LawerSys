package cn.com.tools;
public class PareKind {
//八个类型对应表里的八个字段,输入一个纠纷类型可以得到表里面对应的字段名
	public String pareway(String content){
		String zd="";
		String[] sql = {"ht", "jd", "ld", "xs", "jt", "fc", "jz", "lh" };
		String[] str = { "合同纠纷", "借贷纠纷", "劳动纠纷", "刑事辩护", "交通事故", "房产纠纷",
				"建筑工程", "离婚纠纷" };
		for (int i = 0; i < str.length; i++) {
			if(str.equals(content)){
				zd=sql[i];
			}
		}
		return zd;
	}
}
