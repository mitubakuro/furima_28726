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

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| family_kana | string | null: false |
| first_kana  | string | null: false |
| birthday    | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル（出品情報のテーブル）

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| item_text     | text        | null: false                    |
| price         | integer     | null: false                    |
| deli_fee      | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |
| condition     | integer     | null: false                    |
| category      | integer     | null: false                    |
| shipping_day  | integer     | null: false                    |
| shipping_area | integer     | null: false                    |

### Association

- has_one :order
- belongs_to :user

## addresses テーブル（住所のテーブル）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| build_number  | string     | null: false                    |
| tel           | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル（取引情報のテーブル）

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## ER図のリンク
https://gyazo.com/8d769bdc398747bc5bc998c7ff6180a9