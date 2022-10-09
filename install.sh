#!/bin/sh

set -e;

f_dir='/usr/local/bin';
[ -d "$f_dir" ] || sudo mkdir -p "$f_dir";
[ -r "$f_dir/spawn" ] ||
	sudo cp -p './spawn' "$f_dir/";

m_dir='/usr/local/share/man/man1';
[ -d "$m_dir" ] || sudo mkdir -p "$m_dir";
[ -r "$m_dir/spawn.1.gz" ] ||
	sudo cp -p './spawn.1.gz' "$m_dir/";

printf \
"The files have been installed,
but you will still need to setup your shell's init file.
See the manual (\$ man spawn) under the \"Setup\" section on how to do this.
" >&2;
