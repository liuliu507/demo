# 【笔记】
#  1.该方式可以避免在本地构建时出现的问题，因为它会在容器内部直接运行 Maven 命令。
#  拉取maven镜像 --》 2)在容器内部运行 Maven 命令 --》 3)將生成的 jar 包复制到主机 --》 4)使用更轻的 JDK 镜像运行应用  --》 5)暴露端口 8080 --》 6)启动应用
#   test
# 第 1 阶段：Maven 构建阶段  1)拉取maven镜像
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
