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

## users テーブル（ユーザーのテーブル）

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :buys
- has_one :profile

## profile テーブル（本人情報のテーブル）

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| image     | string     | null: false                    |
| item_text | text       | null: false                    |
| price     | integer    | null: false                    |
| deli_fee  | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## items テーブル（出品情報のテーブル）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| item_text     | text       | null: false                    |
| price         | integer    | null: false                    |
| deli_fee      | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| condition     | string     | null: false                    |
| category      | string     | null: false                    |
| shipping_day  | integer    | null: false                    |
| shipping_area | string     | null: false                    |

### Association

- has_one :buy
- belongs_to :user

## buys テーブル（購入ログのテーブル）

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
https://gyazo.com/49c596f0941aca2c3c9b70e3322c02e9