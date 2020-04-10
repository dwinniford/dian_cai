# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cuisine.create(chinese_name: "东北", pinyin_name: "DongBei", english_name: "Northeastern") id 2
# Cuisine.create(chinese_name: "粤菜", pinyin_name: "YueCai", english_name: "Cantonese") 3
# Cuisine.create(chinese_name: "川菜", pinyin_name: "ChuanCai", english_name: "Sichuan") 4
# Cuisine.create(chinese_name: "湘菜", pinyin_name: "XiangCai", english_name: "Hunan") 5
# Cuisine.create(chinese_name: "徽菜", pinyin_name: "HuiCai", english_name: "Anhui") 6
# Cuisine.create(chinese_name: "闽菜", pinyin_name: "MinCai", english_name: "Fujian") 7
# Cuisine.create(chinese_name: "苏菜", pinyin_name: "SuCai", english_name: "Jiangsu") 8
# Cuisine.create(chinese_name: "鲁菜", pinyin_name: "LuCai", english_name: "Shandong") 9
# Cuisine.create(chinese_name: "浙菜", pinyin_name: "ZheCai", english_name: "Zhejiang") 10

# Language.create(name: "english", english_name: "English")
# Language.create(name: "한국어", english_name: "Korean")
# Language.create(name: "日本語", english_name: "Japanese")
# Language.create(name: "deutsche", english_name: "German")
# Language.create(name: "française", english_name: "French")
# Language.create(name: "español", english_name: "Spanish")
# Language.create(name: "русский", english_name: "Russian")


frodo = User.create(name: "Frodo Baggins", email: "frodo@bagend.com", password: "frodo")
# kenji = User.create(name: "J Kenji", email: "jkenji@wursthall.com", password: "kenji")
# marco = User.create(name: "Marco Polo", email: "marco@silkroad.com", password: "marco")
# elrond = User.create(name: "Elrond", email: "elrond@rivendell.com", password: "elrond")
# bill = User.create(name: "Bill Laurance", email: "bill@snarkypuppy.com", password: "bill")
# dumbledore = User.create(name: "Albus Percival Wulfric Brian Dumbledore", email: "brian@hogwarts.com", password: "dumbledore")
# abigail = User.create(name: "Abigail Washburn", email: "abigail@banjo.com", password: "abigail")
# bela = User.create(name: "Bela Fleck", email: "bela@banjo.com", password: "bela")
# nikolai = User.create(name: "Nikolai", email: "nikolai@tattoo.com", password: "tattoo")
# matt = User.create(name: "Matthew Bai", email: "matt@confusing_name.com", password: "matthew")
# cookie = User.create(name: "Cookie Cookson"), email: "cookie@history.com", password: "cookie")
# dianxi = User.create(name: "Dianxi Xiaoge"), email: "dianxi@baoshan.com", password: "dianxi")

sanmei = frodo.restaurants.build(chinese_name: "三妹火锅", pinyin_name: "SanMeiHuoGuo", translated_name: "Three Sisters Hotpot", 
    country: "China", province: "Chongqing", city: "Chongqing", district: "ShaPingBa", street: "13 PingDiShan")
    sanmei.cuisines << Cuisine.find(4)
    sanmei.save
    simple_menu = sanmei.translations.build(title: "Simple Menu", notes: "Choose your spicy adventure.", language_id: 1)
    simple_menu.user = frodo
    simple_menu.save
    
sanshu = frodo.restaurants.build(chinese_name: "三叔火锅", pinyin_name: "SanShuHuoGuo", translated_name: "Three Uncles Hotpot", 
    country: "China", province: "Chongqing", city: "Chongqing", district: "ShaPingBa", street: "14 PingDiShan")
    sanshu.cuisines << Cuisine.find(4)
    sanshu.save
    
