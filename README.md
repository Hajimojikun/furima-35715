## テーブル設計

## users テーブル

| Column          | Type       | Options                   |
| --------------- | ---------- | ------------------------- |
| email           | string     | null: false, unique: true |
| password        | string     | null: false               |
| first_name      | string     | null: false               |
| last_name       | string     | null: false               |
| first_name_kana | string     | null: false               |
| last_name_kana  | string     | null: false               |
| birth_day       | string     | null: false               |

### Association 

- has_many :items
- has_many :buy_items

## items  テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | int        | null: false                    |
| category_id     | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| user_id         | preference | null: false, foreign_key: true |

### Association 

- has_one :buy_item
- belongs_to :user

### ActiveHash::Associations
- belongs_to :category
- belongs_to :state 

## buy_items  テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | preference | null: false, foreign_key: true |
| items_id        | preference | null: false, foreign_key: true |
| who_pay_id      | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| due_day_id      | integer    | null: false                    |

### Association 

- has_many : where_to
- belongs_to :user
- belongs_to :item

### ActiveHash::Associations

- belongs_to :who_pay
- belongs_to :prefecture_id
- belongs_to :due_day_id

## where_to  テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | int        | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| option          | string     | null: false                    |
| buy_items_id    | preference | null: false, foreign_key: true |

### Association 

- belongs_to :buy_item