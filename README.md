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

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| name                | text      | null: false |
| explanation         | text      | null: false |
| category            | integer   | null: false |
| condition           | integer   | null: false |
| shipping_fee_charge | integer   | null: false |
| area                | integer   | null: false |
| shipping_days       | integer   | null: false |
| price               | integer   | null: false |
| user                | references| null: false,foreign_key: true |

### Association

- has_many :users
- has_one :purchase

## purchasesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

##  shippingsテーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| zip                 | integer   | null: false |
| state               | integer   | null: false |
| city                | text      | null: false |
| address_line1       | text      | null: false |
| address_line2       | text      | null: true  |
| telephone_number    | integer   | null: false |
| purchase            | references| null: false,foreign_key: true |

### Association

- belongs_to :purchase

