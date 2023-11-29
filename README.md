# テーブル設計

## users テーブル

| Column                 | Type    | Constraints    |
| ----------------       | ------  | -----------    |
| nickname               | string  | null: false    |
| email                  | string  | null: false,unique,true |
| password               | string  | null: false    |
| password_confirmation  | string  | null: false    |
| last_name              | string  | null: false    |
| first_name_            | string  | null: false    |
| last_name_kana         | string  | null: false    |
| last_name_kana         | string  | null: false    |
| date_of_birth          | date    | null: false    |
|              | string  | null: false    |
|              | string  | null: false    |


### Association
- has_many :orders

## items テーブル

| Column        | Type       | Constraints       |
| ------        | ------     | -----------       |
| name          | string     | null: false       | 
| price         | integer    | null: false       | 
| description   | text       | null: false       | 
| category      | string     | null: false       |
| product_condition   | string |null: false      |
| shipping_cost   | string     | null: false     |
| origin_region   | string     | null: false     |
| days_to_ship    | string     | null: false     |
| user            | references    | null: false,foreign_key: true| 

### Association

has_many :orders

## Orders テーブル

| Column     | Type       | Constraints |
| -------    | ---------- | ----------- |
| user       | references | null: false,foreign_key: true |
| item       | references | null: false,foreign_key: true |
| address    | references | null: false,foreign_key: true |
| quantity   | string     | null: false       |
| price      | string     | null: false       |
| created_at | string     | null: false,foreign_key: true      |
| update_at  | string     | null: false,foreign_key: true      |

### Association

belongs_to :users
belongs_to :items
has_one :Address


## Addresses テーブル

| Column        | Type        | Constraints |
| ------        | ----------  | ----------- |
| postal_code   | string      | null: false |
| prefecture    | integer    | null: false |
| city          | string      | null: false |
| state         | string      | null: false |
| building_name | string      |  |
| phone_number  | string      | null: false |
| updated_at    | references | null: false,foreign_key: true | 

### Association

- belongs_to :orders

