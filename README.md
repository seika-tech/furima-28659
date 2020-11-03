# テーブル設計

## users テーブル

| Column         　　| Type   | Options                                       |
| -------------  　　| ------ | --------------------------------------------- |
| name           　　| string | null: false,encrypted_password                |
| email          　　| string | null: false, unique: true	                    |
| encrypted_password| string | null: false, unique: true　　　　　　　　　　　　　|
| last_name      　　| string | null: false                                   |
| first_name     　　| string | null: false                                   |
| last_name_kana 　　| string | null: false                                   |
| first_name_kana　　| string | mull: false                                   |
| birth_date     　　| date   | null: false                                   |



### Association

- has_many :items
- has_many :buys

## items　テーブル

| Column                 | Type      | Options                       |
| ---------------------  | --------- | ----------------------------- |
| product_name           | string    | null: false                   |
| product_description    | text      | null: false                   |
| category_id            | integer   | null: false                   |
| product_condition_id   | integer   | null: false                   |
| delivery_fee_id        | integer   | null: false                   |
| delivery_area_id       | integer   | null: false                   |
| days_id                | integer   | null: false                   |
| price                  | integer   | null: false　　　　　　　　　　　 |
| user                   |references | null: false, foreign_key: true|

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

| Column        |   Type     | Options                        |
| ------------  | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| city          | string     | null: false                    |
| building_name |  string    |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |
| prefectures_id|　integer 　 | null: false                    |
| address       | string     | null: false                    |
### Association

- belongs_to :buy