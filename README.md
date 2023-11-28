# テーブル設計

## users テーブル

| Column             | Type    | Constraints      |
| ------------------ | ------  | -----------      |
| id                 | integer | PRIMARY KEY      |
| email              | string  | NOT NULL, UNIQUE |
| encrypted_password | string  | NOT NULL         |
| name               | string  | NOT NULL         |
| profile            | text    | NOT NULL         |
| occupation         | text    | NOT NULL         |
| position           | text    | NOT NULL         |

### Association
- has_many :purchases
- has_many :items

## items テーブル

| Column      | Type       | Constraints |
| ------      | ------     | ----------- |
| id          | integer    | PRIMARY KEY | 
| name        | string     | NOT NULL 　　| 
| description | text       | NOT NULL 　　| 
| price       | integer    | NOT NULL 　　|
| user_id     | string     | NOT NULL　　 |

### Association

belongs_to :user
belongs_to :purchase

## purchases テーブル

| Column     | Type       | Constraints |
| ------     | ---------- | ----------- |
| id         | integer    | PRIMARY KEY　|
| item_id    | text       | NOT NULL　　 |
| user_id    | text       | NOT NULL　　 |

### Association

- belongs_to :user
- belongs_to :item