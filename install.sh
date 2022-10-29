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
"
==========================================================================
The files have been installed,
but you still need to setup your shell's init file.
This installer will add code to the end of your init file if you want.
There is no guarantee that the appended code will be reachable.
However, it is likely that code at the end of your init file is reachable.
The manual has a section called \"Setup\" on how to manually install
(\$ man spawn).

A basic install doesn't add locations for the -n and -t flags.
The -n flag spawns a window in your default directory.
The -t flag spawns a window in your directory you use for random tests.
The flag's locations can be defined here at install time,
but you can change them later. See the manual for more.

To end installation to manually install, enter \"q\".
To do a basic install without -n or -t, enter \"b\".
To do an advanced install with -n and/or -t, enter \"a\".
==========================================================================

" >&2;

while read -p 'How do you want to proceed? ' answer || exit 1;do
	case "$answer" in
	b) basic=1; break;;
	a) basic=0; break;;
	q) exit 0;;
	*) printf 'Option not recognized (%s). Unquote it maybe?' "$line";;
	esac
done

case "$(declare -p {BA,Z}SH_VERSION 2>/dev/null)" in
	*BASH*) init_file=~/.bashrc;;
	*ZSH*) init_file=~/.zshrc;;
	*)
		printf '%s\n' \
"Sorry, I don't know where your shell's init script is.
You will have to manually install." >&2;
		exit 1;
		;;
esac

if (($basic));then
	printf '\n. spawn;\n' >> "$init_file";
else
	read -p 'Where would you like -t to go? Leave blank to ignore. ' t;
	read -p 'Where would you like -n to go? Leave blank to ignore. ' n;
	printf '\n%s\n' ". spawn${t:+ -t $t}${n:+ -n $n};" >> "$init_file";
fi
