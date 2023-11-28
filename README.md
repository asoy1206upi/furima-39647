# テーブル設計

## users テーブル

| Column                 | Type    | Constraints    |
| ----------------       | ------  | -----------    |
| nickname               | string  | null: false    |
| email                  | string  | null: false　　 |
| last_name              | string  | null: false    |
| first_name_            | string  | null: false    |
| last_name_kana         | string  | null: false    |
| last_name_kana         | string  | null: false    |
| date_of_birth          | string  | null: false    |

### Association
- has_many :orders
- has_many :items

## items テーブル

| Column        | Type       | Constraints       |
| ------        | ------     | -----------       |
| name          | string     | null: false       | 
| description   | text       | null: false       | 
| price         | string     | null: false       | 
| user_id       | references | foreign_key: true |
| created_at    | string     | null: false       |
| updated_at    | string     | null: false       |

### Association

belongs_to :user
belongs_to :purchase

## Orders テーブル

| Column     | Type       | Constraints |
| -------    | ---------- | ----------- |
| item　　　　| references | null: false,foreign_key: true |
| user 　    | references | null: false,foreign_key: true |

### Association

- belongs_to :Addresses
- belongs_to :orders

## Addresses テーブル

| Column  　    | Type        | Constraints |
| ------   　   | ----------  | ----------- |
| address_line1 | text        | PRIMARY KEY|
| address_line2 | text        | null: false |
| city          | string      | null: false |
| state         | string      | null: false |
| country       | string      | null: false |
| phone_number  | string      | null: false |
| created_at    | datetime	  |
| updated_at    | datetime	  |  

### Association

- belongs_to :orders

