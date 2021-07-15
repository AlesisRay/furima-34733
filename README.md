## usersテーブル
| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| nickname           | string | NOT NULL               |
| email              | string | NOT NULL               |
| encrypted_password | string | NOT NULL               |
| password           | string | NOT NULL, unique: true |
| last_name          | string | NOT NULL               |
| first_name         | string | NOT NULL               |
| last_name_kana     | string | NOT NULL               |
| first_name_kana    | string | NOT NULL               |
| birthday           | date   | NOT NULL               |


### Association
- has_many :furimas
- has_many :comments 

## furimasテーブル
| Column          | Type       | Options       |
| --------------- | ---------- | ------------- |
| title           | string     | NOT NULL      |
| price           | integer    | NOT NULL      |
| text            | text       | NOT NULL      |
| category        | integer    | NOT NULL      |
| item_status     | integer    | NOT NULL      |
| shipping_charges| integer    | NOT NULL      |
| shipping_date   | integer    | NOT NULL      |
| user            | references |               |

### Association
- belongs_to :user
- has_one    :purchase 

## purchasesテーブル
| Column     | Type       | Options  |
| ---------- | ---------- | -------- |
| user       | references |          |
| furima     | references |          |

### Association
- belongs_to :user
- belongs_to :furima
- has_one    :customer

## customersテーブル
| Column         | Type       | Options  |
| -------------- | ---------- | -------- |
| postal_code    | integer    | NOT NULL |
| prefectures    | string     | NOT NULL |
| municipalities | string     | NOT NULL |
| address        | string     | NOT NULL |
| building       | string     |          |
| phone_number   | integer    | NOT NULL |
| purchase       | references |          |

### Association
- belongs_to :purchase