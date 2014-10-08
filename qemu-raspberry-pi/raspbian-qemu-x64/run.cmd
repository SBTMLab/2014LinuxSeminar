@echo off
echo Copyright (c) 2014 SBTM Lab.
echo http://sbtm.yonsei.ac.kr/
echo https://github.com/SBTMLab/2014LinuxSeminar
PUSHD %~dp0
if exist *.img (

	for %%a in (*.img) do (
		set imgname=%%a
		echo %%a 파일을 사용합니다.
		goto break
	)
	:break
	cd qemu
	qemu-system-arm.exe -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -hda ..\%imgname%
	cd ..
) 
if not exist *.img (
echo img파일이 없습니다.
)
pause