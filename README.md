## users テーブル

| Column   | Type    | Options      |
| -------- | ------- | ------------ |
| email    | string  | unique: true |
| password | string  | null: false  |
| nickname | string  | null: false  |
| name     | string  | null: false  |
| birthday | string  | null: false  |

### Association

- has_many :items
- has_many :purchase-records

## items テーブル

| Column         | Type      | Options           |
| -------------- | --------- | ----------------- |
| price          | string    | null: false       |
| user           | reference | foreign_key: true |
| title          | string    | null: false       |
| concept        | text      | null: false       |
| category       | string    | null: false       |
| item_condition | text      | null: false       |
| delivery_fee   | string    | null: false       |
| ship_form      | string    | null: false       |
| until_ship_day | text      | null: false       |

### Association

- belongs_to :users
- has_one :shipping-info

## purchase-records テーブル

| Column        | Type       | Options            |
| ------------- | ---------- | ------------------ |
| user          | reference  | foreign_key: true  |
| item          | reference  | foreign_key: true  |

### Association

- has_one :shipping-info
- belongs_to :users

## shipping-info テーブル

| Column           | Type        | Options            |
| ---------------- | ----------- | ------------------ |
| credit_card_info | string      | null: false        |
| postal_code      | string      | null: false        |
| prefectures      | string      | null: false        |
| municipalities   | string      | null: false        |
| address          | string      | null: false        |
| phone_number     | string      | null: false        |
| user             | reference   | foreign_key: true  |
| item             | reference   | foreign_key: true  |

### Association

- belongs_to :purchase-records
- belongs_to :items