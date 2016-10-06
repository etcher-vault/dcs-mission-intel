@echo off

set output_dir=build
set sources=bajas\core.lua unit-types\unittypes.lua
set sources_standalone=%sources% mist\mist_4_3_74.lua
set build=%output_dir%\bajas.lua
set build_standalone=%output_dir%\bajas-standalone.lua

set comment_prefix=--

if not exist %output_dir% md %output_dir%
set input=%sources%
set output=%build%
call:make
set input=%sources_standalone%
set output=%build_standalone%
call:make
goto:eof

:make
	echo Writing to %output%
	
	break>%output%
	setlocal EnableDelayedExpansion
	set first=1
	for %%a in (%input%) do (
		echo Appending %%a
		if !first!==0 (
			echo.>> %output%
			echo.>> %output%
			echo.>> %output%
		)
	
		echo %comment_prefix%>>%output% %%a
		echo.>> %output%
		type %%a>>%output%
		
		set first=0
	)
	
	echo Done
goto:eof