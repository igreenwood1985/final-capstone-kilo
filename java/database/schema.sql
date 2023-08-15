BEGIN TRANSACTION;

DROP TABLE IF EXISTS meal_plan_meal;
DROP TABLE IF EXISTS meal_recipe;
DROP TABLE IF EXISTS user_recipe;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS meal_plans;
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
	recipe_name varchar(200) NOT NULL,
	img text NOT NULL,
	total_calories numeric NOT NULL,
	servings int NOT NULL,
	cuisine_type text NOT NULL,
	total_time int NOT NULL,

	
	CONSTRAINT PK_recipe PRIMARY KEY (recipe_id)
);

CREATE TABLE meals (
	meal_id SERIAL,
	meal_name varchar(50),
	description text,
	user_id int,
	
	CONSTRAINT PK_meal PRIMARY KEY (meal_id),
	CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE meal_plans (
	meal_plan_id SERIAL,
	meal_plan_name varchar(50),
	description text,
	user_id int,
	
	CONSTRAINT PK_meal_plan PRIMARY KEY (meal_plan_id),
	CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE user_recipe (
	user_id int,
	recipe_id int,
	
	CONSTRAINT PK_user_recipe PRIMARY KEY (user_id, recipe_id),
	CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT FK_recipe FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
);

CREATE TABLE meal_recipe (
	meal_id int,
	recipe_id int,
	
	CONSTRAINT PK_meal_recipe PRIMARY KEY (meal_id, recipe_id),
	CONSTRAINT FK_meal FOREIGN KEY (meal_id) REFERENCES meals(meal_id),
	CONSTRAINT FK_recipe FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
);

CREATE TABLE meal_plan_meal (
	meal_plan_id int,
	meal_id int,
	
	CONSTRAINT PK_meal_plan_meal PRIMARY KEY (meal_plan_id, meal_id),
	CONSTRAINT FK_meal_plan FOREIGN KEY (meal_plan_id) REFERENCES meal_plans(meal_plan_id),
	CONSTRAINT FK_meal FOREIGN KEY (meal_id) REFERENCES meals(meal_id)
);


COMMIT TRANSACTION;
--rollback;