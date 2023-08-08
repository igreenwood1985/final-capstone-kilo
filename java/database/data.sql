BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO recipes (uri, label, img, calories, yield, cuisineType, totalTime) 
VALUES ('uri-goeshere', 'Grilled Cheese', 'img-goes-here', 200, 1,'American', 20);
INSERT INTO recipes (uri, label, img, calories, yield, cuisineType, totalTime)
VALUES ('uri-goeshere', 'Spaghetti', 'img-goes-here', 999, 2,'Italian', 20);

INSERT INTO user_recipe (user_id, recipe_id) VALUES (1, 1), (1, 2);

COMMIT TRANSACTION;
