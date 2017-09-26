btw-server()
{
	cd ~/.btw/server/btw-deco-world;
	git pull;
	git branch -v;
	cd ..;
	java -Xmx8G -Xms512M -jar minecraft_server.jar nogui;
	cd btw-deco-world;
	git add .;
	git commit -m 'Carsen ran the server';
	git push;
	git branch -v;
}
btw-client()
{
	cd /home/carsen/.minecraft;
	nohup java -Xmx8G -Xms512M -jar launcher.jar&reset;
}
btw-checkout()
{
	cd ~/.btw/server/btw-deco-world;
	git checkout $1
	git branch --set-upstream-to=origin/$1 $1;
	git pull origin $1;
	git push -u origin $1;
}

github-clone()
{
	if [[ -z $2 ]]; then
		USER=Fatburger3
		REPO=$1
	else
		USER=$1
		REPO=$2
	fi
	git clone "git@github.com:$USER/$REPO"
}

alias dtk-server="cd ~/Documents/discotek-server/;git pull ryan server;SQLALCHEMY_DATABASE_URI='postgresql://jcrzr:anchor99@localhost/postgres';PORT='8080';python3 fill_db.py;python3 serv.py"
alias backup-main="sudo rsync -vrWHAXog --exclude={'/backup','/home/carsen/Videos','/dev/*','/proc/*','/sys/*','/tmp/*','/run/*','/mnt/*','/media/*','/lost+found'} --delete / /backup"
alias dir-sync="rsync -xvrWHAXog"
alias backup-tv="sudo rsync -xvrWHAXog /medialibrary/TV/ /medialibrary/.backup/TV/"
alias backup-movies="sudo rsync -xvrWHAXog /medialibrary/Movies/ /medialibrary/.backup/Movies/"
alias install="sudo apt-get install -y"
alias install-apk="/opt/shashlik/bin/shashlik-install"
alias apk="/opt/shashlik/bin/shashlik-run"
alias uninstall="sudo apt-get remove"
alias purge="sudo apt-get purge"
alias clean="sudo apt-get autoremove"
alias ppa="sudo add-apt-repository"
alias sudo="sudo "
alias update="sudo apt-get update"
alias btw="btw-client;btw-server"
alias http-server="cd /home/carsen/http;sudo python3 -m http.server 80"
alias grab-window-class="xprop | grep WM_CLASS | awk '{print $4}'"
alias fresh-install='update;install'
alias ls-atime='ls -l -t --time=atime'
alias upgrade='sudo apt upgrade'
alias reinstall='sudo apt install --reinstall'
alias dir-dump='mv ./* ../;cd ..'
alias commit='git add .;git commit'
alias dump='mv * ../ ;cd ../;'
alias off='sudo shutdown'
alias totem-play='sh ~/.scripts/totem-play.sh'

msg()
{
	[ -z "$DISPLAY" ] && tput bold && echo -n "$1" && tput sgr0 && echo : && echo "$2" || notify-send -t "0" "$1" "$2"
}

install-ppa()
{
	sudo add-apt-repository $1;
	sudo apt update;
	sudo apt install $2;
}
alias copy-ssh-key='xclip -sel clip < ~/.ssh/id_rsa.pub'
alias mount-media-backup='sudo mount /dev/md127p1 /medialibrary/.backup'
alias py3='python3.6' 
alias conda-mode='PATH=/home/carsen/.anaconda3/bin/:/home/carsen/bin:/home/carsen/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/carsen/.bin'
alias push='git add .; git commit; git push'
