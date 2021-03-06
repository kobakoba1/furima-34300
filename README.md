## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | unique: true, null: false |
| encrypted_password  | string  | null: false               |
| nickname            | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| furigana_first_name | string  | null: false               |
| furigana_last_name  | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_records

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
| prefectures_id    | integer    | null: false       |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column        | Type        | Options            |
| ------------- | ----------- | ------------------ |
| user          | references  | foreign_key: true  |
| item          | references  | foreign_key: true  |

### Association

- has_one :shipping-info
- belongs_to :user
- belongs_to :item

## shipping_infos テーブル

| Column           | Type         | Options            |
| ---------------- | ------------ | ------------------ |
| postal_code      | string       | null: false        |
| ship_form_id     | integer      | null: false        |
| city             | string       | null: false        |
| house_number     | string       | null: false        |
| building_name    | string       | null: false        |
| phone_number     | string       | null: false        |
| purchase_record  | references   | foreign_key: true  |

### Association

- belongs_to :purchase_record