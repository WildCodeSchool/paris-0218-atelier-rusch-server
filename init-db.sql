DROP DATABASE IF EXISTS rusch;
CREATE DATABASE rusch;

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
