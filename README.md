# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# bookers2.n.m

2023/03/15
bookers2作成開始！

ユーザ認証機能作成のため「devise」をインストール

🍚　今のところテキストに沿って作成中。
　　ログインは「aboutページ」に遷移するようにルーティングしているけど、「user」に遷移するように直さないといけない
　　👉　テキストでいう「8章【投稿機能の作成(1) - モデルを準備しよう(1)】」のところからまた進めて行く！
　　　　投稿機能の作成から。
　　　　
2023/03/16
作成2日目
🍚　カラムのデータ型を変更したい→「$ rails db:rollback」
　　マイグレーションファイルを差し戻し、訂正したあと、もう一度マイグレーションでOK
　　もう一度マイグレーションさせたらうまく行かなったので、再度ロールバックしてマイグレーションしたら訂正できた。
　　同一ページに「new」と「index」なのでbooks/new.html.erbは削除してしまった。これは正解なのか？
　　
　　👉　def newはできたので、今度は「User info」「Book detail」。
　　　　ルーティングが「book/id?」になってないのでここはブックなのかユーザなのか確認してからルーティングをしたいところ。
　　　　

2023/03/17
作成3日目
🍚　ルーティング。。。

2023/03/19
あまり進まなかった