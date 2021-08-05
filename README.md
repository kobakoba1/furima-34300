## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | unique: true, null: false |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| name               | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchase-records

## items テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| price             | integer    | null: false       |
| user              | references | foreign_key: true |
| title             | string     | null: false       |
| concept           | text       | null: false       |
| category_id       | integer    | null: false       |
| item_condition_id | integer    | null: false       |
| delivery_fee_id   | integer    | null: false       |
| ship_form_id      | integer    | null: false       |
| until_ship_day_id | integer    | null: false       |

### Association

- belongs_to :users
- has_one :shipping-info

## purchase_records テーブル

| Column        | Type        | Options            |
| ------------- | ----------- | ------------------ |
| user          | references  | foreign_key: true  |
| item          | references  | foreign_key: true  |

### Association

- has_one :shipping-info
- belongs_to :users

## shipping_info テーブル

| Column           | Type         | Options            |
| ---------------- | ------------ | ------------------ |
| postal_code      | string       | null: false        |
| prefectures      | string       | null: false        |
| municipalities   | string       | null: false        |
| address          | string       | null: false        |
| phone_number     | string       | null: false        |
| user             | references   | foreign_key: true  |
| item             | references   | foreign_key: true  |

### Association

- belongs_to :purchase-records
- belongs_to :items