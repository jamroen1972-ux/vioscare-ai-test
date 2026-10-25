-- Fan Shop data table for the GitHub Pages app.
-- Each signed-in account can read and write only its own JSONB document.
create table if not exists public.fan_shop_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb check (jsonb_typeof(data) = 'object'),
  revision bigint not null default 1,
  updated_at timestamptz not null default now()
);
alter table public.fan_shop_data enable row level security;
revoke all on table public.fan_shop_data from anon, public;
grant select, insert, update, delete on table public.fan_shop_data to authenticated;
drop policy if exists fan_shop_select_own on public.fan_shop_data;
drop policy if exists fan_shop_insert_own on public.fan_shop_data;
drop policy if exists fan_shop_update_own on public.fan_shop_data;
drop policy if exists fan_shop_delete_own on public.fan_shop_data;
create policy fan_shop_select_own on public.fan_shop_data for select to authenticated using ((select auth.uid()) = user_id);
create policy fan_shop_insert_own on public.fan_shop_data for insert to authenticated with check ((select auth.uid()) = user_id);
create policy fan_shop_update_own on public.fan_shop_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy fan_shop_delete_own on public.fan_shop_data for delete to authenticated using ((select auth.uid()) = user_id);
