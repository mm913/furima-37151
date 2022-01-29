
## usersテーブル

|Column                         |Type    |Options                   |
|-------------------------------|--------|--------------------------|
|family_name                    |string  |null: false               |
|last_name                      |string  |null: false               |
|family_name_kana               |string  |null: false               |
|last_name_kana                 |string  |null: false               |
|email                          |string  |null: false, unique: true |
|encrypted_password             |string  |null: false               |
|nickname                       |string  |null: false               |
|birthday                       |data    |null: false               |

### Association
- has_many :items
- has_many :shoppings



## itemsテーブル

|Column             |Type        |Options                        |
|-------------------|------------|-------------------------------|
|item_name          |string      |null: false,40文字まで          |
|text               |text        |null: false ,1000文字まで       |
|category_id        |integer     |null: false ,ActiveHash        |
|condition_id       |integer     |null: false ,ActiveHash        |
|delivery_charge_id |integer     |null: false ,ActiveHash        |
|delivery_from_id   |integer     |null: false ,ActiveHash        |
|delivery_days_id   |integer     |null: false ,ActiveHash        |
|price              |integer     |null: false                    |
|user               |references  |null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :shopping




## shoppingsテーブル

|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
|user          |references |null: false, foreign_key: true  | 
|item          |references |null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery




## deliveriesテーブル

|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
|post_code     |string     |null: false                     |
|address_1     |string     |null: false                     |
|address_2     |string     |null: false                     |
|address_3     |string     |null: false                     |
|building      |string     |                                |
|tel           |string     |null: false                     |
|shopping      |references |null: false, foreign_key: true  |

### Association
- belongs_to :shopping