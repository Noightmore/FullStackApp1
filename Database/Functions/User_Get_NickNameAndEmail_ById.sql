-- returns nickname user id and email by user id
CREATE FUNCTION User_Get_NickNameAndEmail_ById(user_id bigint)
    RETURNS TABLE(
        id bigint,
        nickname varchar(50),
        email varchar(50)
      )
AS
$BODY$
BEGIN
    RETURN QUERY SELECT id, nickname, email FROM users WHERE id = user_id;
END;

$BODY$
    LANGUAGE plpgsql