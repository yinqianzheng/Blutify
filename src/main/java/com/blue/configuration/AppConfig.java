package com.blue.configuration;



import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
 
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.blue")
@PropertySource(value = { "classpath:application.properties" })
@PropertySource(value = { "classpath:languageCN.properties" }, encoding = "UTF-8")
@PropertySource(value = { "classpath:languageEN.properties" })
public class AppConfig extends WebMvcConfigurerAdapter{
     
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/WEB-INF/views/**")
                        .addResourceLocations("/WEB-INF/views/");
	}
	
	@Bean
    public LettuceConnectionFactory connectionFactory() {
            return new LettuceConnectionFactory(); 
    }
	
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }
     
    
//    @Bean(name = "multipartResolver")
//    public CommonsMultipartResolver getResolver() throws IOException {
//        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
//        // no limit
//        resolver.setMaxUploadSize(-1);
//        return resolver;
//    }
    
    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        return messageSource;
    }
    
    
    @Bean
    public BlueEmail blueEmail() {
        return new BlueEmail();
    }
    
    @Bean
    public Encryptor encryptor() {
        return new Encryptor();
    }
    
    @Bean
    public MyResponse myResponse() {
		return new MyResponse();
    }
}
