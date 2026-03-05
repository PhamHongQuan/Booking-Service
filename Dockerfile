# ========== BUILD STAGE ==========
FROM eclipse-temurin:17-jdk AS builder

WORKDIR /build

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline

COPY src src

RUN ./mvnw clean package -DskipTests


# ========== RUNTIME STAGE ==========
FROM eclipse-temurin:17-jre

WORKDIR /app

# Quan trọng: dùng wildcard để khỏi sai tên file jar
COPY --from=builder /build/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]