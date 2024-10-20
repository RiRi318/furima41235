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
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :items_user
- has_many :orders_user

### items テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| text               | string | null: false, unique: true |
| category           | string | null: false |
| price              | string | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders_user

### orders テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| address            | string | null: false, unique: true |
| user               | references | null: false, foreign_key: true |

- belongs_to :items_user