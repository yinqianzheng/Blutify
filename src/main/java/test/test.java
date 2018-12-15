//package test;
//
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//
//import com.blue.configuration.AppConfig;
//import com.blue.dao.UserDAOImpl;
//import com.blue.model.User;
//import com.blue.service.userService;
//
//public class test {
//
//	public static void main(String[] args) {
//		  AnnotationConfigApplicationContext context = 
//		            new AnnotationConfigApplicationContext(AppConfig.class);
//		userService userService = context.getBean(userService.class);
//		input();
//	}
//
//	public static void input() {
//		
//		String nickname = "aaa";
//		String email = "asd@qwe.com";  
//		String password = "aaa";
//		String firstname ="aaa";
//		String lastname = "aaa";
//
//		User user = new User(nickname,email,password);
//		UserDAOImpl userdao = new UserDAOImpl();
//		userdao.register(user);
//		
//	}
//
//}
