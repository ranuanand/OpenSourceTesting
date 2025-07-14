# Use an official Java 17 runtime as a base image
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy everything from your project directory to /app
COPY . .

# Build the application using Maven (skip tests to speed up build)
RUN ./mvnw clean package -DskipTests

# Expose port 8080 (Render assigns this automatically via PORT env)
EXPOSE 8080

# Run the Spring Boot app
CMD ["java", "-jar", "target/devops-0.0.1-SNAPSHOT.jar"]
