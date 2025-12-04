package com.example.demo;


import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DemoApplicationTests {



    @Test
    void contextLoads() {
        log.info("測試springbot-test working..");
    }

    /**
     *   <dependency>
     *             <groupId>org.springframework.boot</groupId>
     *             <artifactId>spring-boot-starter-test</artifactId>
     *             <scope>test</scope>
     *   </dependency>
     *
     *   解釋
     *   1. 这是从maven仓库中引入的依赖，其本质就是一个jar包
     *   @SpringBootTest 这个注解是用来测试springboot应用的，它会自动启动springboot应用，并且会自动注入springboot的bean，他需要上面的依赖才能运行
     *
     *   2.建議
     *    2.1 以后用我的docker file 来启动springboot应用，这样可以保证测试环境和生产环境的一致性
     *    2.2 不要用你的dokcer file 文件，因为你的docker file 必须把jar包上传到git仓库中 ，建议在dockr  file容器中编译编码，打jar包，然后启动容器即可
     */

}
