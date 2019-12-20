CREATE DATABASE mission_spacex;
     
drop table if exists capsules CASCADE;
create table if not exists capsules(
	capsule_serial varchar primary key,
	capsule_id varchar,
	status varchar,
	original_launch date,
	landings int,
	type varchar,
	details varchar,
	reuse_count int
);

drop table if exists capsule_mission;
create table if not exists capsule_mission(
	capsule_mission_id serial primary key,
	capsule_serial char(4) references capsules(capsule_serial),
	name char(10),
	flight int
);
drop table if exists cores CASCADE;
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
	water_landing boolean
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
	location json,
	landing_type varchar(5),
	attempted_landings int,
	successful_landings int,
	wikipedia text,
	details text
);

drop table if exists landpads_location;

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

drop table if exists rockets;
create table if not exists rockets(
	id int,
	active boolean,
	stages int,
	bosters int,
	cost_per_launch int,
	success_rate_pct int,
	first_flight date,
	country text,
	company varchar(25),
	height json,
	diameter json,
	mass json,
	payload_weights json,
	first_stage json,
	second_stage json,
	engines json,
	landing_legs json,
	flickr_images json,
	wikipedia text,
	description text,
	rocket_id varchar(10) primary key,
	rocket_name varchar(10),
	rocket_type varchar(10)
);


drop table if exists payloads;
create table if not exists payloads(
	payload_id varchar(15) primary key,
	norad_id int [] NULL,
	reused boolean,
	customers text [],
	nationality varchar(25),
	manufacturer varchar(5),
	payload_type varchar(15),
	payload_mass_kgs int,
	payload_mass_lbs int,
	orbit char(5),
	orbit_params json	
);

drop table if exists missions;
create table if not exists missions(
	mission_name varchar(15),
	mission_id varchar(15) primary key,
	manufacturer text [],
	payload_ids text [],
	wikipedia text,
	website text,
	twitter text,
	description text
);

drop table if exists launchpads;
create table if not exists launchpads(
	id int primary key,
	name varchar(25),
	status varchar(10),
	location json,
	vehicles_launched text [],
	attempted_launches int,
	successful_launches int,
	wikipedia text,
	details text,
	site_id varchar(25),
	site_name_long text
);

drop table if exists launches;
create table if not exists launches(
	flight_number int primary key,
	mission_name varchar(25),
	mission_id int [] null,
	upcoming boolean,
	launch_year varchar(4),
	launch_date date,
	is_tenative boolean,
	tentative_max_precision varchar(5),
	rocket_id varchar(10) references rockets(rocket_id),
	ships varchar(25) references ships(ship_id),	
	launch_success boolean,
	launch_failure_details json,
	links json,
	details text,
	static_fire_date_utc varchar(25)
)