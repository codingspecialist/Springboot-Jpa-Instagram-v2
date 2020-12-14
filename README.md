#### Springboot+JPA+InstagrameClone

![blog](https://postfiles.pstatic.net/MjAxOTEyMTRfMTM1/MDAxNTc2MjU4OTMyMjM0.RTRhV5sq3wF1zv7Hh7SqsAKBdYwLxUSnl-5AxXlVrzYg.Q40T906-VCeDkrysRLysPLPma93iJFtUYEaNS_5jOE4g.PNG.getinthere/Screenshot_75.png?type=w773)

![blog](https://postfiles.pstatic.net/MjAxOTEyMDZfMTA0/MDAxNTc1NTkzNTkyOTA0.ikXcdjrVxlaUfbyZrtu9kAG4aBTbu-6jdNemoyUvMNcg.xYC-hf0BFdD8LRjPNNuKuWrRuwd-5TuwZfPQ0GZSZOog.PNG.getinthere/Screenshot_2.png?type=w773)

#### 1. MySQL 한글 설정 (my.ini)
```ini
[client]
default-character-set=utf8

[mysql]
default-character-set=utf8

[mysqld]
collation-server = utf8_unicode_ci
init-connect='SET NAMES utf8'
init_connect='SET collation_connection = utf8_general_ci'
character-set-server=utf8
```

#### 2. 사용자 생성 및 권한 주기 및 DB 생성
- create user 'insta'@'%' identified by 'bitc5600';
- GRANT ALL PRIVILEGES ON 별.별 TO 'insta'@'%';
- create database insta;
- use insta;

#### 3. 환경설정
```xml
<!-- JSP 템플릿 엔진 -->
<dependency>
	<groupId>org.apache.tomcat</groupId>
	<artifactId>tomcat-jasper</artifactId>
	<version>9.0.22</version>
</dependency>

<!-- JSTL -->
<dependency>
	<groupId>javax.servlet</groupId>
	<artifactId>jstl</artifactId>
	<version>1.2</version>
</dependency>
```

```yml
server:
  port: 8080
  servlet:
    context-path: /
    
spring:
  mvc:
    view:
      prefix: /WEB-INF/views/
      suffix: .jsp
      
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/insta?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true
    username: insta
    password: bitc5600
    
  jpa:
    open-in-view: false
    hibernate:
      ddl-auto: create
      naming:
        physical-strategy: org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl
      use-new-id-generator-mappings: false
    show-sql: true
    properties:
      hibernate.enable_lazy_load_no_trans: true  
      hibernate.format_sql: true
      
  servlet:
    multipart:
      enabled: true
      max-file-size: 2MB

  http:
    encoding:
      charset: UTF-8
      enabled: true
      force: true
      
  security:
    user:
      name: test
      password: 1234   

file:
  path: C:/src/instaclone/insta/src/main/resources/upload/
```

#### 4. Blog 주소
<https://blog.naver.com/getinthere/221728643538>

#### 5. Youtube 주소
<https://www.youtube.com/watch?v=LD-1629X4jA>
