package com.pms.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@ImportResource({"classpath:spring/spring-context.xml"})
/*@PropertySource(value = {"file:/opt/config/config-front.properties"},
ignoreResourceNotFound = true)*/
//@PropertySource(value = {"file:${pay_conf_path}/config-pay.properties","file:${pay_conf_path}/config-boss.properties"},
@PropertySource(value = {"config-web.properties"},
ignoreResourceNotFound = true)
public class BootServiceStart implements EmbeddedServletContainerCustomizer{
	
	private final static Logger logger = LoggerFactory.getLogger(BootServiceStart.class);
	
	@Value("${pms.http.port}") 
	private int pmsPort;
	
	public static void main(String[] args) throws InterruptedException {
	 ApplicationContext ctx = new SpringApplicationBuilder()
               .sources(BootServiceStart.class)
               .web(true)  //开启web服务
               .run(args);

	 try {
		logger.info("项目启动!");
	} catch (Exception e) {
		e.printStackTrace();
	}
     
	}
	

	@Override
	public void customize(ConfigurableEmbeddedServletContainer container) {
		container.setPort(pmsPort);//指定web端口
	}
	
	
	
}
