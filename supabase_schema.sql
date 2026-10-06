create extension if not exists pgcrypto;
create table classes(id uuid primary key default gen_random_uuid(),name text unique not null);
create table students(id uuid primary key default gen_random_uuid(),name text not null,class_name text,points int default 0,math_hero boolean default false,created_at timestamptz default now());
create table station_attempts(id uuid primary key default gen_random_uuid(),student_id uuid references students(id) on delete cascade,station_name text,score int,level_scores jsonb,completed boolean default false,teacher_comment text,created_at timestamptz default now());
create table feedback(id uuid primary key default gen_random_uuid(),student_id uuid references students(id) on delete cascade,message text,created_at timestamptz default now());
create table basics_progress(id uuid primary key default gen_random_uuid(),student_id uuid references students(id) on delete cascade,score int,completed boolean default false,created_at timestamptz default now());
insert into classes(name) values ('١/٢'),('٢/٢'),('٣/٢') on conflict do nothing;
