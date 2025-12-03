# 第 1 阶段：Maven 构建阶段  1)拉取mavne鏡像
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# 复制整个项目（包含 pom.xml 和 src）
COPY . .

# 构建 jar 包（跳过测试，加快速度） -DskipTests [!!improtant]
RUN mvn clean package -DskipTests

# 第 2 阶段：运行阶段，使用更轻的 JDK
FROM eclipse-temurin:17-jdk
WORKDIR /app

# 从构建阶段复制生成的 jar
COPY --from=builder /app/target/*.jar app.jar

# 暴露端口
EXPOSE 8080

# 启动 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "app.jar"]
