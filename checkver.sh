#!/bin/bash

pkn=$(cat PKGBUILD | grep -m1 pkgname | awk -F= '{print $2}')

e=$(pacman -Ssq $pkn | grep -m1 "^$pkn\$")

if [ -z $e ]; then
	echo 1
	exit
fi

dbver=$(LANG=C pacman -Si $pkn | grep -m1 Version | awk '{print $3}')
pkv=$(cat PKGBUILD | grep -m1 pkgver | awk -F= '{print $2}')
pkr=$(cat PKGBUILD | grep -m1 pkgrel | awk -F= '{print $2}')

aurver="$pkv-$pkr"

function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }

if [ $(version $dbver) -ge $(version $aurver) ]; then
	echo 0
else
	echo 1
fi

