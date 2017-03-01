/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  01/03/2017 16:32:20                      */
/*==============================================================*/


drop index ASSOCIATION_2_FK;

drop index ACHATS_PK;

drop table ACHATS;

drop index CATEGORIE_PK;

drop table CATEGORIE;

drop index ASSOCIATION_3_FK;

drop index PRODUITS_PK;

drop table PRODUITS;

drop index UTILISATEUR_PK;

drop table UTILISATEUR;

drop index ASSOCIATION_4_FK;

drop index VENTE_PK;

drop table VENTE;

/*==============================================================*/
/* Table : ACHATS                                               */
/*==============================================================*/
create table ACHATS (
   IDACHAT              SERIAL               not null,
   IDPRODUIT            INT4                 not null,
   QUANTITE             INT4                 null,
   PRIXUN               DECIMAL              null,
   DATEACHAT            DATE                 null,
   constraint PK_ACHATS primary key (IDACHAT)
);

/*==============================================================*/
/* Index : ACHATS_PK                                            */
/*==============================================================*/
create unique index ACHATS_PK on ACHATS (
IDACHAT
);

/*==============================================================*/
/* Index : ASSOCIATION_2_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_2_FK on ACHATS (
IDPRODUIT
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE (
   IDCAT                SERIAL               not null,
   DESIGNATION          VARCHAR(200)         null,
   constraint PK_CATEGORIE primary key (IDCAT)
);

/*==============================================================*/
/* Index : CATEGORIE_PK                                         */
/*==============================================================*/
create unique index CATEGORIE_PK on CATEGORIE (
IDCAT
);

/*==============================================================*/
/* Table : PRODUITS                                             */
/*==============================================================*/
create table PRODUITS (
   IDPRODUIT            SERIAL               not null,
   IDCAT                INT4                 null,
   NOMPRODUIT           VARCHAR(200)         null,
   REFERENCE            VARCHAR(200)         null,
   PRIX                 DECIMAL              null,
   constraint PK_PRODUITS primary key (IDPRODUIT)
);

/*==============================================================*/
/* Index : PRODUITS_PK                                          */
/*==============================================================*/
create unique index PRODUITS_PK on PRODUITS (
IDPRODUIT
);

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_3_FK on PRODUITS (
IDCAT
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR (
   IDUTILISATEUR        SERIAL               not null,
   NOM                  VARCHAR(200)         null,
   PRENOM               VARCHAR(200)         null,
   MOTDEPASSE           VARCHAR(200)         null,
   constraint PK_UTILISATEUR primary key (IDUTILISATEUR)
);

/*==============================================================*/
/* Index : UTILISATEUR_PK                                       */
/*==============================================================*/
create unique index UTILISATEUR_PK on UTILISATEUR (
IDUTILISATEUR
);

/*==============================================================*/
/* Table : VENTE                                                */
/*==============================================================*/
create table VENTE (
   IDVENTE              SERIAL               not null,
   IDPRODUIT            INT4                 not null,
   QUANTITE             INT4                 null,
   PRIXUNITAIRE         DECIMAL              null,
   DATEVENTE            DATE                 null,
   constraint PK_VENTE primary key (IDVENTE)
);

/*==============================================================*/
/* Index : VENTE_PK                                             */
/*==============================================================*/
create unique index VENTE_PK on VENTE (
IDVENTE
);

/*==============================================================*/
/* Index : ASSOCIATION_4_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_4_FK on VENTE (
IDPRODUIT
);

alter table ACHATS
   add constraint FK_ACHATS_ASSOCIATI_PRODUITS foreign key (IDPRODUIT)
      references PRODUITS (IDPRODUIT)
      on delete restrict on update restrict;

alter table PRODUITS
   add constraint FK_PRODUITS_ASSOCIATI_CATEGORI foreign key (IDCAT)
      references CATEGORIE (IDCAT)
      on delete restrict on update restrict;

alter table VENTE
   add constraint FK_VENTE_ASSOCIATI_PRODUITS foreign key (IDPRODUIT)
      references PRODUITS (IDPRODUIT)
      on delete restrict on update restrict;

