package com.www.demo.druid.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * @version 1.0
 * @Description druid配置类
 * @Author www
 * @Date 2021/6/9 21:34
 */
@Configuration
public class DruidConfig {

    /**
     * @Author www
     * @deprecated 使用多数据源时，该方法就不能使用
     * @Date 2021/6/9 21:46
     * @Description 注册druid的数据源对象
     * @return javax.sql.DataSource
     */
//    @Bean
//    @ConfigurationProperties(prefix = "spring.datasource.druid")
//    public DataSource druidDataSource(){
//        return new DruidDataSource();
//    }
    /**
     * @Author www
     * @Date 2021/6/9 21:48
     * @Description 设置druid后台监控功能
     * 因为spring boot内置了servlet容器，所以没有web.xml，替代方法使用：ServletRegistrationBean
     * 注：监控页面路径为：localhost:8080/druid
     * @return org.springframework.boot.web.servlet.ServletRegistrationBean
     */
    @Bean
    public ServletRegistrationBean statViewServlet(){
        ServletRegistrationBean bean = new ServletRegistrationBean(new StatViewServlet(),"/druid/*");
        Map<String,String> initParam = new HashMap<>();
        //登录的key固定，不能改变
        initParam.put("loginUsername","admin");
        initParam.put("loginPassword","www362412");
        //设置运行访问IP
        initParam.put("allow","");
        //设置禁止访问的IP，key值自定义
//        initParam.put("www","192.168.1.105");
        //设置初始化参数
        bean.setInitParameters(initParam);
        return  bean;
    }
    /**
     * @Author www
     * @Date 2021/6/9 21:56
     * @Description druid监控过滤器
     *
     * @return org.springframework.boot.web.servlet.FilterRegistrationBean
     */
    @Bean
    public FilterRegistrationBean webStatFilter(){
        FilterRegistrationBean bean = new FilterRegistrationBean();
        bean.setFilter(new WebStatFilter());
        Map<String,String> initParam = new HashMap<>();
        //设置不统计的过滤器
        initParam.put("exclusions","*.js,*.css,/druid/*");
        bean.setInitParameters(initParam);
        return bean;
    }
}
