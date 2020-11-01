# テーブル設計

## users テーブル

| Column   | Type   | Options                    |
| -------- | ------ | -------------------------- |
| name     | string | null: false                |
| email    | string | null: false, unique: true	 |
| password | string | null: false, unique: true	 |

### Association

- has_many :items
- has_many :buys

## items　テーブル

| Column     | Type      | Options                       |
| ---------- | --------- | ----------------------------- |
| user_id    | references| null: false, foreign_key: true|
| name       | string    | null: false                   |
| description| text      | null: false                   |
| price      | integer   | null: false                   |
| images     | integer   | null: false                   |


### Association

- belongs_to :user
- has_one    :buy



## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

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
| purchas      | references | null: false, foreign_key: true |
### Association

- belongs_to :buy