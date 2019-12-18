CREATE DATABASE mission_spacex;
     
drop table if exists capsules;
create table if not exists capsules(
	capsule_serial char(4) primary key,
	capsule_id varchar(10),
	status varchar(10),
	original_launch TIMESTAMP,
	landings bit,
	type varchar(15),
	details varchar(50),
	reuse_count int
);
drop table if exists capsule_mission;
create table if not exists capsule_mission(
	capsule_mission_id serial primary_key,
	capsule_serial char(4) references capsules(capsule_serial),
	name char(10),
	flight int
);
drop table if exists cores;
create table if not exists cores(
 	core_serial varchar(10) primary key,
	block int,
	status varchar(10),
	original_launch TIMESTAMP,
	reuse_count int,
	rtls_attempts int,
	rtls_landings int,
	asds_attempts int,
	asds_landings int,
	water_landing int
);
drop table if exists cores_mission;
create table if not exists cores_mission(
	cores_mission_id serial primary key
	core_serial  varchar(10) references cores(core_serial),
	name char(10),
	flight int	
);