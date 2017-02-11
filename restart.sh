while true
do
  echo "Pulling that stable code"
  git pull origin master

  echo "Booting up the bot"
  ruby code.rb
done
