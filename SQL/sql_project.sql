-- unqiue_id for video,length in minutes,url(at least 3 related videos from Youtube)
-- CREATE TABLE Videos(
-- 			VIDEOID int NOT NULL,
-- 			title varchar(255),
-- 			duration varchar(255),
-- 			url varchar(255),
-- 			PRIMARY KEY(VideoId));

--  Reviewers table: user_reviews,user_review_id(pk),video_id(to link with vid table called videoid)
-- want at least two reviews for min of two videos...
-- f_name,l_name,rating(integer),user_review(varchar(255)),video_id,user_id(primary key)

-- CREATE TABLE Reviewers(
-- 	user_id int NOT NULL,
-- 	f_name varchar(255),
-- 	l_name varchar(255),
-- 	rating int,
-- 	review varchar(255),
-- 	VideoId int NOT NULL,
-- 	PRIMARY KEY (user_id));

-- Fill in Videos table
-- INSERT INTO Videos VALUES (1, 'You missed this in FORREST GUMP','19','https://youtu.be/u5KAh7vZ6VY');
-- INSERT INTO Videos VALUES (2, 'Schlatt Outplays Ludwig','34','https://youtu.be/61SvNp3ltNc');
-- INSERT INTO Videos VALUES (3, 'When good things happen only when you’re absent','21','https://youtu.be/xa9aP5ej7b4');

-- Fill in reviewers table 
-- INSERT INTO Reviewers VALUES(1,'Harrison','Johnson',4,'That is why I try to not be absent so my class doesn’t have the best things.',3);
-- INSERT INTO Reviewers VALUES(2,'Nydia','Moe',5,'this was so emotional',2);
-- INSERT INTO Reviewers VALUES(3,'Malida','Rabba',5,'That laugh is pure gold',2);
-- INSERT INTO Reviewers VALUES(4,'E','Bray',5,'I have no clue what I watched but it was fantastic 🤣',2);
-- INSERT INTO Reviewers VALUES(5,'T','Aspect',5,'The fact that that’s true is sad',1);
-- INSERT INTO Reviewers VALUES(6,'Scenic','Fights',5,'Yeah I missed that lol.',1);
-- INSERT INTO Reviewers VALUES(7,'Luv','lx',4,'One day when I was absent my maths teacher took three periods 😂😂',3);
-- INSERT INTO Reviewers VALUES(8,'Scencic','Fights',5,'That Beyoncé impression was spot on lol.',3);
-- INSERT INTO Reviewers VALUES(9,'John','Smith',4,'So simple yet so fitting',1);
-- INSERT INTO Reviewers VALUES(10,'Adriana', 'Vodnansky',5,'Omg I missed a day of school on Friday and I missed out on writing Valentine’s Day cards for the nursing home and watching 1hour of bill nye in science',3);

SELECT * FROM REVIEWERS;

SELECT * FROM VIDEOS;

SELECT * 
FROM reviewers AS r
JOIN videos AS v 
USING (videoid);    
-- Use USING to drop duplicated column(videoid)
