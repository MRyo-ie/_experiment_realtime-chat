## 概要
「サーバーとのリアルタイム同期」を、実際に動かして試してみた。  
（大学院の講義『UI/UX論』の課題の一貫で）  
- 主に WebSocket について。
- JavaScript / Python について、動きそうなソースコードを一通り触ってみた。 


## JS
1. [5分で動かせるwebsocketのサンプル3つ](https://qiita.com/okumurakengo/items/a8ccea065f5659d1a1de) の socket.io の例を動かしてみた。
   - 普通に動いた。
   - 起動方法
     - server (node.js)
         ```
         $ cd JS/socket.io/server
         $ node run
         ```
       - node.js
       - 必要ライブラリ
         - express
         - http
         - socket.io
     - client (ブラウザ)
         http://localhost:3000
   - 実行結果（元サイトより引用）
     - ![](https://qiita-user-contents.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F142910%2Fa02daae2-b27d-7456-bbf7-0ba3379110e5.gif?ixlib=rb-1.2.2&auto=format&gif-q=60&q=75&w=1400&fit=max&s=d3fbedd021c08946e42d7a58841ee240)




## Python
1. [Flaskとwebsocketを使った簡易的なチャットを開発する](https://note.com/shimakaze_soft/n/n99b47eccd915)
   - 結果
     - ページをリロードすると、再接続することを確認した。
       - ![デモ_再接続](https://user-images.githubusercontent.com/23465225/89506116-95547e00-d805-11ea-832c-adbf0492a0e5.gif)
     - リアルタイムで メッセージが同期されることを確認した。
       - ![デモ_リアルタイム同期](https://user-images.githubusercontent.com/23465225/89508522-fdf12a00-d808-11ea-93ee-faaad77789df.gif)
     - （おまけ）以下、動くまでの経緯など
       1. 元サイトのソースコードは、一応は動いた。
          - が、複数ページ間での同期はされなかった。（未実装）
          - 諦めて、2. のサイトのに移行した。
       2. 2.が失敗した後、
          - 3.と組み合わせれば行けそうだったので、3. をベースに改良。
            → まともに動いた。
   - install
        ```
        cd Python/gevent-websocket-flask
        pip3 install  -r requirements.txt
        ```
   - 起動方法
     - server (Python Flask)
        ```
        cd Python/gevent-websocket-flask
        python3 app.py
        ```
     - client (ブラウザ jquery)
        http://localhost:8080

2. [Responder + WebSocketで簡易チャットアプリ](https://qiita.com/KeisukeToyota/items/6da58ef0152bb14869ff)
   - 動かなかった...。
   - install
        ```
        pip3 install responder
        ```
   - 起動方法
     - server (Python Responder)
        ```
        cd Python/responder-websocket-chat
        python3 app.py
        ```
     - client (ブラウザ jquery)
        http://127.0.0.1:5042

3. [PythonとBottleでWebSocketサーバ/クライアントを実装](https://doitu.info/blog/5aabc92d31e68500964d9255)
   - （課題用のサーバーの実装に合わせるために）Flask でやりたかったので、1. + 3. で改良してみた。 
   - 結果は、↑ 1. に示した通り。
