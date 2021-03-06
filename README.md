
## usersテーブル

|Column                         |Type    |Options                   |
|-------------------------------|--------|--------------------------|
|family_name                    |string  |null: false               |
|first_name                     |string  |null: false               |
|family_name_kana               |string  |null: false               |
|first_name_kana                |string  |null: false               |
|email                          |string  |null: false, unique: true |
|encrypted_password             |string  |null: false               |
|nickname                       |string  |null: false               |
|birthday                       |date    |null: false               |

### Association
- has_many :items
- has_many :order



## itemsテーブル

|Column             |Type        |Options                        |
|-------------------|------------|-------------------------------|
|item_name          |string      |null: false                    |memo: 40文字まで
|detail             |text        |null: false                    |memo: 1000文字で
|category_id        |integer     |null: false                    |memo: ActiveHash
|condition_id       |integer     |null: false                    |memo: ActiveHash
|delivery_charge_id |integer     |null: false                    |memo: ActiveHash
|address_id         |integer     |null: false                    |memo: ActiveHash
|delivery_days_id   |integer     |null: false                    |memo: ActiveHash
|price              |integer     |null: false                    |
|user               |references  |null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_one :order




## ordersテーブル

|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
|user          |references |null: false, foreign_key: true  | 
|item          |references |null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery




## deliveriesテーブル

|Column         |Type       |Options                         |
|---------------|-----------|--------------------------------|
|post_code      |string     |null: false                     |
|address_id     |integer    |null: false                     |memo: ActiveHash
|municipalities |string     |null: false                     |
|house_number   |string     |null: false                     |
|building       |string     |                                |
|tel            |string     |null: false                     |
|order          |references |null: false, foreign_key: true  |

### Association
- belongs_to :order

