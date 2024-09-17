install fish 

>brew install fish

add bin to the allowed shells

>sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'

change default shell

> chsh -s /usr/local/bin/fish


customize fish

curl -L https://get.oh-my.fish | fish