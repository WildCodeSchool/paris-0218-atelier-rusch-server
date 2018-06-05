DROP DATABASE IF EXISTS rusch;
CREATE DATABASE rusch;
USE rusch;

CREATE TABLE homepage (
	id INT NOT NULL AUTO_INCREMENT,
	title varchar(64),
	description varchar(1024),
	PRIMARY KEY (id)
) ENGINE=INNODB ;



CREATE TABLE article (
  id INT NOT NULL AUTO_INCREMENT,
  title varchar(64),
  shortDescription varchar(1024),
  createdAt timestamp DEFAULT current_timestamp,
  content varchar(1024), 
  PRIMARY KEY (id)
)ENGINE=INNODB;

INSERT INTO homepage (title, description)
  VALUES ("notre titre", "notre description");

INSERT INTO article (title, shortDescription, content)
  VALUES ("Conception d'espaces participatifs à Massy Opéra", "Projet de réaménagement participatif du square de grenoble à Massy", "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.");

INSERT INTO article (title, shortDescription, content)
  VALUES ("Conception d'espaces participatifs à Massy Opéra", "Projet de réaménagement participatif du square de grenoble à Massy", "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.");

INSERT INTO article (title, shortDescription, content)
  VALUES ("Conception d'espaces participatifs à Massy Opéra", "Projet de réaménagement participatif du square de grenoble à Massy", "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.");


