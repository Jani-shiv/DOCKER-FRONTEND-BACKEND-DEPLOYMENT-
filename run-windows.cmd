@echo off
echo ==========================================
echo Docker Frontend + Backend Assignment
echo ==========================================
echo.
docker --version
docker compose version
echo.
echo Validating Docker Compose...
docker compose config
if errorlevel 1 goto :error
echo.
echo Building and starting containers...
docker compose up -d --build
if errorlevel 1 goto :error
echo.
echo Container status:
docker compose ps
echo.
echo Open http://localhost:8080 in your browser.
echo.
pause
goto :eof

:error
echo.
echo Something went wrong. Check the command output above.
pause
exit /b 1
