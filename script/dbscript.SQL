DROP DATABASE IF EXISTS MLR2;

CREATE DATABASE IF NOT EXISTS MLR2;
USE MLR2;
# -----------------------------------------------------------------------------
#       TABLE : GERANTS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GERANTS
 (
   ID_GERANT BIGINT(4) NOT NULL  ,
   NOM_GERANT VARCHAR(128) NOT NULL  ,
   PRENOM_GERANT VARCHAR(128) NOT NULL  ,
   EMAIL_GERANT VARCHAR(128) NOT NULL  ,
   TELEPHONE_GERANT CHAR(32) NOT NULL  
   , PRIMARY KEY (ID_GERANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : RESERVATIONS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESERVATIONS
 (
   ID_RESERVATION BIGINT(4) NOT NULL  ,
   ID_CHAMBRE BIGINT(4) NOT NULL  ,
   ID_CLIENT BIGINT(4) NOT NULL  ,
   DATE_DEBUT_RESERVATION DATE NOT NULL  ,
   DATE_FIN_RESERVATION DATE NOT NULL  
   , PRIMARY KEY (ID_RESERVATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE RESERVATIONS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_RESERVATIONS_CHAMBRES
     ON RESERVATIONS (ID_CHAMBRE ASC);

CREATE  INDEX I_FK_RESERVATIONS_CLIENTS
     ON RESERVATIONS (ID_CLIENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : FACTURES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FACTURES
 (
   ID_FACTURE BIGINT(4) NOT NULL  ,
   ID_GERANT BIGINT(4) NOT NULL  ,
   ID_CLIENT BIGINT(4) NOT NULL  ,
   DATE_FACTURE DATE NOT NULL  ,
   MONTANT_FACTURE DECIMAL(13,2) NOT NULL  
   , PRIMARY KEY (ID_FACTURE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FACTURES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FACTURES_GERANTS
     ON FACTURES (ID_GERANT ASC);

CREATE  INDEX I_FK_FACTURES_CLIENTS
     ON FACTURES (ID_CLIENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : CHAMBRES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CHAMBRES
 (
   ID_CHAMBRE BIGINT(4) NOT NULL  ,
   ID_HOTEL BIGINT(4) NOT NULL  ,
   TYPE_CHAMBRE VARCHAR(128) NOT NULL  ,
   ETAT_CHAMBRE VARCHAR(128) NOT NULL  ,
   PRIX_CHAMBRE DECIMAL(13,2) NOT NULL  
   , PRIMARY KEY (ID_CHAMBRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CHAMBRES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CHAMBRES_HOTELS
     ON CHAMBRES (ID_HOTEL ASC);

# -----------------------------------------------------------------------------
#       TABLE : HOTELS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HOTELS
 (
   ID_HOTEL BIGINT(4) NOT NULL  ,
   NOM_HOTEL VARCHAR(128) NOT NULL  ,
   ADDRESSE_HOTEL VARCHAR(128) NOT NULL  ,
   EMAIL_HOTEL VARCHAR(128) NOT NULL  ,
   TELEPHONE_HOTEL VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_HOTEL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CLIENTS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENTS
 (
   ID_CLIENT BIGINT(4) NOT NULL  ,
   ID_CHAMBRE BIGINT(4) NOT NULL  ,
   NOM_CLIENT VARCHAR(128) NOT NULL  ,
   PRENOM_CLIENT VARCHAR(128) NOT NULL  ,
   EMAIL_CLIENT VARCHAR(128) NOT NULL  ,
   TELEPHONE_CLIENT VARCHAR(128) NOT NULL  
   , PRIMARY KEY (ID_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CLIENTS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CLIENTS_CHAMBRES
     ON CLIENTS (ID_CHAMBRE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE RESERVATIONS 
  ADD FOREIGN KEY FK_RESERVATIONS_CHAMBRES (ID_CHAMBRE)
      REFERENCES CHAMBRES (ID_CHAMBRE) ;


ALTER TABLE RESERVATIONS 
  ADD FOREIGN KEY FK_RESERVATIONS_CLIENTS (ID_CLIENT)
      REFERENCES CLIENTS (ID_CLIENT) ;


ALTER TABLE FACTURES 
  ADD FOREIGN KEY FK_FACTURES_GERANTS (ID_GERANT)
      REFERENCES GERANTS (ID_GERANT) ;


ALTER TABLE FACTURES 
  ADD FOREIGN KEY FK_FACTURES_CLIENTS (ID_CLIENT)
      REFERENCES CLIENTS (ID_CLIENT) ;


ALTER TABLE CHAMBRES 
  ADD FOREIGN KEY FK_CHAMBRES_HOTELS (ID_HOTEL)
      REFERENCES HOTELS (ID_HOTEL) ;


ALTER TABLE CLIENTS 
  ADD FOREIGN KEY FK_CLIENTS_CHAMBRES (ID_CHAMBRE)
      REFERENCES CHAMBRES (ID_CHAMBRE) ;

