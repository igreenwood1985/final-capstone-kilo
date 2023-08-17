BEGIN TRANSACTION;

--users
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('sadiq','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');

--recipes
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time) 
VALUES ('recipe_e4108dbf7f340c9b08592e57e669353f', 'Santa Fe Chicken With Saffron Rice Recipe', 'https://edamam-product-images.s3.amazonaws.com/web-img/98d/98dddf547dc7d43f89195d16085c23ff.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQD%2BhVYpBSIa9ttMNIgDGveZMzRQA8LW%2Bj41PYb4oWdmDwIhAJrrzkixYQi5iAZc3viap0jiwyyYPmyzODduC15h5eQ%2BKsIFCJD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2IgwGzUAmpc3MgiM9nMcqlgWSVGFKTAFfrjiUtKqGr%2BOdZPv2mZSLeLGGrvdAjxa9eNS%2B%2BwNwcvdS%2BYfqts0gBdv6m8FO8NjUsKDT8SqxBFdzlZLdc81E44oau%2FhcONPSNmg0YsFfA%2FCN5QoUNUpu13zexIMi7K%2B17P8rXDm8Vi4Q3RwrUuTQQsougDhF0EMdvQm4RktO%2B6NeY%2Bs293%2F%2BWUQK9iTgyxCqDmb2vhoLEemqeF4DHT4hfOVw9Qc0DqHIS2nIP0P9rsVrqQaolEuZ0bmN%2BXiWLTMTDY0Gj2z7LVX5%2BAkburiNG%2B%2B6fQLCvLzbptuUXuoM0XlbrjhUsjj9w1mTbNdl7AMoVvm1w6jAk0IPuhpTiEHAOR6oJCGnTnKhtL7weHeN2zjYn3KdF3D6Yl6duGWCpCYOD67ASWQXws%2Fgn1tIUWZSvRSR8q6yP25N8yeo2NZTR7qD4GgfkQik4BykeGIZePPwj%2BFtgGpfZKYzSbz8WQhgWc38dL8PBt3iDlmFomlb1QyCrSZdTlcuBsbNjWMGDbR%2Fc7%2F0IAycYDOAoJ%2F%2BlUdiNPtAvAUMBArDbfevkb6CaP1IwGIJJsHhXpOfV%2BdXFCpALmlxhE9JVogl9QSqg2RNnAW%2BUeBhv2cEOz95ZddwsTAJey%2BBbgV1e7uOMMy5yI%2BMko1mVnU7LWyDnEkS5vYuU4YskG%2FMTLl0ubLN9wXRIGznoqh%2Blf%2B9Nkg5eyiWtClMcuarzdDBroBoLRxA7fQ2tJQm8Ty%2BlB4whH4w48WGgUZjtgKcbCjDsBlIDnSHKKnLU4u7jkOpwfCzBSuL%2BSyHyWeSx1Qy45Jiec1KhPg%2BJc3OhJc3CnDaxhNx68Z5ZVqZ6UWexoY4tJBt2iGvhcBxuTSg%2B2RWjSbmyxdwgwixvTDcqcmmBjqwAW0ImvXAncqeCsRVgh7gBWje124XVKZY5uqDpfIwHaRcUNITtR9fUkN1tUdCzdDkTz9xeHAJ1exrndIF1ThYXuoKrnB4uLeZ3z1fRVEYTc3fJADsLZ0hRc%2FoU61DC%2FXMJNaTavZixrPxaPWKUIjaSPZ7BbR6ImNEBQ5lZCaQleE2pDHnVxnmVb2rUaklap6pBH68oCrThXZpUloLE92uKwwLh16KivynzcY4bjuYgxNx&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230808T154513Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIA3CVRPG%2F20230808%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a015ab90eb392660dda86bd87c0830fe1e5f09cdf253d085438142fd4c772aa3', 2105, 4,'American', 16);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_3b3786928533bda042ec042d4da737b3', 'Spaghetti bolognese frittata', 'https://edamam-product-images.s3.amazonaws.com/web-img/16b/16ba25b872a0cb4b3efd1bc43c6969f2.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAEaCXVzLWVhc3QtMSJHMEUCIQCXjTbRrzWgdQC63O2gzbRkrSwDmhe4MVPSNX6OdjzQLgIgC1ir9Gg4bAoH68Dcyvd%2BZfY1yPRv%2BLsElHLGXZlS2CEqwgUIqv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPzLuOzadICXQA%2FMzSqWBac67QMkX%2F3999JRcPXYTC29CB3GQvyDWKgZrR0fAEdo52R2s%2BIGRdsOTP1BAjG3F0l6WqtstOjApxeHpDlHdyOSK0Qs3uXiJ%2B1Z2pxrghBqKaylEchIfkhHX09kVcXzG0Bp%2FfgWw5XSMpf1PgSqi9ml1uEOjqHzWzxuRYdvS%2B5tylMSulU1wqoMZ6Q7H2DTEzY9vwkwQ71NJOEtawQzD%2Bsgog8bGg9rwBPu5H%2BjaEZgmAGzuOE4dhLQ62U85tZdNE7gvthfZW9ukIDUmuCr5JMOuKB6RxqXg3CvYWSfYnLZcoOelk9lhYRF9j59DavemXfH%2BIAiYazAYG3%2Bx29IWvdfiQjlqkpX0k9gjgvZ3XApKmtm5qFP3Ge8MicXYPt9GQ0FOrFExFn4v6%2BlA0Soye3F3qQwqBc4w2n3E2T6cNesWEBELQ%2BSg3pWe4VQU5F%2BxAE3g%2BxtX9yVACqkHq03%2F5Cqa6JKs5BLr0gmHYitoJHcBRL0KPW4LRXbkqfv2lgSM8VBD9Tzd0iTn6BFbzreGi2W7Bc5qcMXFaFPjjRj%2FvWMJmUWZWpnkAdKXlXLDn6LEM25R2VdTEXUm0wOliV2dfD1cfpdEaq4PHH%2FbPfc4r7Vi9Im8iHA%2FiHH5%2B1Gu3gOcDGfkIIGxUcsqXYZMG2aQy4iDwqL8u1kIwn5UrzjWlAJpsmxesq1w50G%2B%2BqKCyZvXdyp3EA34PZt8QLVBVMSOHvk7ZgMAzaLXLYa%2F4jlkAQ00sqZPvrybV72nv5EVONbVR6VeALMoUydqQJLPii84sz1HaHclXI22z2p6J7EbiQ%2BEI%2FFK36NIvhfVc%2B%2FABMW6gXLhNLurOvYa%2BuHjzw6RnyoaFjDV4dHcXgZPzfTeGX%2FecKcIhp0MO6Cz6YGOrEBxogP4SxH9RsatCwq6PELSVEznyx8%2BuRaAyzBF%2FkVG4zSk7YYRkbXFStQ9qCYvpeZJ1m0ga2qlWkMO6KISjTrT79XuBdKZyB4yYfApaSueLy4JcpIYGNkIwqh0qRgpS2CmhZZUiKkJtlsqmQfgwjZQwZpM8ss3%2BVISGHz8ROvbA%2BUPUxwLELWD6K3LIaV3l96s2Ir52%2BSgNEWpa8EYPlbR0%2BNoKcyf8cOHfo13Ih2Sw4J&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230809T174811Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHDBUNZ4W%2F20230809%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e46f72c165c001f8b3ee7dbe42083f8b8827dea6605e5da94269cecf50964795', 2055, 4,'Italian', 45);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_4214a3a9bd3014a58eb93156c48e18a4', 'Slow-Cooker Vegetable & Tofu Thai Stew', 'https://edamam-product-images.s3.amazonaws.com/web-img/de6/de6de8cf0c06839454679fbe5d9dfdc4?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLWVhc3QtMSJGMEQCIB49pea0dhqPiEzVYJErWcGsJMMnVxm8zFWS%2FzNkkk6sAiA4lmym0DkV87wJxg2TieO69JybB0LCfRwwaG52Wa%2B1%2FCrBBQi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIMRbu6fzSt5Ojfi50ZKpUF2NSXgGSRxa2nOvEXmGLo3aeamPwClrQtar%2FLkLemXKVa7KxGIYBkrP05TfpPyUXZPd7qS3UoGL6O%2BaNb7f1pXceoPOgyteGwC57XQYeN50pMf4KGswWZYUcInnTN6G1UfXwugQCbDjhyQUU5YYhz1XYdXZU%2FyuQHyD353N7Ljwub0zauNKGaKZcv5FzFkDpwMVFS9Rs4nRTTJ8FzT0GRd7jhP6G%2BpEBk%2FP%2FUuUByJHQZl0iHmbtfevBcBe4LbyfJUXO7dav538BD6D%2BVNub7k%2FKON1DDQXF3VqTihULUahL4d%2BfKzzXk26nkxgpA7LugX2zbr%2BzY3ZrHNqz7PMYirNKZh66fTxJFL4daXd3HBZ35LNiXOWtDdRayMVGXEwFhLirLcy%2FTkjX1Cmk2y9%2F2BS6kgH37tAosxxdollC8%2B38ULpQSE7aLkDMWOceIZeMgvZlx%2Fpuzb%2Bfbieznz2DqW1THkMmr2%2B5yCPsdf%2FyzaiqD7NtuTryyxHWaE%2BFfQWVG3LMzJF0ZDn%2FP%2BuOL2cRasugN%2FmFANI%2Byy4axTjkG44jCt4xM2vX%2BzTz3D1WZ7D9Ra7RtzZuHaehMXqZyYv%2BUTM8AGzRlb%2FT3gLkcDu3IyUuFaA17bMJPd8OAYNgUULtIXHY3WIDfEi62mCN4RZhhKrHi2dVK11lj5N4wVsVMj2BkdvMLEFWkBGtP6XIt2MAXhlQO93J6vqkLm7L8NZl7COMWin03cLtkQx8VOE4r12Hft4TkziyPuPWhw0UBfaVMzvZO7hbkOWrDAcEj7iwxE6h64CDsroGIUiDNqXw%2F7GW0r2Cz3MQvoPbZ6sBgRdJjEdFsfrwhfxmFPvx6wzxuVlft1OgdzWEn%2Ft1mc5UuAT8LNTGr0zDRy9OmBjqyAYj64%2B79eLqJU5jH%2FMyee06iyZN3P6JQh6Ve8UVo%2FX2%2FbzKeAvXLsdRhYmbYyPhqbiZhP1OfHno%2BPAEnQzIJWi2YxTj4UhLKVldfDZdQT38M3lJrXsD9JdARgG2VUti7R9xwkxXG%2B9qWxJnBwQEbw59fPlupYFeV3S0TUp%2BSZoMI4aPQRpiY86XAxInOD8%2BuKaFNqJepY8efhhyZrFStp%2B8iaa0NpbR%2BRDMHlFVzujYwfpU%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230810T140531Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKKYIF4GJ%2F20230810%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=4c32353f05c1918d37e469d4a407b6c5ef21cd2275a9dcd969ff2a3966284ff7', 1179, 5, 'south east asian', 275);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_b20815eac65ee2fa5f848f56c16056dd', 'Zuni-Inspired Grilled Chicken Salad', 'https://edamam-product-images.s3.amazonaws.com/web-img/3ac/3accba1eeb5ac38d902d056050c05ead.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLWVhc3QtMSJHMEUCIQCf0C%2FcGeVpvnRVhZ2N2RnmazS75htEOHO221yLP2isXwIgXnavnbwwA%2Bqtv7KEuLERBYk0LfRKxtar2fwLgTB7bkoqwQUIv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDHiCCWr22kFuf7NSJiqVBToVujTxv3Mkmo04TnKZC55IFjLcCip%2BET5vSWSx24jj%2F7wqvNXRPDBfT97UwaY7tvBjJoFK%2F%2FpXE0kVcMJmSRNDAvSZpxo7MMY5npJRs2HX%2FdrMU9BXEFrK39ZYZmiAnUz26k2h4DB5hhOwq67QW899XRTtFuMLLlP01fGPjDBx63bKkk6NO4WlLq1Y2LBCNEkAJwfNwjbIJCKFi3erDcu8o8zFLCPMiss6Jze%2BTbHF3ozNtOgIFcJ0NySe3VCidoSWmPbYuUZsDBXTxga%2FjL6706m4fnfYX8UDvujHV%2Fn14mn1G8aDFaRBDMoocHabV1%2FB7JurIEDcjDFgcKA5odxmDm8dAxaXKHlDjeE4PChTm7ohJo%2BEEBE1YfCOwQX8qKnx6NmITxuTVD%2FF%2FNIYVGuDF1pi3lVxlyg4RJ9GfUI%2Bl9dJIs2vHLdr7ecFg4XTfIRBDndV%2BO2PH6GSIuvYOA7DbqMitfBUIxXXk1IZ3R8Eop%2FRbqX5YlHk7y6Kv5NJTh8%2B%2Fbd4TxUx2yABdI%2FR0o5AiofmoZ%2BucJND%2FcpIQvIwFyzIF%2BUHNjfd5dfMfWBPbD2SWSCznrke8j%2BLPMKMP15pbN7W8uB4sKEs3%2FdEG3neEdjDvfhx%2B8Tllla4O7hbyWAItAYPGW2QSe%2F8Tv2d55M5Vv4sWAYYueM9qvBcsS0w3u55PkvaVxsn0YRDueGZRgxX2Ndk%2BL95rtclRcQLs%2BFIO42JjuJ3A3sxZa1x3KnkD5%2BNlumVDP95z1zoR9pcGOd%2B%2Bb0Qu4CEENGYwPOZtPCxis4O%2FoXO04onfshyF0LL%2BJVIXXHHLbcN9%2FOVPT%2FdOu14DjEezP3gNRT%2Fjci0BsoMPmJ3huOHQXJyjP%2FTbuYh1TVbzxIw28zTpgY6sQE6hamWn9%2FY4rx%2F5z1VvuQf1efPGVPnv9MGhpPEOWEmRvL2kYeaFmvklEDKQlJs5oBzLhgi%2BlBW%2BIwaacriKAc%2BOTDzFBnMZdtBgMvR%2Fo%2FzV%2BOayUKIyHpxm8XYmpvOWlTt1vykWx%2BF9v8EX%2BTuILnKxbRXuqoB0QjW%2BLbRgDVdLNODxEQiR3sfwWzKhjJ2LUjPq1e8kzXTBIhK4P6sRhiJDGsoBRPPccgOKYHM2GYAOZg%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230810T140558Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFK7DAKGWM%2F20230810%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ec30f933ceecbcc3020772ec3ff0698e1fd770e7a5f2c82cd483b3fd73c7d922', 1090, 4, 'british', 20);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_f792763b6f218f3630e99ac294a497f8', 'Huevos Rancheros', 'https://edamam-product-images.s3.amazonaws.com/web-img/e85/e8550a72b67ee389c1668a704ea9379f.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGMGlN8WTYAZaGL1uyQKBAV0zn4RQqcOXh8ygbO%2Fb0MCAiB3CV4K7TXFuMDoRFBXgm2B3GK6fRktr9eJEvDh%2F6pF6Sq4BQhMEAAaDDE4NzAxNzE1MDk4NiIMdmd%2Fc0poPLkg%2FvM0KpUFlQdJ0DoB3Vn7Zc2YzykwiMIU%2BH0UPzpccYBR5TV09F6n%2BSC1ziOlwsGxY97W%2B4WuXYHOIdRCW%2BDIZAAaUUaOlbG%2Bcw3H3n9Wgjd9taqAG%2FXN%2FzBkACUhG9U8emGgpno4vEUeOHC6gAmPijcjHU1m22abkVX%2FjvxybVxFAVaVn8JqwWqE06NyYLPu%2FD8s65o4WgspHBygLL2msklet1j0B%2FLEmVcoh3Gek3zLwIx4miYDnkq6m8sItaxSM%2FrtDIwNMo%2BfoBJaAeNQ80PKQmCTAwHqWtgTufzaemce1VejUkT7mLHyJYsdlXAfcu7r1KlB2DYjrYTBcDp%2FFJn7n4z7qU4P2uxG5LVCHs30dRMuC6wrXVhfMG97c5%2BPprYxw%2BTi8%2BrvHBBQDG7j9owW6vrNFhIr7xJDjbc7qj5jDTuOmSMPVtDuVGbRk4NL2FD3jEZooWFR1upI35cGgWaQqnTmNaqG5%2Ber9Phjt6WPz2UHiZB4FOqDNDctLFgzRXFaSM2c%2B2UsvJL0SREl5ysXcwdZx8Xn4ayjjYDFvJbRY6CYAVGT%2BRhmUl5kMXkSr4lQNfVzuVhZUupaK3f%2B8hqhmpvupcqCcyw%2FKzIlI%2BOdZP62%2FTR5K6hhuqKNPq3AlQzewaWz5BWvqVy%2FzaPMIbOH0mGbs0fu36eESlivvRkzebbONwPyAIqf8ShlWz4b26YiOzddYJGly2rv7A2%2FI2n85BzicSygB15T5BLAXWfVpJ%2F%2BneN43mq0ZABWNnvmmw6v7Z%2F4ci6rPx%2FaHeeuYZf6sOrhP0pMEf5P1rGKUTV8%2BRxv6%2FxQZ8jjtt2smgKPJvGDZja3B23SmJW3LZIlAtKKAOgEUR9VcA5RXyAjVSmHvkSUVkE%2FvSY%2BGDDvk%2B%2BmBjqyAUYa58eNuKHW3CaIwdVPv25DPq7z94fxqP%2FdGegc2WkXDY2NBNDKal0NlBNxLBmiXWDwFBSYz6ad01Vb4EKYvIORZ71waHXT3ENuM8n9tmFO1J6g5ZRnn40nQ%2BwdtHfMuX7wJ%2B9YC3o%2BU8XYurs1ulw8h6JWdxVnYsujaLAwkUWhLow4AqhwQDj%2BMRA2iL19jAHJfeZmTWp72kVdcL2%2BmukQnNiJNSbJobsA37p4F6WwAN0%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230815T200004Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFLUXIUO5P%2F20230815%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=38e59a5a64b0681f4abf27615b89abb00d6d94d467d27b0e0db2e9cf3f9b147a', 1908, 8, 'mexican', 0);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_95d6bf0db14b4a6941df86045cca3374', 'Red Chile Pork Tamales', 'https://edamam-product-images.s3.amazonaws.com/web-img/eb5/eb56b8a9f826a14883fb5daa6542ea1c.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCsPqP49vJ2m%2BwPFpUq3DhXBdA5FEVDLjmEQXb0KYBTVAIhAN3lAoAUTArWfAlh69lpJISwh87LHlFg2Rwq7cOFHDEEKrgFCE0QABoMMTg3MDE3MTUwOTg2Igx7mA8j4BQj2bHSCRAqlQUB6V%2BgZFOoPlDPjnTMuph66HIAWfptPtVgCWuPNLbVdMjtAYGMDGqAbht7Lo8Tc9BGMw488E3NA0IhKd0rfV%2Bbi7gx0WN1GJqXECNy1YjZ2DxxijVGcw4%2F5f3uGHQItDRg7xDAA6DvKS%2BoXPuZv1s%2FvzH0ELP8m%2B1LvN2HmzfszIstvRZ7bI4aa2TJpHj3Q8VqeojPR9w6i4MwBIZiLyJ8DKCokOpiSo9IBJ7sDSOfOchSLebb%2BhHrXVS82IchzFk7urexvEWXUXQDa8Ma00r5FRd46hv8bRLFvOmGTBXjH6%2FHMKcq7ATk1LmN%2B%2F5JUxq%2Bno5M5qhGDnoMKlIQtJsO%2BFLgERpGRSXLq0hGNjzRi8K%2BADsbU3lSDiKKE1IRvWs6FFnAgvJLOMwDSbq7DUW55bwsL1DL64Q5PSzjTLKhD0A2tsdHqgSlkWZiOlnZoZ4bcfSOouEGfyh68xjvg292K40qxHkEJ7gg%2BBdq7e6Ead7anE3DUdujV1AGjLXFaLy3Lle0v75eohC8qJGsNKZLd9ryqrERVBhTr%2F0TGyviwL2eT7R6lTAdhLOL9iohcs0bSW9AxTBlJ5Xca%2BpLc%2FtrEK%2BHAvQdWqQgl6GT0MVhRQKm0ugmOigOfDfDAqXBot%2Bt3rwZ%2BDvKscDDVeX%2F52arZWI31GYw53MvYfoZgTsAVn%2FJ%2BqSaKtOOAcNcmokhjRUFtYBHn1R3MGGnoUkZ3WOD0CSGrgu7ooOtL3J%2FUPGQIrbko4oOsl%2FsdyUxxQAjrsm8hW%2BgAjr0oRuDuTehaJdPV6x8mhit1CszGi1ZRy8Ba3%2Beuxgqr96YZAOUhvqf4WFDGwBfDXTX%2B%2FzUsHqbRgyBmeqE%2FyAsmc6Op0jy9FnCVgvvRJ%2BKMMSr76YGOrABI2xdZh0iQJt0w2dxjx%2BS6dI0TsD9sP6hjmEoppY4m%2BxmimQCPSKF%2BlyLqPoKKB%2Fm9yhh0zvB2vj36AIHzoH59Tzrq5YRyBZtIo2RowXFrVb1U3GqeYNHMxkX79vmQscsd3siz%2B2DMDFPlCL9%2FXs1FXhESOnsfe3ylNxoji75HLThvs2W1mqw5frtOau86Rb5NdS3t4dD35wS0d9bxRmGLo2lV4kiDIrHQDUGQTASd4I%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230815T200137Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHNJ5XR6I%2F20230815%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2fbc6705ee92786f359ff96bb88a8647d9559ee74d2471093edae55ebec7d8a7', 10469, 30, 'south american', 0);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_49b0ca3acaa18668d312afbb1f87d5d6', 'Sabzi And Paneer Makni (creamy Paneer Curry) recipes', 'https://edamam-product-images.s3.amazonaws.com/web-img/c88/c88f1e854fcb00464b1dc9d2b6526257?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCsPqP49vJ2m%2BwPFpUq3DhXBdA5FEVDLjmEQXb0KYBTVAIhAN3lAoAUTArWfAlh69lpJISwh87LHlFg2Rwq7cOFHDEEKrgFCE0QABoMMTg3MDE3MTUwOTg2Igx7mA8j4BQj2bHSCRAqlQUB6V%2BgZFOoPlDPjnTMuph66HIAWfptPtVgCWuPNLbVdMjtAYGMDGqAbht7Lo8Tc9BGMw488E3NA0IhKd0rfV%2Bbi7gx0WN1GJqXECNy1YjZ2DxxijVGcw4%2F5f3uGHQItDRg7xDAA6DvKS%2BoXPuZv1s%2FvzH0ELP8m%2B1LvN2HmzfszIstvRZ7bI4aa2TJpHj3Q8VqeojPR9w6i4MwBIZiLyJ8DKCokOpiSo9IBJ7sDSOfOchSLebb%2BhHrXVS82IchzFk7urexvEWXUXQDa8Ma00r5FRd46hv8bRLFvOmGTBXjH6%2FHMKcq7ATk1LmN%2B%2F5JUxq%2Bno5M5qhGDnoMKlIQtJsO%2BFLgERpGRSXLq0hGNjzRi8K%2BADsbU3lSDiKKE1IRvWs6FFnAgvJLOMwDSbq7DUW55bwsL1DL64Q5PSzjTLKhD0A2tsdHqgSlkWZiOlnZoZ4bcfSOouEGfyh68xjvg292K40qxHkEJ7gg%2BBdq7e6Ead7anE3DUdujV1AGjLXFaLy3Lle0v75eohC8qJGsNKZLd9ryqrERVBhTr%2F0TGyviwL2eT7R6lTAdhLOL9iohcs0bSW9AxTBlJ5Xca%2BpLc%2FtrEK%2BHAvQdWqQgl6GT0MVhRQKm0ugmOigOfDfDAqXBot%2Bt3rwZ%2BDvKscDDVeX%2F52arZWI31GYw53MvYfoZgTsAVn%2FJ%2BqSaKtOOAcNcmokhjRUFtYBHn1R3MGGnoUkZ3WOD0CSGrgu7ooOtL3J%2FUPGQIrbko4oOsl%2FsdyUxxQAjrsm8hW%2BgAjr0oRuDuTehaJdPV6x8mhit1CszGi1ZRy8Ba3%2Beuxgqr96YZAOUhvqf4WFDGwBfDXTX%2B%2FzUsHqbRgyBmeqE%2FyAsmc6Op0jy9FnCVgvvRJ%2BKMMSr76YGOrABI2xdZh0iQJt0w2dxjx%2BS6dI0TsD9sP6hjmEoppY4m%2BxmimQCPSKF%2BlyLqPoKKB%2Fm9yhh0zvB2vj36AIHzoH59Tzrq5YRyBZtIo2RowXFrVb1U3GqeYNHMxkX79vmQscsd3siz%2B2DMDFPlCL9%2FXs1FXhESOnsfe3ylNxoji75HLThvs2W1mqw5frtOau86Rb5NdS3t4dD35wS0d9bxRmGLo2lV4kiDIrHQDUGQTASd4I%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230815T200153Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHNJ5XR6I%2F20230815%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=b91cc1b79707b99afd64b971bc4a8664a9d8397b585eb315f39f2641f3162453', 1392, 4, 'indian', 45);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_f3640680abe1941e94dfb6de55f75ef3', 'Homemade Naan', 'https://edamam-product-images.s3.amazonaws.com/web-img/8be/8be56dbd4498d46472f5494c6cf2f900.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGMGlN8WTYAZaGL1uyQKBAV0zn4RQqcOXh8ygbO%2Fb0MCAiB3CV4K7TXFuMDoRFBXgm2B3GK6fRktr9eJEvDh%2F6pF6Sq4BQhMEAAaDDE4NzAxNzE1MDk4NiIMdmd%2Fc0poPLkg%2FvM0KpUFlQdJ0DoB3Vn7Zc2YzykwiMIU%2BH0UPzpccYBR5TV09F6n%2BSC1ziOlwsGxY97W%2B4WuXYHOIdRCW%2BDIZAAaUUaOlbG%2Bcw3H3n9Wgjd9taqAG%2FXN%2FzBkACUhG9U8emGgpno4vEUeOHC6gAmPijcjHU1m22abkVX%2FjvxybVxFAVaVn8JqwWqE06NyYLPu%2FD8s65o4WgspHBygLL2msklet1j0B%2FLEmVcoh3Gek3zLwIx4miYDnkq6m8sItaxSM%2FrtDIwNMo%2BfoBJaAeNQ80PKQmCTAwHqWtgTufzaemce1VejUkT7mLHyJYsdlXAfcu7r1KlB2DYjrYTBcDp%2FFJn7n4z7qU4P2uxG5LVCHs30dRMuC6wrXVhfMG97c5%2BPprYxw%2BTi8%2BrvHBBQDG7j9owW6vrNFhIr7xJDjbc7qj5jDTuOmSMPVtDuVGbRk4NL2FD3jEZooWFR1upI35cGgWaQqnTmNaqG5%2Ber9Phjt6WPz2UHiZB4FOqDNDctLFgzRXFaSM2c%2B2UsvJL0SREl5ysXcwdZx8Xn4ayjjYDFvJbRY6CYAVGT%2BRhmUl5kMXkSr4lQNfVzuVhZUupaK3f%2B8hqhmpvupcqCcyw%2FKzIlI%2BOdZP62%2FTR5K6hhuqKNPq3AlQzewaWz5BWvqVy%2FzaPMIbOH0mGbs0fu36eESlivvRkzebbONwPyAIqf8ShlWz4b26YiOzddYJGly2rv7A2%2FI2n85BzicSygB15T5BLAXWfVpJ%2F%2BneN43mq0ZABWNnvmmw6v7Z%2F4ci6rPx%2FaHeeuYZf6sOrhP0pMEf5P1rGKUTV8%2BRxv6%2FxQZ8jjtt2smgKPJvGDZja3B23SmJW3LZIlAtKKAOgEUR9VcA5RXyAjVSmHvkSUVkE%2FvSY%2BGDDvk%2B%2BmBjqyAUYa58eNuKHW3CaIwdVPv25DPq7z94fxqP%2FdGegc2WkXDY2NBNDKal0NlBNxLBmiXWDwFBSYz6ad01Vb4EKYvIORZ71waHXT3ENuM8n9tmFO1J6g5ZRnn40nQ%2BwdtHfMuX7wJ%2B9YC3o%2BU8XYurs1ulw8h6JWdxVnYsujaLAwkUWhLow4AqhwQDj%2BMRA2iL19jAHJfeZmTWp72kVdcL2%2BmukQnNiJNSbJobsA37p4F6WwAN0%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230815T200221Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFLUXIUO5P%2F20230815%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=683092554cd8e61feaf8385cb7b05ea2fa9b21f4f40ed77ea32978827685b2b9', 1413, 6, 'indian', 0);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_b3eda98ba4d37c4ea45a9d49b975719c', 'Farmhouse blackberry & apple pie', 'https://edamam-product-images.s3.amazonaws.com/web-img/3f5/3f5d1f82cde9756f8a73f572478340e2.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCsPqP49vJ2m%2BwPFpUq3DhXBdA5FEVDLjmEQXb0KYBTVAIhAN3lAoAUTArWfAlh69lpJISwh87LHlFg2Rwq7cOFHDEEKrgFCE0QABoMMTg3MDE3MTUwOTg2Igx7mA8j4BQj2bHSCRAqlQUB6V%2BgZFOoPlDPjnTMuph66HIAWfptPtVgCWuPNLbVdMjtAYGMDGqAbht7Lo8Tc9BGMw488E3NA0IhKd0rfV%2Bbi7gx0WN1GJqXECNy1YjZ2DxxijVGcw4%2F5f3uGHQItDRg7xDAA6DvKS%2BoXPuZv1s%2FvzH0ELP8m%2B1LvN2HmzfszIstvRZ7bI4aa2TJpHj3Q8VqeojPR9w6i4MwBIZiLyJ8DKCokOpiSo9IBJ7sDSOfOchSLebb%2BhHrXVS82IchzFk7urexvEWXUXQDa8Ma00r5FRd46hv8bRLFvOmGTBXjH6%2FHMKcq7ATk1LmN%2B%2F5JUxq%2Bno5M5qhGDnoMKlIQtJsO%2BFLgERpGRSXLq0hGNjzRi8K%2BADsbU3lSDiKKE1IRvWs6FFnAgvJLOMwDSbq7DUW55bwsL1DL64Q5PSzjTLKhD0A2tsdHqgSlkWZiOlnZoZ4bcfSOouEGfyh68xjvg292K40qxHkEJ7gg%2BBdq7e6Ead7anE3DUdujV1AGjLXFaLy3Lle0v75eohC8qJGsNKZLd9ryqrERVBhTr%2F0TGyviwL2eT7R6lTAdhLOL9iohcs0bSW9AxTBlJ5Xca%2BpLc%2FtrEK%2BHAvQdWqQgl6GT0MVhRQKm0ugmOigOfDfDAqXBot%2Bt3rwZ%2BDvKscDDVeX%2F52arZWI31GYw53MvYfoZgTsAVn%2FJ%2BqSaKtOOAcNcmokhjRUFtYBHn1R3MGGnoUkZ3WOD0CSGrgu7ooOtL3J%2FUPGQIrbko4oOsl%2FsdyUxxQAjrsm8hW%2BgAjr0oRuDuTehaJdPV6x8mhit1CszGi1ZRy8Ba3%2Beuxgqr96YZAOUhvqf4WFDGwBfDXTX%2B%2FzUsHqbRgyBmeqE%2FyAsmc6Op0jy9FnCVgvvRJ%2BKMMSr76YGOrABI2xdZh0iQJt0w2dxjx%2BS6dI0TsD9sP6hjmEoppY4m%2BxmimQCPSKF%2BlyLqPoKKB%2Fm9yhh0zvB2vj36AIHzoH59Tzrq5YRyBZtIo2RowXFrVb1U3GqeYNHMxkX79vmQscsd3siz%2B2DMDFPlCL9%2FXs1FXhESOnsfe3ylNxoji75HLThvs2W1mqw5frtOau86Rb5NdS3t4dD35wS0d9bxRmGLo2lV4kiDIrHQDUGQTASd4I%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230815T200323Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHNJ5XR6I%2F20230815%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=f127bd0177264c9a1ec5ed7040e69137c5deac1779e065a60607c1b94eb49902', 5485, 8, 'british', 130);
INSERT INTO recipes (uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES ('recipe_ceff1d033acecde751ea16980050d7a7', 'Bangers and Mash with Onion Gravy', 'https://edamam-product-images.s3.amazonaws.com/web-img/b0f/b0fa65e8e3e50db846e2f7b40ec9c24f.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGMGlN8WTYAZaGL1uyQKBAV0zn4RQqcOXh8ygbO%2Fb0MCAiB3CV4K7TXFuMDoRFBXgm2B3GK6fRktr9eJEvDh%2F6pF6Sq4BQhMEAAaDDE4NzAxNzE1MDk4NiIMdmd%2Fc0poPLkg%2FvM0KpUFlQdJ0DoB3Vn7Zc2YzykwiMIU%2BH0UPzpccYBR5TV09F6n%2BSC1ziOlwsGxY97W%2B4WuXYHOIdRCW%2BDIZAAaUUaOlbG%2Bcw3H3n9Wgjd9taqAG%2FXN%2FzBkACUhG9U8emGgpno4vEUeOHC6gAmPijcjHU1m22abkVX%2FjvxybVxFAVaVn8JqwWqE06NyYLPu%2FD8s65o4WgspHBygLL2msklet1j0B%2FLEmVcoh3Gek3zLwIx4miYDnkq6m8sItaxSM%2FrtDIwNMo%2BfoBJaAeNQ80PKQmCTAwHqWtgTufzaemce1VejUkT7mLHyJYsdlXAfcu7r1KlB2DYjrYTBcDp%2FFJn7n4z7qU4P2uxG5LVCHs30dRMuC6wrXVhfMG97c5%2BPprYxw%2BTi8%2BrvHBBQDG7j9owW6vrNFhIr7xJDjbc7qj5jDTuOmSMPVtDuVGbRk4NL2FD3jEZooWFR1upI35cGgWaQqnTmNaqG5%2Ber9Phjt6WPz2UHiZB4FOqDNDctLFgzRXFaSM2c%2B2UsvJL0SREl5ysXcwdZx8Xn4ayjjYDFvJbRY6CYAVGT%2BRhmUl5kMXkSr4lQNfVzuVhZUupaK3f%2B8hqhmpvupcqCcyw%2FKzIlI%2BOdZP62%2FTR5K6hhuqKNPq3AlQzewaWz5BWvqVy%2FzaPMIbOH0mGbs0fu36eESlivvRkzebbONwPyAIqf8ShlWz4b26YiOzddYJGly2rv7A2%2FI2n85BzicSygB15T5BLAXWfVpJ%2F%2BneN43mq0ZABWNnvmmw6v7Z%2F4ci6rPx%2FaHeeuYZf6sOrhP0pMEf5P1rGKUTV8%2BRxv6%2FxQZ8jjtt2smgKPJvGDZja3B23SmJW3LZIlAtKKAOgEUR9VcA5RXyAjVSmHvkSUVkE%2FvSY%2BGDDvk%2B%2BmBjqyAUYa58eNuKHW3CaIwdVPv25DPq7z94fxqP%2FdGegc2WkXDY2NBNDKal0NlBNxLBmiXWDwFBSYz6ad01Vb4EKYvIORZ71waHXT3ENuM8n9tmFO1J6g5ZRnn40nQ%2BwdtHfMuX7wJ%2B9YC3o%2BU8XYurs1ulw8h6JWdxVnYsujaLAwkUWhLow4AqhwQDj%2BMRA2iL19jAHJfeZmTWp72kVdcL2%2BmukQnNiJNSbJobsA37p4F6WwAN0%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230815T200452Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFLUXIUO5P%2F20230815%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=942f2e547fb1a7c7cfb852eee3b4871067a79093f829ae5b686bc5fe1aa735e2', 402, 4, 'british', 0);
INSERT INTO recipes (recipe_id, uri, recipe_name, img, total_calories, servings, cuisine_type, total_time)
VALUES (69, 'recipe_0', 'Your Recipes Go Here', 'https://m2w4k5m5.stackpathcdn.com/wp-content/uploads/Thanks-plate.jpg', 0, 0, 'N/A', 0);

--user recipe join
INSERT INTO user_recipe (user_id, recipe_id) VALUES (1, 1), (1, 2), (1, 3), (1, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10);

--meals
INSERT INTO meals (meal_name, description, user_id) VALUES ('Interesting Mix', 'Texmex AND Italian?', 1);
INSERT INTO meals (meal_name, description, user_id) VALUES ('Soup and Salad', 'Thai Stew and Chicken Salad', 1);
INSERT INTO meals (meal_name, description, user_id) VALUES ('Desayuno', 'Breakfast: Mexican Style!', 3);
INSERT INTO meals (meal_name, description, user_id) VALUES ('Lunch in Northern India', 'Paneer Makhani and Naan', 3);
INSERT INTO meals (meal_name, description, user_id) VALUES ('Dinner in England', 'Bangers and Mash for supper', 3);
INSERT INTO meals (meal_id, meal_name, description) VALUES (69, 'Add A New Meal!', 'Your meal plan currently has no meals.');


--meal_recipe join
INSERT INTO meal_recipe (meal_id, recipe_id) VALUES (1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6), (4, 7), (4, 8), (5, 9), (5, 10), (69, 69);

--meal plans
INSERT INTO meal_plans (meal_plan_name, description, user_id) VALUES ('Family Dinner', 'For when the family gets together', 1);
INSERT INTO meal_plans (meal_plan_name, description, user_id) VALUES ('Multicultural Monday', 'Food from South America, India, and England', 3);

--meal_plan_meal join
INSERT INTO meal_plan_meal (meal_plan_id, meal_id) VALUES (1, 1), (1, 2);
INSERT INTO meal_plan_meal (meal_plan_id, meal_id) VALUES (2, 3), (2, 4), (2, 5);

COMMIT TRANSACTION;
--SELECT * FROM recipes