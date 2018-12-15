package com.blue.configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

//public class ApplicationInitializer implements WebApplicationInitializer {
////	@Autowired
////    private Environment environment;
//	
//    public void onStartup(ServletContext container) throws ServletException {
// 
//        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
//        ctx.register(AppConfig.class);
//        ctx.setServletContext(container);
////        container.setAttribute("defautImage", environment.getRequiredProperty("image.default"));
// 
//        ServletRegistration.Dynamic servlet = container.addServlet("dispatcher", new DispatcherServlet(ctx));
// 
//        servlet.setLoadOnStartup(1);
//        servlet.addMapping("/");
//    }
// 
//}
