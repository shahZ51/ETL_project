CREATE DATABASE mission_spacex;
     

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

create table if not exists capsule_mission(
	capsule_serial char(4) references capsules(capsule_serial),
	name char(10),
	flight int
);