FROM openjdk:17-jdk-slim as build

WORKDIR /app

# Copy the project files
COPY bookbookbook/mvnw .
COPY bookbookbook/.mvn .mvn
COPY bookbookbook/pom.xml .
COPY bookbookbook/src src

# Build the application
RUN ./mvnw package -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.war)

# The runtime stage
FROM openjdk:17-jdk-slim

ARG DEPENDENCY=/app/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","com.bookbookbook.BookbookbookApplication"]