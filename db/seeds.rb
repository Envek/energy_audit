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

Authority.delete_all
Authority.create([
  {:name => "Управление по физической культуре и спорту"},
  {:name => "Министерство культуры и архивного дела"},
  {:name => "Управление ГЗ и ПБ"},
  {:name => "Министерство социальной защиты населения"},
  {:name => "Министерство здравоохранения"},
  {:name => "Министерство образования и науки"},
  {:name => "Управление записи актов гражданского состояния"},
  {:name => "Дирекция по содержанию и обслуживанию административных зданий"},
  {:name => "Министерства сельского хозяйства Амурской области"},
  {:name => "Амурупрадор"},
  {:name => "ГУ «Аэропорты МВЛ»"},
  {:name => "Управление занятости населения"},
  {:name => "Управление по обеспечению деятельности мировых судей"},
  {:name => "Управление лесного хозяйства"},
  {:name => "ГУ «Фонд имущества Амурской области»"},
  {:name => "Госинспекция по надзору за техсостоянием самоходных машин"},
  {:name => "Министерство природных ресурсов"},
  {:name => "Управление по охране и контролю животного мира"},
  {:name => "Министерство ЖКХ"},
  {:name => "Министерство строительства"}
])

Organisation.delete_all
Organisation.create([
  {:name => "ГУП Амурской области «Коммунальные системы БАМа»"},
  {:name => "ОАО «Облкоммунсервис»"},
  {:name => "ОАО «БуреяГЭСстрой»"},
  {:name => "Дирекция филиала ОАО «РЖД» Трансэнерго. Забайкальская дирекция по энергообеспечению."},
  {:name => "Дирекция филиала ОАО «РЖД» Трансэнерго. Дальневосточная дирекция по энергообеспечению."},
  {:name => "ОАО «Амурские коммунальные системы»"},
  {:name => "Филиал ОАО «ДГК» «Амурская генерация»"},
  {:name => "ОАО «ДРСК»"},
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
