# README
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false |
| last_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birth_day          | date   | null: false |

Association
has_many : items
has_many : orders

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| description        | text   | null: false |
| price              | integer| null: false |
| category_id        | integer | null: false |
| item_condition_id  | integer | null: false |
| Shipping_charge_id | integer | null: false |
| prefecture_id      | integer | null: false |
| delivery_day_id    | integer | null: false |
| user               | references | null: false,foreign_key: true |
Association
belongs_to :user
has_one : order



## addresses  テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture_id      | integer| null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string | ----------- |
| phone_number       | string | null: false |
| order              | references | null: false,foreign_key: true |
Association
belongs_to :order


## Orders   テーブル
 | Column         | Type   | Options     |
 | -------------- | ------ | ----------- |
 | user           | references | null: false,foreign_key: true |
 | item           | references | null: false,foreign_key: true |
Association
belongs_to :user
belongs_to :item
has_one : address
