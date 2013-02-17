#!/usr/bin/env sh
DIR="$(dirname "$(readlink -f "$0")")"
cd "$DIR"
git pull origin master
if [ "$(readlink -f "$HOME/.minecraft")" != "$DIR" ]; then
	mv "$HOME/.minecraft"/{saves,lastlogin,stats,options.txt} .
	rm -rf "$HOME/.minecraft"
	ln -s "$DIR" "$HOME/.minecraft"
fi
if [ ! -d "config" ]; then
	cp -a config.git config
fi
UNAME="$(uname)"
if [ "$UNAME" = "Linux" ]; then
	cp -a bin/natives natives/linux
else
	cp -a bin/natives natives/macosx
fi
java -Xmx2048M -Xms512M -cp minecraft.jar --noupdate net.minecraft.LauncherFrame
