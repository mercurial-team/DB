DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  login VARCHAR(255) unique COMMENT 'Логин пользователя',
  password_hash varchar(255) COMMENT 'Хэш пароля пользователя',
  first_name VARCHAR(255) COMMENT 'Имя пользователя',
  last_name VARCHAR(255) COMMENT 'Фамилия пользователя',
  email varchar(120) unique COMMENT 'Почта',
  phone BIGINT unique COMMENT 'Телефон',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Все пользователи сайта';

insert into users values
(default,  'EL CUCUY', 'Ghi13hrLOGJoiwqe', 'Тони', 'Фергюсон', 'myEmail@ufc.com', '79992221133', '1975-12-31', default, default),
(default,  'THE DIAMOND', 'Ghi13hrLOGJoiwqe', 'Дастин', 'Порье', 'myEmail_1@ufc.com', '79992221134', '1975-12-31', default, default),
(default,  'THE NOTORIOUS', 'Ghi13hrLOGJoiwqe', 'Конор', 'Макгрегор', 'myEmail_2@ufc.com', '79992221135', '1975-12-31', default, default),
(default,  'THE HIGHLIGHT', 'Ghi13hrLOGJoiwqe', 'Джастин', 'Гэтжи', 'myEmail_3@ufc.com', '79992221136', '1975-12-31', default, default),
(default,  'THE HANGMAN', 'Ghi13hrLOGJoiwqe', 'Дэн', 'Хукер', 'myEmail_4@ufc.com', '79992221137', '1975-12-31', default, default),
(default,  'COWBOY', 'Ghi13hrLOGJoiwqe', 'Дональд', 'Серроне', 'myEmail_5@ufc.com', '79992221138', '1975-12-31', default, default),
(default,  'THE IRISH DRAGON', 'Ghi13hrLOGJoiwqe', 'Пол', 'Фельдер', 'myEmail_6@ufc.com', '79992221139', '1975-12-31', default, default),
(default,  'DO BRONX', 'Ghi13hrLOGJoiwqe', 'Чарьз', 'Оливейра', 'myEmail_7@ufc.com', '79992221140', '1975-12-31', default, default),
(default,  'RAGING', 'Ghi13hrLOGJoiwqe', 'Эл', 'Яквинта', 'myEmail_8@ufc.com', '79992221141', '1975-12-31', default, default),
(default,  'THE MOTOWN PHENOM', 'Ghi13hrLOGJoiwqe', 'Кевин', 'Ли', 'myEmail_9@ufc.com', '79992221142', '1975-12-31', default, default),
(default,  'I am the law', 'Ghi13hrLOGJoiwqe', 'Маркос', 'Росалес', 'myEmail_10@ufc.com', '79992221143', '1975-12-31', default, default);

DROP TABLE IF EXISTS divisions;
CREATE TABLE  divisions (
	id SERIAL PRIMARY KEY,
	code_name varchar(120) COMMENT 'Кодовое название дивизиона',
	name varchar(120) COMMENT 'Название дивизиона',
	min_weight int COMMENT 'Минимальный вес',
	max_weight int COMMENT 'Максимальный вес'
) COMMENT = 'Весовые категории';

															
INSERT INTO divisions values
(default, 'Heavyweight', 'Тяжёлый вес', 93, 120),
(default, 'Light heavyweight', 'Полутяжёлый вес', 84, 93),
(default, 'Middleweight', 'Средний вес', 77, 84),
(default, 'Welterweight', 'Полусредний вес', 70, 77),
(default, 'Lightweight', 'Лёгкий вес', 66, 70),
(default, 'Featherweight', 'Полулёгкий вес', 61, 66),
(default, 'Bantamweight', 'Легчайший вес', 57, 61),
(default, 'Flyweight', 'Наилегчайший вес', 53, 57);

DROP TABLE IF EXISTS fighters;
CREATE TABLE  fighters (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1) COMMENT 'Пол',
    division_id BIGINT UNSIGNED COMMENT 'Ссылка на весовую категорию',
    weight DECIMAL (3,1) COMMENT 'Вес 00.0 м',
    height DECIMAL (3,2) COMMENT 'Рост 0.00 м',
    arm_span DECIMAL (4,1) COMMENT 'Размах рук 000.0 см',
    win int COMMENT 'Победы',
    defeat int COMMENT 'Поражения',
    draw int COMMENT 'Ничья',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (division_id) REFERENCES divisions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Профили бойцов';

insert into fighters values
(1, 'М', 5, 69, 1.80, 190.0, 26, 3, 0, default, default),
(2, 'М', 5, 69, 1.80, 190.0, 25, 6, 0, default, default),
(3, 'М', 5, 69, 1.80, 190.0, 22, 4, 0, default, default),
(4, 'М', 5, 69, 1.80, 190.0, 21, 2, 0, default, default),
(5, 'М', 5, 69, 1.80, 190.0, 21, 8, 0, default, default),
(6, 'М', 5, 69, 1.80, 190.0, 36, 14, 0, default, default),
(7, 'М', 5, 69, 1.80, 190.0, 17, 5, 0, default, default),
(8, 'М', 5, 69, 1.80, 190.0, 29, 8, 0, default, default),
(9, 'М', 5, 69, 1.80, 190.0, 14, 6, 1, default, default),
(10, 'М', 5, 69, 1.80, 190.0, 18, 6, 0, default, default);

DROP TABLE IF EXISTS referes;
CREATE TABLE  referes (
	user_id SERIAL PRIMARY KEY,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Профили судей';

insert into referes values
(11, default, default);

DROP TABLE IF EXISTS tournaments;
CREATE TABLE tournaments(
	id SERIAL PRIMARY KEY,
	name varchar(255) COMMENT 'Название турнира',
	place varchar(255) COMMENT 'Место проведения',
	`date` varchar(255) COMMENT 'Дата проведения',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Турниры чемпионата';

insert into tournaments values
(default, 'UFC-400', 'Денвер', '2017-12-31', default, default),
(default, 'UFC-401', 'Нью-Йорк', '2018-12-31', default, default), 
(default, 'UFC-402', 'Лас-Вегас', '2019-12-31', default, default), 
(default, 'UFC-403', 'Москва', '2020-12-31', default, default), 
(default, 'UFC-404', 'Париж', '2021-12-31', default, default); 

drop table fight_statuses;
CREATE TABLE fight_statuses(
	id SERIAL PRIMARY KEY,
	name varchar(255)
) COMMENT = 'Результат боя';

insert into fight_statuses values
(default, 'Нокаут'),
(default, 'Технический нокаут'),
(default, 'Сабмишен'),
(default, 'Победа единогласным решением'),
(default, 'Победа раздельным решением'),
(default, 'Победа большинством голосов'),
(default, 'Ничья'),
(default, 'Бой не проводился');


DROP TABLE IF EXISTS matches;
CREATE TABLE matches(
	id SERIAL PRIMARY KEY,
	tournament bigint unsigned not null COMMENT 'Турнир',
	challenger_1 bigint unsigned not null COMMENT 'Претендент 1',
	challenger_2 bigint unsigned not null COMMENT 'Претендент 2',
	referee bigint unsigned not null COMMENT 'Рефери',
	winner bigint unsigned COMMENT 'Победитель',
	status bigint unsigned COMMENT 'Результат боя',
	title_fight TINYINT(1)  COMMENT 'Титульный ли бой',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (challenger_1) REFERENCES fighters(user_id),
	FOREIGN KEY (challenger_1) REFERENCES fighters(user_id),
	FOREIGN KEY (status) REFERENCES fight_statuses(id),
	FOREIGN KEY (tournament) REFERENCES tournaments(id)
) COMMENT = 'Поединки турнира';

insert into matches values
(default, 1, 1, 2, 1, 1, 1, 1, default, default),
(default, 1, 3, 4, 1, 4, 3, 0, default, default),
(default, 1, 5, 6, 1, 5, 6, 0, default, default),
/**/
(default, 2, 7, 8, 1, 7, 1, 0, default, default),
(default, 2, 9, 10, 1, 10, 3, 0, default, default),
(default, 2, 6, 2, 1, 2, 6, 0, default, default),
/**/
(default, 3, 1, 5, 1, 1, 1, 1, default, default),
(default, 3, 6, 10, 1, 6, 3, 0, default, default),
(default, 3, 8, 3, 1, null, 7, 0, default, default),
/**/
(default, 4, 2, 3, 1, null, 8, 0, default, default),
(default, 4, 5, 10, 1, null, 8, 0, default, default),
(default, 4, 8, 4, 1, null, 8, 0, default, default),
/**/
(default, 5, 1, 3, 1, null, 8, 1, default, default),
(default, 5, 4, 9, 1, null, 8, 0, default, default),
(default, 5, 5, 2, 1, null, 8, 0, default, default);

drop table champions;
CREATE TABLE champions(
	id SERIAL PRIMARY KEY,
	fighter_id bigint unsigned not null COMMENT 'Ссылка на бойца',
	division_id bigint unsigned not null COMMENT 'Дивизион чемпиона',
	date_start date not null COMMENT 'Дата начала',
	date_end date COMMENT 'Дата окончания',
	FOREIGN KEY (fighter_id) REFERENCES fighters(user_id),
	FOREIGN KEY (division_id) REFERENCES divisions(id)
) COMMENT = 'Чемпионы';

drop table media;
CREATE TABLE media(
	id SERIAL PRIMARY KEY,
	media_type enum('photo', 'video') COMMENT 'Тип медиафайла',
	link varchar(255),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Записи и фото с турниров';

insert into media values
(default, 'photo', 'http://example.ru/image.jpg', default, default),
(default, 'photo', 'http://example.ru/image_1.jpg', default, default),
(default, 'photo', 'http://example.ru/image_2.jpg', default, default),
(default, 'photo', 'http://example.ru/image_3.jpg', default, default),
(default, 'video', 'http://example.ru/video_1.jpg', default, default),
(default, 'video', 'http://example.ru/video_2.jpg', default, default),
(default, 'video', 'http://example.ru/video_3.jpg', default, default);

drop table tournaments_media;
CREATE TABLE tournaments_media(
	id SERIAL PRIMARY KEY,
	tournament_id bigint unsigned,
	media_id bigint unsigned,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
) COMMENT = 'Записи и фото с турниров, промежуточная таблица';

insert into tournaments_media values
(default, 1, 1, default, default),
(default, 1, 5, default, default),
(default, 2, 2, default, default),
(default, 2, 3, default, default),
(default, 2, 6, default, default),
(default, 3, 4, default, default),
(default, 3, 7, default, default);



