#	Check to see if .vim exists, if it doesn't create it
if [ ! -e ~/.vim ]; then
	echo 'No dotVim folder found! Creating...';
	mkdir ~/.vim;
	echo 'dotVim created!';
	echo 'Copying over vimFiles';
	cp -R vim/. ~/.vim;
	echo 'Files copied';
else 
	# If they have one, archive, and use mine
	echo 'dotVim Found!..Creating temporary location....';
	cp -R ~/.vim ~/.vimtmp
	echo '~/.vimtmp creatd! Contiuing...';
	cp -R vim/. ~/.vim;
	echo 'Files copied';
fi

#	Check to see if there is a vimrc file
if [ ! -e ~/.vimrc ]; then
	echo 'No vimrc file found! Copying...'
	cp vimrc ~/.vimrc
else
	#Create temp copy over, use mine
	echo 'vimrc found...Creating temporary location...';
	cp ~/.vimrc ~/.vimrctmp;
	echo '~/.vimrctmp created';
	cp vimrc ~/.vimrc;
	echo 'vimrc created!';
fi

echo 'VimSetup Finished';
