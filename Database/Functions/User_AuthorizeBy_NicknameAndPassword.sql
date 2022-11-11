-- returns currently logged in user id
CREATE FUNCTION User_AuthorizeBy_NicknameAndPassword(_nickname varchar(60), _password varchar(100))
RETURNS bigint
AS 
$$
    DECLARE
    _user_id bigint;   
    BEGIN
        SELECT id INTO _user_id FROM users WHERE nickname = _nickname AND "password" = crypt(_password, gen_salt('bf'));
        RETURN _user_id;
    END
$$ 
LANGUAGE plpgsql;
    