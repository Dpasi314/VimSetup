if [ $# -ne 1 ]; then
	echo "You need to supply at least one argument"
	echo "Applicable flags: -setup [-s], -remove [-r]"
	exit 1
fi

flag=$1
if [ $flag == "-setup" ] || [ $flag == "-s" ]; then
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
		echo '~/.vimtmp created! Contiuing...';
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
	exit 1

elif [ $flag == "-remove" ] || [ $flag == "-r" ]; then
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
	exit 1

else
	echo "Unknown flag type!"
	echo "Applicable flags: -setup [-s], -remove [-r]"
	exit 1
fi
