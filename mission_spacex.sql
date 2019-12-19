CREATE DATABASE mission_spacex;
     
drop table if exists capsules;
create table if not exists capsules(
	capsule_serial char(4) primary key,
	capsule_id varchar(10),
	status varchar(10),
	original_launch date,
	landings bit,
	type varchar(15),
	details varchar(50),
	reuse_count int
);
drop table if exists capsule_mission;
create table if not exists capsule_mission(
	capsule_mission_id serial primary key,
	capsule_serial char(4) references capsules(capsule_serial),
	name char(10),
	flight int
);
drop table if exists cores;
create table if not exists cores(
 	core_serial varchar(10) primary key,
	block int,
	status varchar(10),
	original_launch date,
	reuse_count int,
	rtls_attempts int,
	rtls_landings int,
	asds_attempts int,
	asds_landings int,
	water_landing int
);
drop table if exists cores_mission;
create table if not exists cores_mission(
	cores_mission_id serial primary key,
	core_serial  varchar(10) references cores(core_serial),
	name char(10),
	flight int	
);
drop table if exists dragons;
create table if not exists dragons(
	id varchar(10) primary key,
	name varchar(15),
	type varchar(15),
	active bit,
	crew_capacity int,
	sidewall_angle_deg int,
	orbit_duration_yr int,
	dry_mass_kg int,
	dry_mass_lb int,
	first_flight date,
	wikipedia text,
	description text
);
drop table if exists dragons;
create table if not exists dragons(
	id varchar(10) primary key,
	name varchar(15),
	type varchar(15),
	active bit,
	crew_capacity int,
	sidewall_angle_deg int,
	orbit_duration_yr int,
	dry_mass_kg int,
	dry_mass_lb int,
	first_flight date,
	wikipedia text,
	description text
);
drop table if exists thrusters;
create table if not exists thrusters(
	id serial primary key,
	dragon_id varchar(10) references dragons(id),
	type varchar(10),
	amount float,
	pods int,
	fuel_1 varchar(50),
	fuel_2 varchar(50),
	thurst_kn float,
	thurst_lbf float
);
drop table if exists history;
create table if not exists history(
	id int primary key,
	title varchar(50),
	event_date date,
	flight_number int,
	details text
);
drop table if exists history_link;
create table if not exists history_link(
	id serial primary key,
	history_id int references history(id),
	reddit text,
	article text,
	wikipedia text
);

drop table if exists landpads;
create table if not exists landpads(
	id varchar(5) primary key,
	full_name varchar(25),
	status varchar(10),
	landing_type varchar(5),
	attempted_landings int,
	successful_landings int,
	wikipedia text,
	details text
);

drop table if exists landpads_location;
create table if not exists landpads_location(
	id serial primary key,
	landpads_id varchar(5) references landpads(id),
	name varchar(25),
	region varchar(25),
	latitude  float,
	longitude float
);
drop table if exists ships;
create table if not exists ships(
	ship_id varchar(25) primary key,
	ship_name varchar(25),
	ship_model varchar(25) NULL,
	ship_type varchar(10),
	roles text [],
	active boolean,
	imo int,
	mmsi int,
	abs int,
	class int,
	weight_lbs int,
	weight_kg int,
	year_build int,
	home_port varchar(50),
	status varchar(10),
	speed_kn int,
	course_deg int NULL,
	latitude float,
	longitude float,
	successful_landings int,
	attempted_landings int,
	missions text [],
	url text,
	image text
)