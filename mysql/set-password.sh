echo 'input new PASSWORD'
read PASS
sed -i "s/password/$PASS/g" *