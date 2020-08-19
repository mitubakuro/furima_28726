<!-- # README

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

* ... -->

# フリマアプリのテーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :settles

## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| image     | string     | null: false                    |
| item_text | text       | null: false                    |
| price     | integer    | null: false                    |
| deli_fee  | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- has_one :settle
- belongs_to :user

## settles テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| tel         | integar    | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| buyuser_id  | ingtegar   | null: false                    |

### Association

- belongs_to :item
- belongs_to :user

## ER図のリンク
https://gyazo.com/60ff7d3795512be5deb0338b3fde4334