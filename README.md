## usersテーブル
| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |
| birthday           | date   | null: false                |


### Association
- has_many :furimas
- has_many :purchases 

## furimasテーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| price              | integer    | null: false       |
| info               | text       | null: false       |
| category_id        | integer    | null: false       |
| item_status_id     | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| shipping_date_id   | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| user               | references | foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase 

## purchasesテーブル
| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| furima     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :furima
- has_one    :customer

## customersテーブル
| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building       | string     |                   |
| phone_number   | string     | null: false       |
| purchase       | references | foreign_key: true |

### Association
- belongs_to :purchase
