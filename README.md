
## usersテーブル

|Column             |Type    |Options     |
|-------------------|--------|------------|
|name               |string  |null: false |
|email              |string  |null: false |
|encrypted_password |string  |null: false |
|nickname           |string  |null: false |
|birthday           |integer |null: false |

### Association
- has_many :items
- has_many :shoppings



## itemsテーブル

|Column            |Type       |Options                         |
|------------------|-----------|--------------------------------|
|item_name         |string     |null: false,40文字まで           |
|text              |text       |null: false ,1000文字まで        |
|category          |string     |null: false                     |
|delivery_charge   |string     |null: false                     |
|delivery_from     |string     |null: false                     |
|delivery_days     |string     |null: false                     |
|price             |integer    |null: false                     |
|user_id           |references |null: false, foreign_key: true  | 
|shopping_id       |references |null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :shopping




## shoppingsテーブル

|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
|user_id       |references |null: false, foreign_key: true  | 
|item_id       |references |null: false, foreign_key: true  |
|delivery_id   |references |null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :item
- has_one :delivery




## deliveryテーブル

|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
|post_code     |integer    |null: false                     |
|address_1     |string     |null: false                     |
|address_2     |string     |null: false                     |
|address_3     |string     |null: false                     |
|building      |string     |                                |
|tel           |integer    |null: false                     |
|shopping_id   |references |null: false, foreign_key: true  |

### Association
- has_one :shopping