# README

# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false |
| first_name             | string | null: false |
| last_name              | string | null: false |
| first_name_kana        | string | null: false |
| last_name_kana         | string | null: false |
| birth_date             | date   | null: false |

### Association

- has_many :items
- has_many :purchases

##  itemsテーブル

| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| name                   | string    | null: false |
| explanation            | text      | null: false |
| category_id            | integer   | null: false |
| condition_id           | integer   | null: false |
| shipping_fee_charge_id | integer   | null: false |
| area_id                | integer   | null: false |
| shipping_day_id        | integer   | null: false |
| price                  | integer   | null: false |
| user                   | references| null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- has_one :shipping
- belongs_to :item
- belongs_to :user

##  shippingsテーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| zip                 | string    | null: false |
| area_id             | integer   | null: false |
| city                | string    | null: false |
| street_address      | string    | null: false |
| building_name       | string    |             |
| telephone_number    | string    | null: false |
| purchase            | references| null: false,foreign_key: true |

### Association

- belongs_to :purchase

