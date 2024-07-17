
create view list_column as
SELECT c.relname                                                                           AS table_name,
       a.attname                                                                           AS column_name,
       d.description                                                                       AS column_comment,
       CASE
           WHEN a.attnotnull AND con.conname IS NULL THEN 1
           ELSE 0
           END                                                                             AS is_required,
       CASE
           WHEN con.conname IS NOT NULL THEN 1
           ELSE 0
           END                                                                             AS is_pk,
       a.attnum                                                                            AS sort,
       CASE
           WHEN "position"(pg_get_expr(ad.adbin, ad.adrelid), ((c.relname::text || '_'::text) || a.attname
                           ::text) || '_seq'::text) > 0 THEN 1
           ELSE 0
           END                                                                             AS is_increment,
       btrim(
                   CASE
                       WHEN t.typelem <> 0::oid AND t.typlen = '-1'::integer THEN 'ARRAY'::text
            ELSE
            CASE
                WHEN t.typtype = 'd'::"char" THEN format_type(t.typbasetype, NULL::integer)
                ELSE format_type(a.atttypid, NULL::integer)
            END
        END, '"'::text) AS column_type
FROM pg_attribute a
         JOIN (pg_class c
    JOIN pg_namespace n ON c.relnamespace = n.oid) ON a.attrelid = c.oid
         LEFT JOIN pg_description d ON d.objoid = c.oid AND a.attnum = d.objsubid
         LEFT JOIN pg_constraint con ON con.conrelid = c.oid AND (a.attnum = ANY (con.conkey))
         LEFT JOIN pg_attrdef ad ON a.attrelid = ad.adrelid AND a.attnum = ad.adnum
         LEFT JOIN pg_type t ON a.atttypid = t.oid
WHERE (c.relkind = ANY (ARRAY['r'::"char", 'p'::"char"]))
  AND a.attnum > 0
  AND n.nspname = 'public'::name
  AND not a.attisdropped
  ORDER BY c.relname, a.attnum;

create view list_table as
SELECT c.relname              AS table_name,
       obj_description(c.oid) AS table_comment,
       CURRENT_TIMESTAMP      AS create_time,
       CURRENT_TIMESTAMP      AS update_time
FROM pg_class c
         LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE (c.relkind = ANY (ARRAY['r'::"char", 'p'::"char"]))
  AND c.relname !~~ 'spatial_%'::text AND n.nspname = 'public'::name AND n.nspname <> ''::name;

CREATE OR REPLACE FUNCTION substring_index(varchar, varchar, integer)
RETURNS varchar AS $$
DECLARE
tokens varchar[];
length integer ;
indexnum integer;
BEGIN
tokens := pg_catalog.string_to_array($1, $2);
length := pg_catalog.array_upper(tokens, 1);
indexnum := length - ($3 * -1) + 1;
IF $3 >= 0 THEN
RETURN pg_catalog.array_to_string(tokens[1:$3], $2);
ELSE
RETURN pg_catalog.array_to_string(tokens[indexnum:length], $2);
END IF;
END;
$$ IMMUTABLE STRICT LANGUAGE PLPGSQL;
