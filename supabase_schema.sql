create table if not exists students (id uuid primary key, name text not null, class text not null, points int default 0, done jsonb default '[]', attempts jsonb default '{}', basics boolean default false, basic_score int default 0, photo text, boosts jsonb default '[]', last_seen timestamptz default now());
create table if not exists events (id bigint generated always as identity primary key, student_id uuid, name text, class text, type text, data jsonb, created_at timestamptz default now());
create table if not exists feedback (id bigint generated always as identity primary key, student_id uuid, name text, class text, text text, created_at timestamptz default now());
-- فعّلي RLS وسياسات القراءة/الإضافة المناسبة لحساب المعلمة قبل الاستخدام الفعلي. لا تضعي service_role key في الموقع.
