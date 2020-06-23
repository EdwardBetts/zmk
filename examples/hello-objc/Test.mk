#!/usr/bin/make -f
# This file is a part of zmk test system.
include zmk/internalTest.mk

t:: all install uninstall clean

all: all.log
	GREP -qFx 'cc -MMD -c -o hello-hello.o hello.m' <$<
	GREP -qFx 'cc -MMD -o hello hello-hello.o -lobjc' <$<
install: install.log
	GREP -qFx 'install -d /usr/local/bin' <$<
	GREP -qFx 'install -m 0755 hello /usr/local/bin/hello' <$<
uninstall: uninstall.log
	GREP -qFx 'rm -f /usr/local/bin/hello' <$<
clean: clean.log
	GREP -qFx 'rm -f hello' <$<
	GREP -qFx 'rm -f hello-hello.o'  <$<