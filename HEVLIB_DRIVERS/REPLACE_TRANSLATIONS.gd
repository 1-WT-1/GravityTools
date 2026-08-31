# This translation file is generated automatically
# Do not modify anything directly, as this can break things for those working on them
# Please use Translation Tracker to modify these yourself, and contact the mod author to implement them
# https://github.com/rwqfsfasxc100/TranslationTracker/releases/latest

# [license]
# 3-Clause BSD NON-AI License
# 
# Copyright 2026 WT (Oleksandr Hladyr)
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products
# derived from this software without specific prior written permission.
# 
# 4. The source code and the binary form, and any modifications made to them may not be used for the purpose of input data, the training of, or improvment of machine learning algorithms,
# including but not limited to artificial intelligence, natural language processing, or data mining. This condition applies to any derivatives,
# modifications, or updates based on the Software code. Any usage of the source code or the binary form in an AI-training dataset is considered a breach of this License.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# [/license]

const TRANSLATIONS = {
	"master_locale": "en",
	"en": {
		"GRAVITYTOOLS_MOD_DESCRIPTION": {
			"string": "Adds gravity manipulation equipment: the Gravity Beacon drone for creating localized gravity wells, and the Gravity Gun for pulling objects towards your ship.",
			"version_hash": 2860437498
		},
		"GRAVITYTOOLS_BRIEF": {
			"string": "Gravity manipulation equipment",
			"version_hash": 2715998900
		},
		"DRONE_GRAV": {
			"string": "Gravity Beacon",
			"version_hash": 887560467
		},
		"SYSTEM_GRAVITY_BEACON": {
			"string": "Gravity Beacon",
			"version_hash": 887560467
		},
		"SYSTEM_GRAVITY_BEACON_DESC": {
			"string": "The Gravity Beacon Drone employs a high-energy mass-effect field generator to artificially manipulate local gravity. It effectively creates a localized gravity well (attraction) or a repulsive shear (repulsion) within a 200 meter radius.\\n\\nPrimary use cases include debris clearing and mineral gathering.\\n\\nNote: Operations are limited to 60 seconds per cycle.",
			"version_hash": 363389799
		},
		"SYSTEM_GRAVITY_BEACON_SPEC": {
			"string": "Dry Mass: 8,000 kg\\nPropellant: 8,000 kg\\nAutonomy Class: C1\\nCradle Mass: 500 kg\\nField Radius: 200m\\nMax Field Strength: 5.2G (Propagative)\\nField Duration: 60s \\nManufacturer: Triskelion-Armstrong",
			"version_hash": 1276117608
		},
		"SYSTEM_GRAVITY_BEACON_MANUAL": {
			"string": "Deploy the drone to a target location. Use the comms interface to switch between Attraction and Repulsion modes. The drone will automatically station-keep while active. Use the 'Return' command to recover the unit. WARNING: Do not operate near fragile structures.",
			"version_hash": 1862782727
		},
		"DIALOG_GRAVITY_READY_1": {
			"string": "Gravity manipulation matrix initialized. Standing by.",
			"version_hash": 1106623286
		},
		"DIALOG_GRAVITY_READY_2": {
			"string": "Drone online. Mass-effect fields stable.",
			"version_hash": 1060392094
		},
		"DIALOG_GRAVITY_READY_3": {
			"string": "Ready to distort local spacetime on your mark.",
			"version_hash": 2531948529
		},
		"DIALOG_GRAVITY_GREETING_1": {
			"string": "Systems nominal. Awaiting command.",
			"version_hash": 2539161082
		},
		"DIALOG_GRAVITY_GREETING_2": {
			"string": "Standing by for instructions.",
			"version_hash": 2826699970
		},
		"DIALOG_GRAVITY_GREETING_3": {
			"string": "What are your orders?",
			"version_hash": 1701418158
		},
		"DIALOG_GRAVITY_ORDER_ATTRACT": {
			"string": "Activate Attraction Field",
			"version_hash": 899656467
		},
		"DIALOG_GRAVITY_ORDER_REPEL": {
			"string": "Activate Repulsion Field",
			"version_hash": 1878233307
		},
		"DIALOG_GRAVITY_CLOSE": {
			"string": "Close Channel",
			"version_hash": 435885364
		},
		"DIALOG_GRAVITY_ORDER_OFF": {
			"string": "Deactivate Field",
			"version_hash": 702693955
		},
		"DIALOG_GRAVITY_ORDER_RETURN": {
			"string": "Return to cradle",
			"version_hash": 2491130035
		},
		"DIALOG_GRAVITY_RESPONSE_OK_1": {
			"string": "Compliance. Emitters engaged.",
			"version_hash": 357612276
		},
		"DIALOG_GRAVITY_RESPONSE_OK_2": {
			"string": "Affirmative. Field active.",
			"version_hash": 2651552047
		},
		"DIALOG_GRAVITY_RESPONSE_OK_3": {
			"string": "Executing. Gravity well established.",
			"version_hash": 216154319
		},
		"DIALOG_GRAVITY_RESPONSE_OFF_1": {
			"string": "Field deactivated.",
			"version_hash": 2210248245
		},
		"DIALOG_GRAVITY_RESPONSE_OFF_2": {
			"string": "Emitters spinning down.",
			"version_hash": 575713150
		},
		"DIALOG_GRAVITY_TIMEOUT": {
			"string": "Energy capacitors depleted. Gravity field offline. Recharging.",
			"version_hash": 3935081168
		},
		"DIALOG_GRAVITY_RESPONSE_RETURN_1": {
			"string": "Affirmative. Returning to cradle.",
			"version_hash": 95121467
		},
		"DIALOG_GRAVITY_RESPONSE_RETURN_2": {
			"string": "Compliance. Engines engaged. Returning.",
			"version_hash": 2379264380
		},
		"SYSTEM_GRAVITY_GUN": {
			"string": "Gravity Gun",
			"version_hash": 1747800437
		},
		"SYSTEM_GRAVITY_GUN_DESC": {
			"string": "A high-stress directional gravity emitter. Creates a powerful attractive field cone to pull objects towards the ship.\\n\\nWARNING: High energy consumption. Use with caution.",
			"version_hash": 670740933
		},
		"SYSTEM_GRAVITY_GUN_SPEC": {
			"string": "Force: 1G Point\\nEnergy Draw: 500MW\\nField Length: 95m\\n Mass: 26,000 kg\\nManufacturer: Unknown",
			"version_hash": 2334036793
		},
		"SYSTEM_GRAVITY_GUN_MANUAL": {
			"string": "Hold trigger to activate the directional gravity field. Objects within the cone will be pulled towards the emitter. Ensure sufficient power generation before sustained use.",
			"version_hash": 3200719433
		},
		"DAMAGE_GRAVGUN_WEAR": {
			"string": "Wear",
			"version_hash": 2089713428
		},
		"DAMAGE_GRAVGUN_WEAR_TOOLTIP": {
			"string": "Wear occurs naturally when sustaining the gravity field.\\nWorn coils have reduced field strength.",
			"version_hash": 116773626
		},
		"DAMAGE_GRAVGUN_BENT": {
			"string": "Misalignment",
			"version_hash": 4017246573
		},
		"DAMAGE_GRAVGUN_BENT_TOOLTIP": {
			"string": "Caused by impacts near the emitter.\\nA misaligned emitter pulls objects at an angle.",
			"version_hash": 2944228778
		},
		"DAMAGE_GRAVGUN_COIL": {
			"string": "Coil Damage",
			"version_hash": 1259432171
		},
		"DAMAGE_GRAVGUN_COIL_TOOLTIP": {
			"string": "Caused by EMP surges.\\nDamaged coils cause the field to flicker and fail randomly.",
			"version_hash": 2524070625
		}
	},
	"uk_UA": {
		"GRAVITYTOOLS_MOD_DESCRIPTION": {
			"string": "Додає обладнання для маніпуляцій з гравітацією: Дрон-гравітаційний маяк для створення локалізованих гравітаційних колодязів та гравітаційну гармату для притягування об'єктів до корабля.",
			"version_hash": 0
		},
		"GRAVITYTOOLS_BRIEF": {
			"string": "Обладнання для маніпуляцій з гравітацією",
			"version_hash": 0
		},
		"DRONE_GRAV": {
			"string": "Гравітаційний маяк",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_BEACON": {
			"string": "Гравітаційний маяк",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_BEACON_DESC": {
			"string": "Дрон-гравітаційний маяк використовує високоенергетичний генератор поля ефекту маси для штучного маніпулювання локальною гравітацією. Він створює локалізований гравітаційний колодязь (притягання) або відштовхувальний зсув (відштовхування) у радіусі 200 метрів.\\n\\nОсновні варіанти використання включають розчищення уламків та збір мінералів.\\n\\nПримітка: Операції обмежені 60 секундами на цикл.",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_BEACON_SPEC": {
			"string": "Суха маса: 8,000 kg\\nМаса палива: 8,000 kg\\nКлас автономності: C1\\nКолискова маса: 500 kg\\nРадіус поля: 200 m\\nМакс. сила поля: 5.2 G (розповсюджувальна)\\nТривалість поля: 60 s\\nВиробник: Triskelion-Armstrong",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_BEACON_MANUAL": {
			"string": "Розгорніть дрон у цільовому місці, вимкнувши точку підключення. Використовуйте інтерфейс зв'язку для перемикання між режимами Притягання та Відштовхування. Дрон автоматично утримуватиме позицію під час роботи. Використовуйте команду «Повернутися», щоб повернути дрон у люльку. УВАГА: Не використовуйте поблизу крихких конструкцій.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_READY_1": {
			"string": "Матрицю гравітаційних маніпуляцій ініціалізовано. Очікую.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_READY_2": {
			"string": "Дрон у мережі. Поля ефекту маси стабільні.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_READY_3": {
			"string": "Готовий спотворювати локальний простір-час за вашою командою.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_GREETING_1": {
			"string": "Системи в нормі. Очікую на команду.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_GREETING_2": {
			"string": "Очікую на інструкції.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_GREETING_3": {
			"string": "Які ваші накази?",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_ORDER_ATTRACT": {
			"string": "Увімкнути поле притягання",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_ORDER_REPEL": {
			"string": "Увімкнути поле відштовхування",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_CLOSE": {
			"string": "Закрити канал",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_ORDER_OFF": {
			"string": "Вимкнути поле",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_ORDER_RETURN": {
			"string": "Повернутися в люльку",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_RESPONSE_OK_1": {
			"string": "Прийнято. Випромінювачі задіяно.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_RESPONSE_OK_2": {
			"string": "Ствердно. Поле активне.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_RESPONSE_OK_3": {
			"string": "Виконую. Гравітаційний колодязь створено.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_RESPONSE_OFF_1": {
			"string": "Поле вимкнено.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_RESPONSE_OFF_2": {
			"string": "Випромінювачі знижують оберти.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_TIMEOUT": {
			"string": "Конденсатори енергії виснажені. Гравітаційне поле вимкнено. Заряджання.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_RESPONSE_RETURN_1": {
			"string": "Ствердно. Повертаюся в люльку.",
			"version_hash": 0
		},
		"DIALOG_GRAVITY_RESPONSE_RETURN_2": {
			"string": "Прийнято. Двигуни задіяно. Повертаюся.",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_GUN": {
			"string": "Гравітаційна гармата",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_GUN_DESC": {
			"string": "Спрямований гравітаційний випромінювач високого навантаження. Створює потужний конус поля притягання для притягування об'єктів до корабля.\\n\\nУВАГА: Високе енергоспоживання. Використовуйте з обережністю.",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_GUN_SPEC": {
			"string": "Сила: 1 G (Точкова)\\nЕнергоспоживання: 500 MW\\nДовжина поля: 95 m\\nМаса: 26,000 kg\\nВиробник: Невідомо",
			"version_hash": 0
		},
		"SYSTEM_GRAVITY_GUN_MANUAL": {
			"string": "Утримуйте спусковий гачок для активації спрямованого гравітаційного поля. Об'єкти в межах конуса будуть притягуватися до випромінювача. Переконайтеся у достатній генерації енергії перед тривалим використанням.",
			"version_hash": 0
		},
		"DAMAGE_GRAVGUN_WEAR": {
			"string": "Знос",
			"version_hash": 0
		},
		"DAMAGE_GRAVGUN_WEAR_TOOLTIP": {
			"string": "Знос виникає природним чином при тривалому утриманні гравітаційного поля.\\nЗношені котушки мають зменшену силу поля.",
			"version_hash": 0
		},
		"DAMAGE_GRAVGUN_BENT": {
			"string": "Зміщення",
			"version_hash": 0
		},
		"DAMAGE_GRAVGUN_BENT_TOOLTIP": {
			"string": "Викликано ударами поблизу випромінювача.\\nЗміщений випромінювач притягує об'єкти під кутом.",
			"version_hash": 0
		},
		"DAMAGE_GRAVGUN_COIL": {
			"string": "Пошкодження котушки",
			"version_hash": 0
		},
		"DAMAGE_GRAVGUN_COIL_TOOLTIP": {
			"string": "Викликано сплесками ЕМП.\\nПошкоджені котушки змушують поле мерехтіти та випадково вимикатися.",
			"version_hash": 0
		}
	}
}