package com.blue.configuration;

import java.util.Properties;

import javax.sql.DataSource;
 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.blue.model.Chinese;
import com.blue.model.English;
 
@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.blue.configuration" })
public class HibernateConfiguration {
 
    @Autowired
    private Environment environment;
 
    
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan(new String[] { "com.blue.model" });
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
     }
    
     
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.driverClassName"));
        dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
        dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
        dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
        return dataSource;
    }
    
     
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
        return properties;        
    }
    
     
    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(s);
       return txManager;
    }
    
    
    @Bean
    public English english() {
    		English en = new English();
    		en.setWelcome(environment.getRequiredProperty("EN.welcome"));
    		en.setCreateAccount(environment.getRequiredProperty("EN.createAccount"));
    		en.setHadAccount(environment.getRequiredProperty("EN.hadAccount"));
    		en.setLogin(environment.getRequiredProperty("EN.login"));
    		en.setForgetPassword(environment.getRequiredProperty("EN.forgetPassword"));
    		en.setUpgrade(environment.getRequiredProperty("EN.upgrade"));
    		en.setPrivatesession(environment.getRequiredProperty("EN.privatesession"));
    		en.setSearch(environment.getRequiredProperty("EN.search"));
    		en.setSetting(environment.getRequiredProperty("EN.setting"));
    		en.setAccount(environment.getRequiredProperty("EN.account"));
    		en.setDelete(environment.getRequiredProperty("EN.delete"));
    		en.setLogout(environment.getRequiredProperty("EN.logout"));
    		en.setMain(environment.getRequiredProperty("EN.main"));
    		en.setBrowse(environment.getRequiredProperty("EN.browse"));
    		en.setConcert(environment.getRequiredProperty("EN.concert"));
    		en.setYourmusic(environment.getRequiredProperty("EN.yourmusic"));
    		en.setSongs(environment.getRequiredProperty("EN.songs"));
    		en.setArtists(environment.getRequiredProperty("EN.artists"));
    		en.setAlbums(environment.getRequiredProperty("EN.albums"));
    		en.setSong(environment.getRequiredProperty("EN.song"));
    		en.setArtist(environment.getRequiredProperty("EN.artist"));
    		en.setAlbum(environment.getRequiredProperty("EN.album"));
    		en.setHistory(environment.getRequiredProperty("EN.history"));
    		en.setPlaylists(environment.getRequiredProperty("EN.playlists"));
    		en.setNewplaylist(environment.getRequiredProperty("EN.newplaylist"));
    		en.setFindfriends(environment.getRequiredProperty("EN.findfriends"));
    		en.setTime(environment.getRequiredProperty("EN.time"));
    		en.setMore(environment.getRequiredProperty("EN.more"));
    		en.setEmail(environment.getRequiredProperty("EN.email"));
    		en.setPassword(environment.getRequiredProperty("EN.password"));
    		en.setRepassword(environment.getRequiredProperty("EN.repassword"));
    		en.setFirstname(environment.getRequiredProperty("EN.firstname"));
    		en.setLastname(environment.getRequiredProperty("EN.lastname"));
    		en.setNickname(environment.getRequiredProperty("EN.nickname"));
    		en.setSubmit(environment.getRequiredProperty("EN.submit"));
    		en.setClose(environment.getRequiredProperty("EN.close"));
    		en.setRelatedartists(environment.getRequiredProperty("EN.relatedartists"));
    		en.setSave(environment.getRequiredProperty("EN.save"));
    		en.setSaved(environment.getRequiredProperty("EN.saved"));
    		en.setAddtoqueue(environment.getRequiredProperty("EN.addtoqueue"));
    		en.setAddtoplaylist(environment.getRequiredProperty("EN.addtoplaylist"));
    		en.setUpcomingconcert(environment.getRequiredProperty("EN.upcomingconcert"));
    		en.setMysonglibrary(environment.getRequiredProperty("EN.mysonglibrary"));
    		en.setMyartistlibrary(environment.getRequiredProperty("EN.myartistlibrary"));
    		en.setMyalbumlibrary(environment.getRequiredProperty("EN.myalbumlibrary"));
    		en.setPlayhistory(environment.getRequiredProperty("EN.playhistory"));
    		en.setAddanuserasfriend(environment.getRequiredProperty("EN.addanuserasfriend"));
    		en.setEnteranusername(environment.getRequiredProperty("EN.enteranusername"));
    		en.setAdd(environment.getRequiredProperty("EN.add"));
    		en.setCancel(environment.getRequiredProperty("EN.cancel"));
    		en.setFollow(environment.getRequiredProperty("EN.follow"));
    		en.setFollowed(environment.getRequiredProperty("EN.followed"));
    		en.setPreferences(environment.getRequiredProperty("EN.preferences"));
    		en.setLanguages(environment.getRequiredProperty("EN.languages"));
    		en.setOptions(environment.getRequiredProperty("EN.options"));
    		en.setpUblic(environment.getRequiredProperty("EN.public"));
    		en.setpRivate(environment.getRequiredProperty("EN.private"));
    		en.setNewplaylist(environment.getRequiredProperty("EN.newplaylist"));
    		en.setFindfriend(environment.getRequiredProperty("EN.findfriend"));
    		en.setSearch(environment.getRequiredProperty("EN.search"));
    		en.setPlay(environment.getRequiredProperty("EN.play"));
    		en.setEditplaylist(environment.getRequiredProperty("EN.editplaylist"));
    		en.setRemove(environment.getRequiredProperty("EN.remove"));
    		en.setAbout(environment.getRequiredProperty("EN.about"));
    		en.setPrivacy(environment.getRequiredProperty("EN.privacy"));
    		en.setDowngrade(environment.getRequiredProperty("EN.downgrade"));
    		en.setAccountoverview(environment.getRequiredProperty("EN.accountoverview"));
    		en.setProfile(environment.getRequiredProperty("EN.profile"));
    		en.setEditprofile(environment.getRequiredProperty("EN.editprofile"));
    		en.setChangesetting(environment.getRequiredProperty("EN.changesetting"));
    		en.setBluefree(environment.getRequiredProperty("EN.bluefree"));
    		en.setPaymenthistory(environment.getRequiredProperty("EN.paymenthistory"));
    		en.setGetreport(environment.getRequiredProperty("EN.getreport"));
    		en.setEnglish(environment.getRequiredProperty("EN.english"));
    		en.setChinese(environment.getRequiredProperty("EN.chinese"));
    		en.setPlaylistname(environment.getRequiredProperty("EN.playlistname"));
    		en.setChange(environment.getRequiredProperty("EN.change"));
    		return en;
    }
    
    @Bean
    public Chinese chinese() {
    		Chinese cn = new Chinese();
    		cn.setWelcome(environment.getRequiredProperty("CN.welcome"));
    		cn.setCreateAccount(environment.getRequiredProperty("CN.createAccount"));
    		cn.setHadAccount(environment.getRequiredProperty("CN.hadAccount"));
    		cn.setLogin(environment.getRequiredProperty("CN.login"));
    		cn.setForgetPassword(environment.getRequiredProperty("CN.forgetPassword"));
    		cn.setUpgrade(environment.getRequiredProperty("CN.upgrade"));
    		cn.setPrivatesession(environment.getRequiredProperty("CN.privatesession"));
    		cn.setSearch(environment.getRequiredProperty("CN.search"));
    		cn.setSetting(environment.getRequiredProperty("CN.setting"));
    		cn.setAccount(environment.getRequiredProperty("CN.account"));
    		cn.setDelete(environment.getRequiredProperty("CN.delete"));
    		cn.setLogout(environment.getRequiredProperty("CN.logout"));
    		cn.setMain(environment.getRequiredProperty("CN.main"));
    		cn.setBrowse(environment.getRequiredProperty("CN.browse"));
    		cn.setConcert(environment.getRequiredProperty("CN.concert"));
    		cn.setYourmusic(environment.getRequiredProperty("CN.yourmusic"));
    		cn.setSongs(environment.getRequiredProperty("CN.songs"));
    		cn.setArtists(environment.getRequiredProperty("CN.artists"));
    		cn.setAlbums(environment.getRequiredProperty("CN.albums"));
    		cn.setSong(environment.getRequiredProperty("CN.song"));
    		cn.setArtist(environment.getRequiredProperty("CN.artist"));
    		cn.setAlbum(environment.getRequiredProperty("CN.album"));
    		cn.setHistory(environment.getRequiredProperty("CN.history"));
    		cn.setPlaylists(environment.getRequiredProperty("CN.playlists"));
    		cn.setNewplaylist(environment.getRequiredProperty("CN.newplaylist"));
    		cn.setFindfriends(environment.getRequiredProperty("CN.findfriends"));
    		cn.setTime(environment.getRequiredProperty("CN.time"));
    		cn.setMore(environment.getRequiredProperty("CN.more"));
    		cn.setEmail(environment.getRequiredProperty("CN.email"));
    		cn.setPassword(environment.getRequiredProperty("CN.password"));
    		cn.setRepassword(environment.getRequiredProperty("CN.repassword"));
    		cn.setFirstname(environment.getRequiredProperty("CN.firstname"));
    		cn.setLastname(environment.getRequiredProperty("CN.lastname"));
    		cn.setNickname(environment.getRequiredProperty("CN.nickname"));
    		cn.setSubmit(environment.getRequiredProperty("CN.submit"));
    		cn.setClose(environment.getRequiredProperty("CN.close"));
    		cn.setRelatedartists(environment.getRequiredProperty("CN.relatedartists"));
    		cn.setSave(environment.getRequiredProperty("CN.save"));
    		cn.setSaved(environment.getRequiredProperty("CN.saved"));
    		cn.setAddtoqueue(environment.getRequiredProperty("CN.addtoqueue"));
    		cn.setAddtoplaylist(environment.getRequiredProperty("CN.addtoplaylist"));
    		cn.setUpcomingconcert(environment.getRequiredProperty("CN.upcomingconcert"));
    		cn.setMysonglibrary(environment.getRequiredProperty("CN.mysonglibrary"));
    		cn.setMyartistlibrary(environment.getRequiredProperty("CN.myartistlibrary"));
    		cn.setMyalbumlibrary(environment.getRequiredProperty("CN.myalbumlibrary"));
    		cn.setPlayhistory(environment.getRequiredProperty("CN.playhistory"));
    		cn.setAddanuserasfriend(environment.getRequiredProperty("CN.addanuserasfriend"));
    		cn.setEnteranusername(environment.getRequiredProperty("CN.enteranusername"));
    		cn.setAdd(environment.getRequiredProperty("CN.add"));
    		cn.setCancel(environment.getRequiredProperty("CN.cancel"));
    		cn.setFollow(environment.getRequiredProperty("CN.follow"));
    		cn.setFollowed(environment.getRequiredProperty("CN.followed"));
    		cn.setPreferences(environment.getRequiredProperty("CN.preferences"));
    		cn.setLanguages(environment.getRequiredProperty("CN.languages"));
    		cn.setOptions(environment.getRequiredProperty("CN.options"));
    		cn.setpUblic(environment.getRequiredProperty("CN.public"));
    		cn.setpRivate(environment.getRequiredProperty("CN.private"));
    		cn.setNewplaylist(environment.getRequiredProperty("CN.newplaylist"));
    		cn.setFindfriend(environment.getRequiredProperty("CN.findfriend"));
    		cn.setSearch(environment.getRequiredProperty("CN.search"));
    		cn.setPlay(environment.getRequiredProperty("CN.play"));
    		cn.setEditplaylist(environment.getRequiredProperty("CN.editplaylist"));
    		cn.setRemove(environment.getRequiredProperty("CN.remove"));
    		cn.setAbout(environment.getRequiredProperty("CN.about"));
    		cn.setPrivacy(environment.getRequiredProperty("CN.privacy"));
    		cn.setDowngrade(environment.getRequiredProperty("CN.downgrade"));
    		cn.setAccountoverview(environment.getRequiredProperty("CN.accountoverview"));
    		cn.setProfile(environment.getRequiredProperty("CN.profile"));
    		cn.setEditprofile(environment.getRequiredProperty("CN.editprofile"));
    		cn.setChangesetting(environment.getRequiredProperty("CN.changesetting"));
    		cn.setBluefree(environment.getRequiredProperty("CN.bluefree"));
    		cn.setPaymenthistory(environment.getRequiredProperty("CN.paymenthistory"));
    		cn.setGetreport(environment.getRequiredProperty("CN.getreport"));
    		cn.setEnglish(environment.getRequiredProperty("CN.english"));
    		cn.setChinese(environment.getRequiredProperty("CN.chinese"));
    		cn.setPlaylistname(environment.getRequiredProperty("CN.playlistname"));
    		cn.setChange(environment.getRequiredProperty("CN.change"));

    		return cn;
    }
}