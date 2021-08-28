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

