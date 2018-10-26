#!/usr/bin/env bash
pandoc -f gfm -t html "$1" |grep -o -E '<img src="[^"]+" [^>]+>'|grep -o -E 'src="[^"]+'|cut -d '"' -f2
