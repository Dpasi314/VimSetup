
# Check to see if we had to create temp file
# If we did, restore original
if [ ! -e ~/.vimtmp ]; then
	echo 'Removing vim folder...';
	rm -rf ~/.vim;
	echo 'Vim file removed!';
else
	echo 'Removing vim folder...';
	rm -rf ~/.vim;
	echo 'Vim file removed!';
	mv -R ~/.vimtmp ~/.vim
fi

if [ ! -e ~/.vimrctmp ]; then
	echo 'Removing vimrc folder!';
	rm ~/.vimrc
	echo 'vimrc removed!';
else
	echo 'Removing vimrc';
	rm ~/.vimrc;
	echo 'Replacing origional file...';
	mv ~/.vimrctmp ~/.vimrc;
	echo 'vimrc re-installed!';
fi

echo 'VimRemove Complete!'
