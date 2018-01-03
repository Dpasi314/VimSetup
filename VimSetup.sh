if [ $# -ne 1 ]; then
	echo "You need to supply at least one argument"
	echo "Applicable flags: -setup [-s], -remove [-r]"
	exit 1
fi

flag=$1
end_pt="~/.vim"
download_git_repo() {
	cd ~/; # We're keeping everything in the home directory for easy access
	git clone https://github.com/Dpasi314/Vim;
	return ~/Vim # If we need to access the file, we'll do that after
}

pull_git_repo() {
	cd ~/Vim;
	git pull;
}

copy_contents_to(){
	cd ~/;
	cp -avr $1 $2
}

if [ $flag == "-setup" ] || [ $flag == "-s" ]; then
	if [ ! -e ~/Vim ]; then
		download_git_repo
	else
		pull_git_repo
	fi

	if [ ! -e ~/.vim ]; then # the .vim folder does't exist.
		mkdir ~/.vim;
		copy_contents_to ~/Vim ~/.vim/;
	else
		mkdir ~/.vimtmp;
		copy_contents_to ~/.vim/ ~/.vimtmp/
	fi
	
	if [ ! -e ~/.vimrc ]; then # the .vimrc file doesn't exist
		copy_contents_to ~/Vim/.vimrc ~/;
	else
		mv ~/.vimrc ~/.vimrctmp
		copy_contents_to ~/Vim/.vimrc ~/;

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
		echo 'Replacing original file...';
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
