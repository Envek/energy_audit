# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

District.delete_all
District.create([
  {:name => 'Архаринский район'},
  {:name => 'Белогорский район'},
  {:name => 'Благовещенский район'},
  {:name => 'Бурейский район'},
  {:name => 'Завитинский район'},
  {:name => 'Зейский район'},
  {:name => 'Ивановский район'},
  {:name => 'Константиновский район'},
  {:name => 'Магдагачинский район'},
  {:name => 'Мазановский район'},
  {:name => 'Михайловский район'},
  {:name => 'Октябрьский район'},
  {:name => 'Ромненский район'},
  {:name => 'Свободненский район'},
  {:name => 'Селемджинский район'},
  {:name => 'Серышевский район'},
  {:name => 'Сковородинский район'},
  {:name => 'Тамбовский район'},
  {:name => 'Тындинский район'},
  {:name => 'Шимановский район'},
  {:name => 'г. Благовещенск'},
  {:name => 'г. Белогорск'},
  {:name => 'г. Зея'},
  {:name => 'г. Райчихинск'},
  {:name => 'г. Свободный'},
  {:name => 'г. Тында'},
  {:name => 'г. Шимановск'},
  {:name => 'п.г.т. Углегорск'},
  {:name => 'п.г.т. Прогресс'}
])

Area.delete_all
Area.create([
  {:name => 'По подведомственным учреждениям'},
  {:name => 'В многоквартирных домах (общедомовых приборов учета)'},
  {:name => 'В многоквартирных домах (индивидуальных приборов учета)'}
])

Kind.delete_all
Kind.create([
  {:name => 'Электроэнергия'},
  {:name => 'Тепло'},
  {:name => 'Вода холодная'},
  {:name => 'Вода горячая'},
  {:name => 'Газ'}
])

Resource.delete_all
Resource.create([
  {:name => 'Электроэнергия'},
  {:name => 'Теплоэнергия'},
  {:name => 'Уголь'}
])
