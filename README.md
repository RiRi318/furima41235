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
| first name         | string | null: false |
| last name          | string | null: false |
| birth day          | string | null: false | 

### Association

- has_many :items_users
- has_many :orders_users

### items テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| comment            | text   | null: false |
| category_id        | integer| null: false |
| situation_id       | integer| null: false |
| delivery_id        | integer| null: false |
| region_id          | integer| null: false |
| day_id             | integer| null: false |
| price              | integer| null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order_user
- has_one :comments

### orders テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

### comments テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| contents           | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| orders             | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :item
