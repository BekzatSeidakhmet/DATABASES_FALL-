-- В файле procedures.sql измени тело функции:
CREATE OR REPLACE FUNCTION get_contacts_paginated(p_limit INTEGER, p_offset INTEGER)
RETURNS TABLE (
    id         INTEGER,
    first_name VARCHAR,
    last_name  VARCHAR,
    email      VARCHAR,
    birthday   DATE,
    group_id   INTEGER,
    created_at TIMESTAMP
) 
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id, 
        c.first_name, 
        c.last_name, 
        c.email, 
        c.birthday, 
        c.group_id, 
        c.created_at 
    FROM contacts c
    ORDER BY c.first_name, c.last_name
    LIMIT p_limit
    OFFSET p_offset;
END;
$$;