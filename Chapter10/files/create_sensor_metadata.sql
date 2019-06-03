create database sensor_metadata;

use sensor_metadata;

create table sensor_type(sensor_type_id int, sensor_type varchar(30));

create table location(location_id int, customer varchar(100), department varchar(100), building_name varchar(100), room varchar(100), floor varchar(100), location_on_floor varchar(100), latitude double, longitude double); 

create table sensors(sensor_id int primary key, sensor_type_id int, location_id int);


insert into sensor_type values(1, 'Temperature');
insert into sensor_type values(2, 'Humidity');

insert into location values(1, 'Abc Labs', 'R & D', '222 Broadway', '101' , 'Floor 1', 'C-101', 40.710936, -74.008500);
insert into location values(2, 'Abc Labs', 'Operations', 'One World Trade Center', '201' , 'Floor 2', 'O-201', 40.712515, -74.015386);

insert into location values(3, 'Abc Labs', 'Operations', '1 Newark St.', '101', 'Floor 1', 'O-382', 40.736370, -74.028755);
insert into location values(4, 'Abc Labs', 'Operations', '15 Exchange Pl.', '201', 'Floor 2', 'O-293', 40.715856, -74.033391);


insert into sensors values(1, 1, 1);
insert into sensors values(2, 1, 2);
insert into sensors values(3, 1, 3);
insert into sensors values(4, 1, 4);
insert into sensors values(5, 2, 1);
insert into sensors values(6, 2, 2);
insert into sensors values(7, 2, 3);
insert into sensors values(8, 2, 4);
