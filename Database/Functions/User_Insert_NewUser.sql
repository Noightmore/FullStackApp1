-- inserts into users new user
-- called on creating new account/login
CREATE FUNCTION User_Insert_NewUser(_nickname varchar(60), _email varchar(30), _password varchar(100))
RETURNS void AS
$$
BEGIN
    INSERT INTO users (nickname, email, "password") VALUES (_nickname, _email, _password);
END
$$
LANGUAGE plpgsql;
