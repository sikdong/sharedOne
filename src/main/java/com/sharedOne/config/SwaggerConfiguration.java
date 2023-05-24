package com.sharedOne.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
public class SwaggerConfiguration {
  // Docket: Swagger 설정의 핵심이 되는 Bean
  // API 자체에 대한 스펙은 컨트롤러에서 작성
  @Bean
  public Docket api(){
      return new Docket(DocumentationType.OAS_30)
              .useDefaultResponseMessages(true)
    		  .apiInfo(apiInfo())
              .select()
              .apis(RequestHandlerSelectors.basePackage("com.sharedOne"))
              .paths(PathSelectors.any())
              .build();
  }
	
	 private ApiInfo apiInfo(){ 
		 return new ApiInfoBuilder()
				 .title("API with Swagger") 
				 .description("영업부 주문 관리 프로젝트 swagger api 문서 입니다")
				 .version("1.0.0") 
				 .build(); 
		 }
	 
}