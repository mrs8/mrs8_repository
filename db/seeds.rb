if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

p1 = Pharmacy.find_or_create_by(adress: "Улица Ленина дом 1",
  number: 1, nearest_metro: "Пионерская")
p2 = Pharmacy.find_or_create_by(adress: "Заветная улица дом 14",
  number: 2, nearest_metro: "Багратионовская")
p3 = Pharmacy.find_or_create_by(adress: "Заводской переулок дом 5",
  number: 3, nearest_metro: "Фили")
p4 = Pharmacy.find_or_create_by(adress: "Дубнинская улица дом 65",
  number: 4, nearest_metro: "Кожуховская")
p5 = Pharmacy.find_or_create_by(adress: "Кожуховская улица  дом 35",
  number: 5, nearest_metro: "Курская")

c1 = Category.find_or_create_by(category_name: "Категория A")
c2 = Category.find_or_create_by(category_name: "Категория B")
c3 = Category.find_or_create_by(category_name: "Категория C")
c4 = Category.find_or_create_by(category_name: "Категория D")
c5 = Category.find_or_create_by(category_name: "Категория X")
c6 = Category.find_or_create_by(category_name: "Категория N")

m1 = Medicine.find_or_create_by(medicine_name: "Амоксициллин",
  dosage: 1, quantity_or_volume: 10, manufacturer: "Биотэк",
  need_recipe: "да",  price: 150, category: c1)
m2 = Medicine.find_or_create_by(medicine_name: "Парацетамол",
  dosage: 2, quantity_or_volume: 15, manufacturer: "КИМА",
  need_recipe: "да",  price: 120, category: c1)
m3 = Medicine.find_or_create_by(medicine_name: "Цефотаксим",
  dosage: 4, quantity_or_volume: 5, manufacturer: "ВИМИН",
  need_recipe: "да",  price: 500, category: c2)
m4 = Medicine.find_or_create_by(medicine_name: "Лоперамид",
  dosage: 3, quantity_or_volume: 7, manufacturer: "Актива",
  need_recipe: "да",  price: 10, category: c3)
m2 = Medicine.find_or_create_by(medicine_name: "Диклофенак",
  dosage: 2, quantity_or_volume: 20, manufacturer: "BOIRON",
  need_recipe: "да",  price: 549, category: c4)
m5 = Medicine.find_or_create_by(medicine_name: "Темазепам",
  dosage: 1, quantity_or_volume: 8, manufacturer: "Бальзам",
  need_recipe: "да",  price: 178, category: c5)
m6 = Medicine.find_or_create_by(medicine_name: "Фенитоин",
  dosage: 4, quantity_or_volume: 15, manufacturer: "Озон",
  need_recipe: "да",  price: 163, category: c4)
m7 = Medicine.find_or_create_by(medicine_name: "Теофиллин",
  dosage: 1, quantity_or_volume: 40, manufacturer: "Органика",
  need_recipe: "да",  price: 1025, category: c3)
m8 = Medicine.find_or_create_by(medicine_name: "Нандролон",
  dosage: 5, quantity_or_volume: 1, manufacturer: "Пептек",
  need_recipe: "да",  price: 5000, category: c6)
  
AvaInfo.find_or_create_by(pharmacy: p1, medicine: m1, quantity: 1012)
AvaInfo.find_or_create_by(pharmacy: p2, medicine: m1, quantity: 115)
AvaInfo.find_or_create_by(pharmacy: p5, medicine: m1, quantity: 105)
AvaInfo.find_or_create_by(pharmacy: p3, medicine: m2, quantity: 1002)
AvaInfo.find_or_create_by(pharmacy: p2, medicine: m2, quantity: 135)
AvaInfo.find_or_create_by(pharmacy: p1, medicine: m2, quantity: 642)
AvaInfo.find_or_create_by(pharmacy: p3, medicine: m3, quantity: 645)
AvaInfo.find_or_create_by(pharmacy: p5, medicine: m3, quantity: 261)
AvaInfo.find_or_create_by(pharmacy: p2, medicine: m4, quantity: 163)
AvaInfo.find_or_create_by(pharmacy: p4, medicine: m4, quantity: 456)
AvaInfo.find_or_create_by(pharmacy: p1, medicine: m5, quantity: 10001)
AvaInfo.find_or_create_by(pharmacy: p2, medicine: m5, quantity: 7771)
AvaInfo.find_or_create_by(pharmacy: p3, medicine: m6, quantity: 1641)
AvaInfo.find_or_create_by(pharmacy: p4, medicine: m6, quantity: 7643)
AvaInfo.find_or_create_by(pharmacy: p5, medicine: m7, quantity: 273)
AvaInfo.find_or_create_by(pharmacy: p1, medicine: m7, quantity: 5798)
AvaInfo.find_or_create_by(pharmacy: p3, medicine: m8, quantity: 1263)
AvaInfo.find_or_create_by(pharmacy: p5, medicine: m8, quantity: 631)
