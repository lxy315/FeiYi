@echo off
echo Starting Spring Boot application...

REM 设置Maven环境变量
set MAVEN_HOME=C:\Program Files\Apache\maven
set PATH=%MAVEN_HOME%\bin;%PATH%

REM 清理并编译项目
echo Building the project...
call mvn clean install -DskipTests
if errorlevel 1 (
    echo Error: Build failed
    pause
    exit /b 1
)

REM 运行项目
echo Starting the application...
call mvn spring-boot:run
pause 