@echo off
echo Starting Spring Boot application...
java -version
if errorlevel 1 (
    echo Error: Java is not installed or not in PATH
    pause
    exit /b 1
)

echo Building the project...
call gradlew.bat build -x test
if errorlevel 1 (
    echo Error: Build failed
    pause
    exit /b 1
)

echo Starting the application...
java -jar build/libs/heritage-1.0-SNAPSHOT.jar
pause 