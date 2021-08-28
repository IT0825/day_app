# アプリケーション名
>day_app_36548

# アプリケーション概要
>日報を作成管理できます。
>管理者を作成すると、全ての日報を閲覧できます。
>また、管理者のみがユーザーの作成・編集・削除・一覧の権限を持ちます。
>日報の作成はユーザーのみが作成可能です。
>ユーザーでログイン時は本人が作成した日報のみが表示されます。
>また、日報の編集は作成本人しかできません。

# URL
>https://day-app-36548.herokuapp.com/

# Basic認証
>ID:admin
>Psss:2222

# テスト用アカウント管理者
>管理者
- アドレス:ka@com
- パスワード：Ka0000

# テスト用アカウントユーザー
>ユーザーA
- アドレス:ua@com
- パスワード：Ua0000
>ユーザーB
- アドレス:ub@com
- パスワード：Ub0000
>ユーザーC
- アドレス:uc@com
- パスワード：Uc0000
>ユーザーD
- アドレス:ud@com
- パスワード：Ud0000
>ユーザーE
- アドレス:ue@com
- パスワード：Ue0000

# 利用方法
ヘッダーにある管理者ログインで上記の管理者のアドレスとパスワードを入力してログインすると現在作成されている全ての日報を閲覧することができます。  
上部の検索フォームの題名にキーワードを入れると題名でそのワードが含まれている日報のみが表示することができます。  
作成日時は記入した日にちより未来を表示することができます。  
例：2021年01月01日01時00分の場合(202101010100)と検索。  
ユーザーでログインする場合はヘッダーのログインボタンをクリックして上部のアドレスとパスワードを記入して入力します。  
ログインするとトップページに遷移されますのでトップページの日報作成ボタンをクリックで日報作成の画面へ遷移されますので、題名と本文を入力して確認ボタンをクリックして確認画面へ遷移がされます。  
内容に問題なければ作成ボタンクリックで日報作成できます。

# 目指した課題解決
業務で日報の管理をしやすくするために作成しました。  
過去の日報を検索したいときは題名や日付で探すことができます。  
私の前職ではEXCELで日報を作成をしてメールで上司へ提出していました。  
複数人部下がいるとメールの件数なども膨大になるためアプリケーションで管理すると閲覧も容易にできます。  
そういった日々の業務の負担を少しでも軽減できることを考えました。

# 要件定義スプレットシート
https://docs.google.com/spreadsheets/d/1rCpSHCLlGGtRPMAQpjLGS511aF4gnqhgc1o9xaYsxSQ/edit#gid=282075926

# 実装した機能についての画像やGIF及びその説明
- ログイン方法
[![Image from Gyazo](https://i.gyazo.com/f6ba1e03a72f2a1117f345289aa7bc9d.gif)](https://gyazo.com/f6ba1e03a72f2a1117f345289aa7bc9d)
- 日報作成方法
[![Image from Gyazo](https://i.gyazo.com/c6d00b3513a3d038e3b4061500b850ec.gif)](https://gyazo.com/c6d00b3513a3d038e3b4061500b850ec)
- 題名検索挙動
[![Image from Gyazo](https://i.gyazo.com/6b8eb4980a91ca32b51fe7f173829e03.gif)](https://gyazo.com/6b8eb4980a91ca32b51fe7f173829e03)
- 題名と作成日付の検索挙動
[![Image from Gyazo](https://i.gyazo.com/fe3bb558b0607600bb7d1ff0baf8f41f.gif)](https://gyazo.com/fe3bb558b0607600bb7d1ff0baf8f41f)
- 日報詳細画面遷移方法
[![Image from Gyazo](https://i.gyazo.com/830f635f8a3ec3b30f62aeac8e6c5094.gif)](https://gyazo.com/830f635f8a3ec3b30f62aeac8e6c5094)
- ユーザー一覧画面遷移
[![Image from Gyazo](https://i.gyazo.com/93539ee00f69c19bf4b1a37f9989cc9d.gif)](https://gyazo.com/93539ee00f69c19bf4b1a37f9989cc9d)

# 今後実装予定の機能
日報詳細画面にコメント機能を実装したいと思います。  
実装することで、日報に対してのフィードバックなど管理者とユーザーのコミニケーションができます。  

# データベース設計
##　admins テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| name                | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |

### Association

- なし

##　users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| name                | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |

### Association

- has_many :reports

## reports  テーブル

| Column | Type        | Options                         |
| -------| ----------- | ------------------------------- |
| title  | string      | null: false, limit: 30          |
| text   | text        | null: false                     |
| user   | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user

# ローカルでの動作方法
- % git clone https://github.com/IT0825/day_app.git
- % cd day_app
- % bundle install
- % yarn install
- % rails db:create
- % rails db:migrate

# バージョン
- ruby '2.6.5'

# パッケージ
- nodejs
- yarn
- rbenv