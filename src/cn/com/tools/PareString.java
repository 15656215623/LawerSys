package cn.com.tools;
public class PareString {
public static String pared(String kk){
	String s=null;
	String [] sql={"ht","jd","ld","xs","jt","fc","jz","lh"};
	String[] str = { "合同纠纷", "借贷纠纷", "劳动纠纷", "刑事辩护", "交通事故", "房产纠纷",
			"建筑工程", "离婚纠纷" };
	for (int i = 0; i < str.length; i++) {
		if(str[i].equals(kk)){
			s=sql[i];
		}
	}
	return s;
}
}
