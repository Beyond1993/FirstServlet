
public class testJDBC{
public static void main(String args[]){

	user j = new user();
	j.setUserName("feng");
	j.setPassWord("root");
	boolean res = j.validate();
	System.out.println(res);
}
}
