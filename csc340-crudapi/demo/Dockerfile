# ---------- BUILD STAGE ----------
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app

COPY . .

RUN ./mvnw -q -DskipTests package

# ---------- RUN STAGE ----------
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
