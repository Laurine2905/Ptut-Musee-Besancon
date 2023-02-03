--             Generation d'une base de donnees 
-- -----------------------------------------------------------------------------
--      Nom de la base : Inventaire
--      Projet : Ptut Musée de l'anesthésie
--      Auteur :Laurine RAT
--      Date de derniere modification : 31/01/2023
-- -----------------------------------------------------------------------------
--\i C:/Users/lauri/OneDrive/Bureau/ISIS/FIE3/Ptut/BDD.sql;

DROP TABLE IF EXISTS CATEGORIE CASCADE;
DROP TABLE IF EXISTS OBJET CASCADE;
DROP TABLE IF EXISTS SALLE CASCADE;


-- -----------------------------------------------------------------------------
--       TABLE : CATEGORIE
-- -----------------------------------------------------------------------------

CREATE TABLE CATEGORIE 
(
  categorie_id SERIAL NOT NULL,
  Categorie_nom  varchar(1000) NOT NULL,
  Categorie_Description  varchar(1000) NULL,
  CONSTRAINT pk_categorie PRIMARY KEY (categorie_id)
);

-- -----------------------------------------------------------------------------
--       TABLE : SALLE
-- -----------------------------------------------------------------------------

CREATE TABLE SALLE
(
  Salle_id SERIAL,
  Salle_nom  varchar(1000) NOT NULL,
  CONSTRAINT PK_Salle PRIMARY KEY (Salle_id)
);

-- -----------------------------------------------------------------------------
--       TABLE : OBJET
-- -----------------------------------------------------------------------------

---- Createur a voir si on fait une table ou non
CREATE TABLE OBJET
(
  Objet_id SERIAL,
  Objet_nom  varchar(1000) NOT NULL,
  Date_creation date NULL,
  Createur  varchar(1000) NULL,
  Pays  varchar(1000) NULL,
  Objet_Description  varchar(1000) NULL,
  Nb_Possession integer NULL,
  categorie_id int,
  salle_id int,
  CONSTRAINT PK_Objet PRIMARY KEY (Objet_id),
  CONSTRAINT FK_CategorieObjet FOREIGN KEY (categorie_id) REFERENCES CATEGORIE(categorie_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT FK_Object_Salle FOREIGN KEY (salle_id) REFERENCES SALLE (Salle_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

-- Script d'ajout de données
-- revoir l'id auto généré
INSERT INTO CATEGORIE VALUES ('1','Appareils d anesthésie');
INSERT INTO CATEGORIE VALUES ('2','Ventilateur d anesthésie');
INSERT INTO CATEGORIE VALUES ('3', 'Ventilateur de réanimation', 'je suis une description');

INSERT into SALLE VALUES ('1', 'Salle 1');
-- Voir pour faire une requete SQL qui recupere l'id d'une catégorie ou d'une salle pour la clé étrangère

INSERT INTO OBJET VALUES ('1', 'Heidbrink', '1945/01/01', 'US Army', 'USA', 'Surplus de l US Army', '1', '1', '1' );
