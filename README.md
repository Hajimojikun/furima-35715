## テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ---------------    | ---------- | ------------------------- |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| nickname           | string     | null: false               |
| first_name         | string     | null: false               |
| last_name          | string     | null: false               |
| first_name_kana    | string     | null: false               |
| last_name_kana     | string     | null: false               |
| birth_day          | date       | null: false               |

### Association 

- has_many :items
- has_many :buy_items

## items  テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| who_pay_id      | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| due_day_id      | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association 

- has_one :buy_item
- belongs_to :user

### ActiveHash::Associations
- belongs_to :category
- belongs_to :state 
- belongs_to :who_pay
- belongs_to :prefecture
- belongs_to :due_day


## buy_items  テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association 

- has_one    : where_to
- belongs_to :user
- belongs_to :item


## where_to  テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| city                  | string     | null: false                    |
| street                | string     | null: false                    |
| name_of_the_building  | string     |                                |
| phone_number          | string     | null: false                    |
| buy_item              | references | null: false, foreign_key: true |

### Association 

- belongs_to :buy_item

### ActiveHash::Associations

- belongs_to :prefecture