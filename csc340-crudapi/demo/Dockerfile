# ---------- BUILD STAGE ----------
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app

# Copy project files
COPY . .

# Build the JAR using Maven wrapper
RUN ./mvnw -q -DskipTests package

# ---------- RUN STAGE ----------
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
