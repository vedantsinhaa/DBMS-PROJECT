create database gamezone;
use gamezone;

create table gzone(
game_id int not null primary key
);

INSERT INTO gzone
VALUES (1),
(3),
(5),
(7),
(9);

select * from gzone;
describe gzone;

create table users(
user_id int not null primary key,
hours_played int,
user_name varchar(30),
no_of_games_owned int,
game_id int not null,
foreign key(game_id) references gzone(game_id)
);

INSERT INTO users
VALUES (121, 34, "Gunhawk", 6, 1),
(122, 28, "Monkeyking", 4, 3),
(123, 59, "Lizzosflute", 10, 5),
(124, 10, "abcdef", 1, 7),
(125, 48, "Kraken", 8, 9);

select * from users;
describe users;

create table workshop(
user_id int,
workshop_topic_name varchar(100),
dates date,
foreign key(user_id) references users(user_id),
CONSTRAINT PK_workshop PRIMARY KEY (user_id, workshop_topic_name)
);

INSERT INTO workshop
VALUES (121, "Valorant", '2022-09-24'),
(122, "Minecraft", '2022-10-24'),
(123, "GTA5", '2022-08-12'),
(124, "PubG", '2022-09-22'),
(125, "AmongUs", '2022-06-03');

select * from workshop;
describe workshop;

create table games(
game_name varchar(50) not null primary key,
size int,
release_date date,
price int,
game_id int ,
foreign key(game_id) references gzone(game_id)
);

INSERT INTO games
VALUES ("Valorant", 18, '2020-06-02', 0, 1),
("Minecraft", 0.8972, '2011-11-18', 1999, 3),
("GTA5", 37, '2013-09-17', 1599, 5),
("PubG", 40, '2017-03-23', 1149, 7),
("AmongUs", 0.25, '2018-06-15', 400, 9);

select * from games;
describe games;

create table training(
game_name varchar(50) ,
no_of_users int,
fees int,
CONSTRAINT PK_training PRIMARY KEY (game_name , no_of_users),
foreign key(game_name) references games(game_name)
);

INSERT INTO training
VALUES ("Valorant", 220000, 100),
("Minecraft", 1310000, 500),
("GTA5", 710000, 200),
("PubG", 2010000, 700),
("AmongUs", 500000, 300);

select * from training;
describe training;

create table winner(
tournament_name varchar(50) not null primary key,
team_name varchar(50),
prize int,
country varchar(20)
);


INSERT INTO winner
VALUES ("2022/23 Le Mans Virtual Series", "Fnatic", 250000, "Bahrain"),
("The 19th Asian Games Hangzhou 2022", "Team Dignitas", 100000, "China"),
("League of Legends Worlds Championships 2022", "Astralis", 150000, "Mexico"),
("Elite Series League of Legends Pro-Am Finals", "Dire Wolves", 8000, "Belgium"),
("Elisa Masters Espoo 2022", "Cloud9", 200000, "Finland");

select * from winner;
describe winner;

create table championship (
championship_id int not null primary key,
game_name varchar(50) ,
tournament_name varchar(50) ,
foreign key(game_name) references Games(game_name),
foreign key(tournament_name) references Winner(tournament_name)
);

INSERT INTO championship
VALUES (4107, "Valorant", "2022/23 Le Mans Virtual Series"),
(4122, "Minecraft", "The 19th Asian Games Hangzhou 2022"),
(4119, "GTA5", "League of Legends Worlds Championships 2022"),
(4178, "PubG", "Elite Series League of Legends Pro-Am Finals"),
(4200, "AmongUs", "Elisa Masters Espoo 2022");

select * from championship;
describe championship;

create table trending_games (
worldwide_rank int not null,
years int not null,
Country_wise_rank int,
Country varchar(50),
CONSTRAINT PK_trending_games PRIMARY KEY (worldwide_rank,years)
);

INSERT INTO trending_games 
VALUES (1456,2018,12,"INDIA"),
(1233,2019,13,"USA"),
(865,2017,14,"LONDON"),
(567,2016,3,"PAKISTAN"),
(56,2015,8,"UK");

select * from trending_games;
describe trending_games;

create table Discount (
Game_name varchar(50) ,
Starting_date date ,
Ending_date date ,
Price int,
Discounted_price int ,
CONSTRAINT PK_Discount PRIMARY KEY (Game_name,Starting_date,Ending_date),
foreign key(Game_name) references Games(game_name)
);

INSERT INTO  Discount
VALUES("Valorant",'2020-12-03','2020-12-13',6690,5000),
("Minecraft",'2019-11-03','2019-12-14',4990,3000),
("GTA5",'2021-10-03','2021-12-03',8999,6500),
("PubG",'2020-09-03','2020-11-13',9999,8000),
("AmongUs",'2022-01-03','2022-03-13',690,500);

select * from Discount;
describe Discount;


create table Developer(
 Developer_id int not null,
 Developer_name varchar(50),
 Developer_country varchar(50),
 primary  key(Developer_id)
 );
 
INSERT INTO  Developer
VALUES(3133,"JOHN","US"),
(313,"Aman","INDIA"),
(434,"Shikhar","INDIA"),
(1233,"Stokes","UK"),
(673,"Ibrahim","Pakistan");

select * from Developer;
describe Developer;

create table Clan(
Clan_name varchar(50) not null primary key,
 No_of_members int ,
 Game_name varchar(50),
 foreign key(Game_name) references Games(Game_name)
 );
 
 INSERT INTO  Clan
VALUES("IndiaOP",90,"VALORANT"),
("SOUL",45,"PubG"),
("MINERS",15,"MINECRAFT"),
("AmongWe",17,"AmongUs"),
("MEGASTARS",25,"PubG");

 select * from clan;
 describe clan;

create table Hardware(
 Min_RAM varchar(50)  ,
 Game_name varchar(50) ,
 Req_graphics varchar(50) ,
 Req_RAM varchar(50) , 
 Min_graphics varchar(50)  , 
 OS varchar(50) ,
 CONSTRAINT PK_Hardware PRIMARY KEY (Min_RAM, Game_name),
 foreign key(Game_name) references Games(game_name)
 );
 
 INSERT INTO Hardware
VALUES("2GB","VALORANT","RTX","8GB","GTX","LINUX"),
("2GB","AmongUs","RTX","4GB","GTX","MAC"),
("2GB","PubG","RTX","8GB","GTX","LINUX"),
("2GB","MINECRAFT","AMD","8GB","RADON","UBUNTU"),
("2GB","GTA5","RADON","8GB","GTX","LINUX");

select * from Hardware;
describe Hardware;

Create table Software(
Game_name varchar(50) , 
Software_name varchar(50)  ,
Software_size int not null, 
Price int not null,
CONSTRAINT PK_Software PRIMARY KEY (Software_name, Game_name),
foreign key(Game_name) references Games(Game_name)
);

 INSERT INTO Software
VALUES("VALORANT","REAL ENGINE 5",4,5000),
("PubG","TENCENT",4,2000),
("MINECRAFT","GAMELOFT",8,3000),
("GTA5","UNREAL ENGINE 5",8,9000),
("AmongUs","REAL ENGINE 5",4,500);

create table feedback(
	feedback_no int not null primary key,
    rating int not null,
    review varchar(50) not null,
    user_id int,
    foreign key(user_id) references users (user_id)
);


INSERT INTO feedback
VALUES (345, 4, "very good", 121),
(348, 3, "good", 122),
(371, 5, "excellent", 123),
(379, 2, "can be better", 124),
(388, 1, "bad", 125);

select * from feedback;

create table wallet(
	card_no bigint not null,
    bank varchar(50) not null,
    money int not null,
    user_id int,
    foreign key(user_id) references users (user_id)
);

INSERT INTO wallet
VALUES(20071, "sbi", "25000", 121),
(20072, "hdfc", "40000", 122),
(20073, "axis", "5000", 123),
(20074, "bank of baroda", "29000", 124),
(20075, "canara", "13000", 125);

select * from wallet;

create table streaming (
	user_id int ,
    started_time timestamp,
    platform varchar(20) not null,
    date date not null,
    primary key (user_id , started_time),
    foreign key(user_id) references users (user_id)
);

INSERT INTO streaming
VALUES(121, '2020-01-01 10:10:10', "Dacast", '2008-11-11'),
(122, '2019-12-31 23:40:10', "Twitch", '2008-11-09'),
(123, '2020-01-01 13:10:10', "Flowplayer", '2008-10-29'),
(124, '2004-04-30 15:10:10', "Livestream", '2010-07-02'),
(125, '2001-07-03 14:20:10', "Youtube", '2011-09-12');

select * from streaming;

create table customers(
	customer_id int not null,
    customer_name varchar(20) not null,
    phone_no bigint not null,
    game_name varchar(100),
    foreign key(game_name) references games (game_name)
);

INSERT INTO customers
VALUES(61, "Ramesh", "1234567890", "Valorant"),
(62, "Suraj", "7898978805", "Minecraft"),
(63, "Shivam", "7000326789", "GTA5"),
(64, "Tushar", "8126718365", "PubG"),
(65, "Aashish", "9172637281", "AmongUs");

select * from customers;

select * from software;
describe software;

SELECT * FROM users where hours_played > 5;



-- Triggers
delimiter //
Drop trigger if exists discount_price;
create trigger discount_price before insert on Discount
For Each Row
	Begin
		IF NEW.Price > 10000 Then
        SIGNAL SQLSTATE '33455'
        SET MESSAGE_TEXT='Price should be less than 10000';
	END IF;
END//

delimiter //
Drop trigger if exists max_users;
create trigger max_users before insert on training
For Each Row
	Begin
		IF NEW.no_of_users > 1500000 Then
        SIGNAL SQLSTATE '33455'
        SET MESSAGE_TEXT='Max users can be 1500000';
	END IF;
END//

-- Functions
DELIMITER $$
create function UserAverageRating()
returns int
deterministic
begin
declare AvgRating int;
select avg(rating) into AvgRating from feedback;
return AvgRating;
end$$

-- Function Call
select UserAverageRating()"Average Rating of all Users";

-- Procedures
delimiter //
create procedure game_details(in game_id int(30))
begin
select * from games where games.game_id=game_id;
end;//

-- Procedure Call
call game_details('3');
call game_details('7');
