DROP DATABASE IF EXISTS rusch;
CREATE DATABASE rusch;

# NOTICE: only for development purpose
CREATE USER IF NOT EXISTS 'server'@'localhost';
GRANT ALL PRIVILEGES ON rusch.* To 'server'@'localhost' IDENTIFIED BY '123456';

USE rusch;

CREATE TABLE articles (
  id INT NOT NULL AUTO_INCREMENT,
  section varchar(64),
  title varchar(128),
  date varchar(64),
  client varchar(128),
  place varchar(128),
  type varchar(256),
  headerImage varchar(256),
  shortDescription varchar(1024),
  projectLink varchar(256),
  createdAt timestamp DEFAULT current_timestamp,
  hasStar varchar(64),
  tags varchar(512),
  content varchar(10024),
  partners varchar(512),
  isDraft varchar(64),
  PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE filters (
  id INT NOT NULL AUTO_INCREMENT,
  section varchar(64),
  filterTag varchar(64),
  createdAt timestamp DEFAULT current_timestamp,
  PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE equipe (
  id INT NOT NULL AUTO_INCREMENT,
  name varchar(128),
  image varchar(256),
  position varchar(128),
  createdAt timestamp DEFAULT current_timestamp,
  description varchar(1000),
  carreer varchar(2000),
  linkedIn varchar(128),
  PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE partenaires (
  id INT NOT NULL AUTO_INCREMENT,
  name varchar(256),
  shortDescription varchar(128),
  image varchar(256),
  createdAt timestamp DEFAULT current_timestamp,
  PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE user (
  id INT NOT NULL AUTO_INCREMENT,
  username varchar(128),
  password varchar(256),
  createdAt timestamp DEFAULT current_timestamp,
  PRIMARY KEY (id)
) ENGINE=INNODB;

INSERT INTO user (username, password)
  VALUES ("ADMIN", "admin");

INSERT INTO partenaires (name, shortDescription, image)
  VALUES ("Paris-Saclay", "This is our first Partner", "http://app.1984.agency/images/upload/apple.png");

INSERT INTO partenaires (name, shortDescription, image)
  VALUES ("Erigere", "This is our second Partner", "http://app.1984.agency/images/upload/apple.png");

INSERT INTO partenaires (name, shortDescription, image)
  VALUES ("Massy", "This is our third Partner", "http://app.1984.agency/images/upload/apple.png");    

INSERT INTO partenaires (name, shortDescription, image)
  VALUES ("Chien fou", "Ceci est un chien fou", "https://static.fjcdn.com/pictures/I+dis+nigga+luvs+crack+luvdacrack_68d69c_4714922.jpg");    

INSERT INTO equipe (name, image, position, description, carreer, linkedIn)
  VALUES ("Michael Schnell", 
    "http://static8.viadeo-static.com/sH9_QA8U0zqTScn2_FGcUaayUZI=/300x300/member/002254gb4lf7we29%3Fts%3D1457531105000",
    "Designer, expert en co-design et conception de projet",
    "Convaincu que les approches fondées sur l’expérience de l’utilisateur et sur l’innovation sociale ont des effets positifs pour les collectivités publiques, Michael fonde l’Atelier Rusch et codirige les activités de conseil pour la co-conception de projets pour le privé et les collectivités.",
    "Designer de formation (Strate - école de design), issu des beaux-arts, il travaille aux côtés de François Jégou (directeur scientifique de la 27e Région), au laboratoire d’innovation sociale Strategic Design Scenarios où il développe et applique in situ des outils de co-conception pour l’accompagnement des Agendas 21 de Bruxelles et de Molenbeek. Il diversifie ses collaborations chez Abria, cabinet de conseil en innovation de services où il intervient sur la scénarisation des parcours utilisateurs (SNCF, Cora, Croix Rouge). Suite au succès de son projet k.di lib, il fonde un collectif de designers qui réalisent des travaux de recherche en design de service. En 2014, il co-fonde l’Atelier Rusch et accompagne les collectivités et les entreprises dans la conception de projets innovants et la visualisation de processus complexes.",
    "www.linkedin.com"
  );

INSERT INTO equipe (name, image, position, description, carreer, linkedIn)
  VALUES ("Marie Demée", 
    "http://atelier-rusch.com/wp-content/uploads/2015/12/marie-Carr%C3%A9.jpg",
    "Urbaniste, experte en design appliqué aux territoires",
    "Dévouée aux questions de développement durable des territoires et au développement des processus de participation, elle est co-fondatrice de l’Atelier Rusch et accompagne les collectivités et entreprises dans la co-construction de projets avec les outils et méthodes issus du design.",
    "Diplômée de l’institut d’urbanisme de Paris et de Montréal, de l’Ecole de Management de Normandie et certifiée du programme I.D.E.A en Design Thinking, elle est consultante en Tourisme Responsable chez MaHoC, puis consultante en mobilité et développement durable au sein du groupe SOS aux côtés de Marc Fontanes (cofondateur de Mobility + et Wimoov) et Bertil De Fos (Directeur d’Auxilia conseil). Elle intègre ensuite Essonne Développement, où elle anime pendant deux ans une démarche multi-partenariale de développement économique, d’innovation sociale et territoriale entre intercommunalités. Depuis 2014, elle pilote, aux côtés de Michael Schnell, la mise en œuvre de projets participatifs territoriaux et multipartenariaux avec les méthodes du design.",
    "www.linkedin.com"
  );

INSERT INTO equipe (name, image, position, description, carreer, linkedIn)
  VALUES ("Leo Morales", 
    "https://media.licdn.com/dms/image/C5103AQH_QmKpdf7Q_g/profile-displayphoto-shrink_800_800/0?e=1537401600&v=beta&t=oQchYXuCfp0iqg--EnbuNBZn7K-BmhAkmAKFVVKx1wI",
    "Designer, spécialisé en innovation sociale",
    "Animé par l’idée que le design et ses méthodologies basées sur l’immersion et l’empathie sont des outils capables d’améliorer notre quotidien, Leo rejoint l’Atelier Rusch en mars 2018 pour accompagner la coconception de démarches innovantes.",
    "Diplômé à l’ESAD d’Orléans comme designer produit, il garde une vision pluridisciplinaire du design. Il travaille lui aussi avec François Jégou et son laboratoire d’innovation sociale, où des projets d’échelles locales comme européennes se côtoient. Il y développe un grand intérêt pour l’intégration de méthodologies de designer dans des domaines qui y sont étrangers. Après une phase d’exploration et d’expérimentation à la recherche de nouveaux territoires d’action, comme l’agriculture et les tiers lieux, il intègre l’Atelier Rusch et ses valeurs, pour donner plus de poids à la parole citoyenne, et accompagner les collectivités à innover pour améliorer leur quotidien.",
    "www.linkedin.com"
  );

INSERT INTO equipe (name, image, position, description, carreer, linkedIn)
  VALUES ("Aurore Guilbert", 
    "https://media-exp2.licdn.com/mpr/mpr/shrinknp_200_200/AAIAAQDGAAAAAQAAAAAAAA2WAAAAJDljMDFhMDliLTNmY2UtNDNlNy1hMTc3LWU3ZWM2MTdhOTJmMw.jpg",
    "Experte en management de l’innovation sociale et participation",
    "Diplômée de Sciences Po Lille en management de l’innovation sociale, Aurore souhaite mettre son énergie et ses compétences au service de l’impact social des organisations.",
    "Passionnée des enjeux d’accès aux services essentiels (eau et assainissement, énergie, collecte des déchets) pour les populations des quartiers informels ou à faibles revenus, elle débute sa vie professionnelle par un volontariat international en entreprise au Gabon, où elle accompagne un projet d’électrification sociale des quartiers périurbains, financé par l’Union Européenne. Après des missions d’analyse territoriale et de prospective sur les services urbains du Grand Paris, au sein d’un bureau d’études, Aurore rejoint la Direction du Développement Durable de SUEZ pour y conforter sa politique de dialogue avec les parties prenantes, d’acceptabilité sociale et ancrage local, et la déployer au sein des filiales françaises et internationales du Groupe, au travers de formations participatives et de missions de conseil sur le terrain. Elle collabore désormais avec l’Atelier Rusch, dont la philosophie et les activités lui apparaissent comme le prolongement de son engagement pour l’innovation sociale et le développement local, nourris du dialogue entre acteurs publics et privés, et de la participation des citoyens et usagers.",
    "www.linkedin.com"
  );

INSERT INTO filters (section, filterTag)
  VALUES ("lab", 
  	"Articles");

INSERT INTO filters (section, filterTag)
  VALUES ("lab", 
  	"Expérimentations");

INSERT INTO filters (section, filterTag)
  VALUES ("lab", 
  	"Interventions");

INSERT INTO filters (section, filterTag)
  VALUES ("projets", 
  	"Mobilité");

INSERT INTO filters (section, filterTag)
  VALUES ("projets", 
  	"Aménagements");

INSERT INTO filters (section, filterTag)
  VALUES ("projets", 
  	"Urbanisme");

INSERT INTO filters (section, filterTag)
  VALUES ("projets", 
  	"Services");

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Conception participative d’espace",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/04/5-Carte-Social-Strategic-Design-Scenarios.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Mobilité\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[\"Erigere\",\"Massy\"]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Atelier de co-construction Mobilité",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2018/06/Photo-6_1.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "1",
    "[\"Mobilité\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[\"Chien fou\"]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Chantier participatif",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2018/04/P1010220.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "1",
    "[\"Aménagements\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Massy : ce nouveau square a été construit avec les habitants",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/04/image-SIMPLON-pour-WIX.png",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Aménagements\",\"Urbanisme\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Le design, un processus de conception urbaine",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2015/02/150216-devoteam-RUSCH-design-visual.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "1",
    "[\"Services\",\"Urbanisme\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Une nouvelle année, un nouveau projet à Chartres",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/04/Raumlabor-Production-mobilier.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Urbanisme\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Le fablab,une nouvelle façon de fabriquer la ville",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/04/bellastock-qc-1-credit-photo-nicolas-bousseau.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Services\",\"Mobilité\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "projets",
    "Le Morvan veut innover dans la filière bois",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2018/07/Photo-2-bis-Cle%CC%81ment-ve%CC%81lo.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Services\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "La cité de l’innovation co-construite par ses futurs utilisateurs",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2018/06/Photo-2.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Articles\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "Accompagner le changement de comportement grâce au Design d’action publique",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/06/DSC2602.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "1",
    "[\"Articles\",\"Expérimentations\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "Allier business et design pour concevoir les services urbains de demain",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/03/IMG_8749.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Articles\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "Le scénario d’usage comme outil d’aide à la décision pour La Poste",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/01/KEdge-id%C3%A9ation-prototypage-3d-city-stream_MSchnell.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Expérimentations\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "K.di lib’ planche sur son business plan avec l’EM Normandie",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/12/DSC_0264.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "1",
    "[\"Expérimentations\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "RUSCH initie les jeunes designers de la KEdge au design de service",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/01/Toulon-sc%C3%A9nario-%C3%A9tudiants_MSchnell1.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Expérimentations\",\"Interventions\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "Wild Code School + RUSCH créent un lieu propice à la création, à l’innovation et à la production de savoir",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2015/11/1511-Le-Code-by-La-Poste-demarrer-4-01.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Interventions\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "L’article « À la découverte du design de services » sur URBANEWS",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2016/05/IMG_8916.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "1",
    "[\"Interventions\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );

  INSERT INTO articles (section, title, date, client, place, type, headerImage, shortDescription, projectLink, hasStar, tags, content, partners, isDraft)
    VALUES (
    "lab",
    "RUSCH participe à Bellastock Québec : festival d’architecture éphémère",
    "2018-07-17",
    "Client",
    "Lieu",
    "Type",
    "http://atelier-rusch.com/wp-content/uploads/2015/08/DSC08703.jpg",
    "Atelier participatif d'aménagement du square de Grenoble à Massy",
    "",
    "0",
    "[\"Interventions\",\"Articles\"]",
    "[{\"type\":\"h2\",\"value\":\"Conception participative\"},{\"type\":\"p\",\"value\":\"Lorem ipsum dolor amet pitchfork organic irony asymmetrical, occupy austin coloring book banh mi 3 wolf moon thundercats letterpress. Mustache af brooklyn try-hard palo santo, wolf tumeric. Glossier williamsburg yuccie meh slow-carb chia VHS cloud bread brunch lo-fi cardigan readymade sustainable microdosing. Sustainable live-edge kickstarter, vegan master cleanse tilde tote bag sartorial affogato. Ethical gastropub artisan tattooed, food truck letterpress trust fund.\"},{\"type\":\"blockquote\",\"value\":\"La créativité est contagieuse, faites la tourner !\"},{\"type\":\"imgs\",\"value\":\"http://atelier-rusch.com/wp-content/uploads/2018/04/Sce%CC%80nes-de-rues-Atelier-Rusch_rvb-copy.jpg\"}]",
    "[]",
    "0"
  );
