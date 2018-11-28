### Model 'order':  
  L dans model order:  
  *  un order has-one :user 
  *  un order has-many :items 
  L dans model user:  
  *  un user has-many :orders  
  L dans model item:
  *  un produit has_and_belongs_to_many :orders
--> migrate  
  L dans shema:  
  ```
create_table "items_orders", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "item_id", null: false
    t.index ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id"
    t.index ["order_id", "item_id"], name: "index_items_orders_on_order_id_and_item_id"
  end

create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end```  
  
### Action Mailer:  

`ContactMailer.nom_de_la_methode_action(name, email).deliver_now`  
*objectif -->* envoyer un email a chaque nouvelle inscription, mais qu'une fois.
[NB: possible de personnaliser le message =  pas de champs 'name' dans la table 'users']  
Test en console:  
```
truc = User.last
@email = truc.email
ContactMailer.welcome("inconnu", @email).deliver_now
```  
Test envoyé a Javi + lisa.
