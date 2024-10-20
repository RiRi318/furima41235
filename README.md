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

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| katakana_firstname | string | null: false |
| katakana_lastname  | string | null: false |
| birthday           | date   | null: false | 

### Association

- has_many :items_user
- has_many :orders_user

### items テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| comment            | text   | null: false |
| category_id        | integer| null: false |
| situation_id       | integer| null: false |
| delivery_id        | integer| null: false |
| region_id          | integer| null: false |
| deliveryday_id     | integer| null: false |
| price              | integer| null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders_user

### orders テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address

### address テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| state              | string     | null: false                    |
| city               | string     | null: false                    |
| street_address     | string     | null: false                    |
| address_line       | string     | null: false                    |
| call               | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :address
