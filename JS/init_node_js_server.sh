mkdir $1
cd $1

### server を作成
mkdir server
cd server
npm init -y
touch app.js
# npm i ws --save

cd ../
### client を作成
mkdir client
cd client
npm init -y
touch app.js
# npm i ws --save
