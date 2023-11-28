# テーブル設計

## users テーブル

| Column                 | Type    | Constraints    |
| ----------------       | ------  | -----------    |
| nickname               | string  | null: false    |
| email                  | string  | null: false　　 |
| password               | string  | null: false    |
| encrypted_password     | string  | null: false    |
| full_name              | string  | null: false    |
| kana_name              | string  | null: false    |
| date_of_birth          | string  | null: false    |

### Association
- has_many :orders
- has_many :items

## items テーブル

| Column        | Type       | Constraints       |
| ------        | ------     | -----------       |
| name          | integer    | PRIMARY KEY       | 
| description   | string     | null: false       | 
| price         | text       | null: false       | 
| user_id       | references | foreign_key: true |
| created_at    | string     | null: false       |
| updated_at    | string     | null: false       |

### Association

belongs_to :user
belongs_to :purchase

## Orders テーブル

| Column     | Type       | Constraints |
| ------     | ---------- | ----------- |
| id         | integer    | PRIMARY KEY　|
| item_id    | references | null: false,foreign_key: true |
| user_id    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## Addresses テーブル

| Column  　   | Type       | Constraints |
| ------   　  | ---------- | ----------- |
| 　　　　　　　　| integer    | PRIMARY KEY|
| 　　　　　　　　| references | null: false |
|　　　　　　　　　 | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

