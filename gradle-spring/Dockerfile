FROM eclipse-temurin:11-jdk-jammy as build
WORKDIR /workspace/app

RUN --mount=type=cache,target=/root/.gradle \
        --mount=type=bind,source=gradlew,target=gradlew \
        --mount=type=bind,source=build.gradle,target=build.gradle \
        --mount=type=bind,source=settings.gradle,target=settings.gradle \
        --mount=type=bind,source=lombok.config,target=lombok.config \
        --mount=type=bind,source=gradle,target=gradle \
        --mount=type=bind,source=src,target=src \
        ./gradlew clean build -x test
RUN mkdir -p build/dependency && (cd build/dependency; jar -xf ../libs/*-SNAPSHOT.jar)

FROM eclipse-temurin:11-jdk-jammy
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/build/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]
