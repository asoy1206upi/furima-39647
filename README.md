# テーブル設計

## users テーブル

| Column                 | Type    | Constraints    |
| ----------------       | ------  | -----------    |
| nickname               | string  | null: false    |
| email                  | string  | null: false,unique,true |
| encrypted_password     | string  | null: false    |
| last_name              | string  | null: false    |
| first_name_            | string  | null: false    |
| last_name_kana         | string  | null: false    |
| last_name_kana         | string  | null: false    |
| date_of_birth          | date    | null: false    |


### Association
- has_many :orders
  has_many :items

## items テーブル

| Column        | Type       | Constraints       |
| ------        | ------     | -----------       |
| name          | string     | null: false       | 
| price         | integer    | null: false       | 
| description   | text       | null: false       | 
| category_id      | integer     | null: false       |
| product_condition_id   | integer |null: false      |
| shipping_cost_id   | integer     | null: false     |
| prefecture_id      | integer     | null: false     |
| days_to_ship_id    | integer     | null: false     |
| user            | references    | null: false,foreign_key: true| 

### Association

has_one :order
belongs_to :user

## Orders テーブル

| Column     | Type       | Constraints |
| -------    | ---------- | ----------- |
| user       | references | null: false,foreign_key: true |
| item       | references | null: false,foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address


## Addresses テーブル

| Column        | Type        | Constraints |
| ------        | ----------  | ----------- |
| postal_code   | string      | null: false |
| prefecture_id | integer     | null: false |
| city          | string      | null: false |
| address       | string      | null: false |
| building      | string      |  |
| phone_number  | string      | null: false |
| order         | references | null: false,foreign_key: true | 

### Association

-belongs_to :order

