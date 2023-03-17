cd config
for dir in * ; do
	rsync -rv "$HOME/.config/$dir" .
done
cd ..

rsync -rv "$HOME/.profile" profile
rsync -rv "$HOME/.zshrc" zshrc
