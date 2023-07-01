@echo off

echo ^============================================================
echo ==               Installing MooaToon Project              ==
echo ============================================================^

setlocal enabledelayedexpansion

set repoURL=https://github.com/Jason-Ma-0012/MooaToon-Engine.git
set repoName=MooaToon-Project
set branchName=5.2_MooaToonProject
set PROMPT_ARGUMENT=--prompt --threads=16


if not exist %repoName% mkdir %repoName%
cd %repoName%

git init

:loop
git fetch --depth=1 %repoURL% %branchName%
if not %errorlevel% == 0 (
   echo Fetch failed, retrying in 5 seconds...
   timeout /t 10 /nobreak
   goto loop
)

git checkout FETCH_HEAD
git remote add origin %repoURL%
git pull origin %branchName%
git checkout %branchName%
git merge origin/%branchName%


echo %repoName% successfully cloned.
timeout /t 10