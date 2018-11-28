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


### ADMIN status:  
--> rajout d'une colone admin dans table 'users' (valeur par defaut = false)  
--> A la création d'un nouveau User , le model definit un validate sur présence d'une valeur pour le champs admin.  
--> l'instruction pour changer la valeur admin en 'true':  
```
variable_name = User.methode_pour_cibler_user
variable_name.update(admin: true)
```  
--> Ajouter cette condition dans une view ?  


