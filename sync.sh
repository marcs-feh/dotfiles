cd config
for dir in * ; do
	rsync -rv "$HOME/.config/$dir" . &
	sleep 0.1s
done
cd ..

rsync -rv "$HOME/.profile" profile
rsync -rv "$HOME/.zshrc" zshrc
rsync -rv "$HOME/.xinitrc" xinitrc

