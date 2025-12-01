# 使用官方OpenJDK 17作为基础镜像
FROM openjdk:17-jdk-slim

# 设置工作目录
WORKDIR /app

# 将Maven构建好的jar包复制到容器内
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# 声明应用运行端口
EXPOSE 8080

# 启动应用
ENTRYPOINT ["java", "-jar", "app.jar"]