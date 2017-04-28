rails g scaffold Pharmacy adress:text number:integer nearest_metro:text
rails g scaffold Category category_name:text
rails g scaffold Medicine medicine_name:text dosage:float quantity_or_volume:float manufacturer:text need_recipe:string price:float category:references
rails g scaffold Ava_info pharmacy:references medicine:references quantity:integer

