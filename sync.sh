cd config
for dir in * ; do
	rsync -rv "$HOME/.config/$dir" . &
done
cd ..

cd scripts
for s in * ; do
	rsync -rv "$HOME/.scripts/$s" . &
done
cd ..

rsync -rv "$HOME/.profile" profile
rsync -rv "$HOME/.zshrc" zshrc
rsync -rv "$HOME/.xinitrc" xinitrc

