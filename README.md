# テーブル設計

## users テーブル

| Column         | Type   | Options                                       |
| -------------  | ------ | --------------------------------------------- |
| name           | string | null: false                                   |
| email          | string | null: false, unique: true	                    |
| password       | string | null: false, unique: true, encrypted_password |
| last_name      | string | null: false                                   |
| first_name     | string | null: false                                   |
| last_name_kana | string | null: false                                   |
| first_name_kana| string | mull: false                                   |
| birth_date     | date   | null: false                                   |



### Association

- has_many :items
- has_many :buys

## items　テーブル

| Column              | Type      | Options                       |
| ------------------  | --------- | ----------------------------- |
| user                | references| null: false, foreign_key: true|
| product name        | string    | null: false                   |
| product description | string    | null: false                   |
| category            | string    | null: false                   |
| product condition   | string    | null: false                   |
| delivery fee        | string    | null: false                   |
| delivery area       | string    | null: false                   |
| days                | integer   | null: false                   |



### Association

- belongs_to :user
- has_one    :buy



## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| city         | integer    | null: false                    |
| building_name| references |                                |
| phone_number | string     | null: false, unique: true      |
| purchase     | references | null: false, foreign_key: true |
| prefectures  |　string　　 | null: false                    |       
### Association

- belongs_to :buy