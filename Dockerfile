# 1. 빌드 스테이지
FROM gradle:7.6.1-jdk17-alpine AS builder

WORKDIR /build

# 그래들 파일들 복사
COPY build.gradle settings.gradle /build/
COPY gradle /build/gradle

# 소스 복사
COPY src /build/src

# 권한 부여
RUN chmod +x ./gradlew

# 빌드 실행
RUN gradle build -x test --no-daemon

# 2. 실행 스테이지
FROM eclipse-temurin:17-jre-alpine

# 빌드된 jar 파일을 실행 스테이지로 복사
COPY --from=builder /build/build/libs/*.jar app.jar

# 컨테이너 실행시 실행될 명령어
ENTRYPOINT ["java", "-jar", "/app.jar"]

# 컨테이너 포트 설정
EXPOSE 8080