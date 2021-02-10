#!/bin/bash

. ../libfuse/.vscode/build_util.sh

 __ACFILES_="configure.ac\
 .vscode/build.sh"

__AMFILES_=" Makefile.am\
 doc/Makefile.am\
 examples/Makefile.am\
 include/Makefile.am\
 lib/Makefile.am\
 mount/Makefile.am\
 nfs/Makefile.am\
 nfs4/Makefile.am\
 nlm/Makefile.am\
 nsm/Makefile.am\
 portmap/Makefile.am\
 rquota/Makefile.am\
 tests/Makefile.am\
 utils/Makefile.am"

fun_changes "$__ACFILES_ $__AMFILES_" -f

# 删除之前运行 configure 的状态，使再次运行 configure 能够立即应用新的参数
rm -f config.status
if fun_isChangeFromMulti configure.ac;then
	type autoreconf &>/dev/null && autoreconf -vi
fi

#if fun_isChangeFromMulti configure.ac;then
if fun_isChangeFromMulti "$__ACFILES_";then

	_args="--disable-rpath"
	
	if type busybox &>/dev/null && test `busybox uname -o` = Android ||
	`uname -m` = aarch64 || `uname -m` = aarch;then
		export CONFIG_SHELL=/system/bin/sh
		test `uname -m` = aarch && _args="--target=aarch-linux-android "$_args
		test `uname -m` = aarch64 && _args="--target=aarch64-linux-android "$_args
	else :
		#_args=$_args" --enable-asan"
	fi
	#_args=$_args" --enable-debug"
	sh ./configure $_args
fi

#fun_whereMakeClean "configure.ac $__AMFILES_"
fun_whereMakeClean "$__ACFILES_ $__AMFILES_"

make -j4
