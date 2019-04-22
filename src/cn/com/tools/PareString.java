package cn.com.tools;
public class PareString {
	//把字符串转成字母
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
//把字母转成字符串
public static String Tpared(String kk){
	String s=null;
	String [] sql={"ht","jd","ld","xs","jt","fc","jz","lh"};
	String[] str = { "合同纠纷", "借贷纠纷", "劳动纠纷", "刑事辩护", "交通事故", "房产纠纷",
			"建筑工程", "离婚纠纷" };
	for (int i = 0; i < sql.length; i++) {
		if(sql[i].equals(kk)){
			s=str[i];
		}
	}
	return s;
}
//比较出最大值的索引
public static int max(int str[]){
	String [] sql={"ht","jd","ld","xs","jt","fc","jz","lh"};
	int length=str.length;
	//设置第一个值是最大值
	int max=str[0];
	int m=0;
	for (int i = 0; i < str.length-1; i++) {
		if(max<str[i+1]){
			max=str[i+1];
			m=i+1;
		}
	}
	
	return m;
	
}
}
