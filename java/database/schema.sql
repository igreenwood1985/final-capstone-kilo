BEGIN TRANSACTION;

DROP TABLE IF EXISTS user_recipe;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS recipes;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE recipes (
	recipe_id SERIAL,
	uri varchar(120) NOT NULL,
	recipe_name varchar(50) NOT NULL,
	img text NOT NULL,
	total_calories numeric NOT NULL,
	servings int NOT NULL,
	cuisine_type text NOT NULL,
	total_time int NOT NULL,

	
	CONSTRAINT PK_recipe PRIMARY KEY (recipe_id)
);

CREATE TABLE user_recipe (
	user_id int,
	recipe_id int,
	
	CONSTRAINT PK_user_recipe PRIMARY KEY (user_id, recipe_id),
	CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES users(user_id),
	CONSTRAINT FK_recipe FOREIGN KEY(recipe_id) REFERENCES recipes(recipe_id)
);

COMMIT TRANSACTION;
--rollback;