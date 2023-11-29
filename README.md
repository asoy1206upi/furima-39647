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
| origin_region_id   | integer     | null: false     |
| days_to_ship_id    | integer     | null: false     |
| user            | references    | null: false,foreign_key: true| 

### Association

has_one :order
belong_to :user

## Orders テーブル

| Column     | Type       | Constraints |
| -------    | ---------- | ----------- |
| user       | references | null: false,foreign_key: true |
| item       | references | null: false,foreign_key: true |

### Association

belongs_to :users
belongs_to :items
has_one :address


## Addresses テーブル

| Column        | Type        | Constraints |
| ------        | ----------  | ----------- |
| area_id       | integer     | null: false |
| origin_region_id | integer     | null: false |
| city          | string      | null: false |
| quantity      | string      | null: false |
| total_topic   | string      | null: false |
| purchase_date | string      | null: false |
| order          | references | null: false,foreign_key: true | 

### Association

-belongs_to :order

