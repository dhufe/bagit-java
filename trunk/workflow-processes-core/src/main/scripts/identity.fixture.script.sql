USE jbpm32;

TRUNCATE JBPM_ID_MEMBERSHIP;
TRUNCATE JBPM_ID_GROUP;
TRUNCATE JBPM_ID_USER; 

INSERT INTO JBPM_ID_GROUP VALUES(1,'G','ndnp-qr','organisation',NULL);
INSERT INTO JBPM_ID_GROUP VALUES(2,'G','ndnp-sysadmin','organisation',NULL);
INSERT INTO JBPM_ID_GROUP VALUES(3,'G','ndnp-participant','security-role',NULL);
INSERT INTO JBPM_ID_GROUP VALUES(4,'G','ndnp-administrator','security-role',NULL);
INSERT INTO JBPM_ID_USER VALUES(1,'U','ray','jlit@loc.gov','ray');
INSERT INTO JBPM_ID_USER VALUES(2,'U','myron','jlit@loc.gov','myron');
INSERT INTO JBPM_ID_USER VALUES(3,'U','scott','jlit@loc.gov','scott');
INSERT INTO JBPM_ID_USER VALUES(4,'U','brian','jlit@loc.gov','brian');
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(1,'M','ray','ndnp-participant',1,3);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(2,'M','ray','ndnp-qr',1,1);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(3,'M','myron','ndnp-participant',2,3);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(4,'M','myron','ndnp-qr',2,1);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(5,'M','scott','ndnp-sysadmin',3,2);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(6,'M','scott','ndnp-participant',3,3);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(7,'M','scott','ndnp-administrator',3,4);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(8,'M','brian','ndnp-sysadmin',4,2);
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(9,'M','brian','ndnp-participant',4,3);

INSERT INTO JBPM_ID_GROUP VALUES(5,'G','wdl-participant','security-role',NULL);
INSERT INTO JBPM_ID_USER VALUES(5,'U','dan','jlit@loc.gov','dan');
INSERT INTO JBPM_ID_MEMBERSHIP VALUES(10,'M','dan','wdl-participant',5,5);
