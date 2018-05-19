create database myUC;
use myUC;
CREATE TABLE IF NOT EXISTS accessory(
    aid int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    description varchar(255),
    unitcost decimal(5,2),
    ttype varchar(255),
    PRIMARY KEY(aid)
);

CREATE TABLE IF NOT EXISTS trunktype(
    trunk_id INT NOT NULL AUTO_INCREMENT,
    trunk_name varchar(255),
    PRIMARY KEY(trunk_id)
);

/*CREATE TABLE IF NOT EXISTS mediant(
    mediantid INT NOT NULL AUTO_INCREMENT,
    name varchar(255),
    trunk_type JSON,
    num_trunks int,
    concurrent_user int,
    surviv_user int,
    unitcost decimal(10,2),
    supportcost decimal(10,2),
    PRIMARY KEY(mediantid)
);*/
CREATE TABLE IF NOT EXISTS handset (
    handid int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    description varchar(255),
    unitcost decimal(5,2),
    supportcost decimal(5,2),
    ttype varchar(255),
    PRIMARY KEY (handid)
);

CREATE TABLE IF NOT EXISTS mediapack(
    medid int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    description varchar(255),
    unitcost decimal(5,2),
    supportcost decimal(5,2),
    num_trunks int,
    trunk_id INT,
    num_analog int,
    PRIMARY KEY (medid)
);
ALTER TABLE mediapack ADD FOREIGN KEY (trunk_id) REFERENCES trunktype(trunk_id);

CREATE TABLE IF NOT EXISTS switches(
    part_num varchar(255),
    switch_name varchar(255),
    num_ports int,
    price decimal(5,2),
    description varchar(255),
    PRIMARY KEY(part_num)
);

CREATE TABLE IF NOT EXISTS phone_license
(
    lid int not null AUTO_INCREMENT,
    name varchar(255),
    description LONGTEXT,
    price decimal(10,2),
    PRIMARY KEY (lid)
    
);

SET default_storage_engine = INNODB;
/*CREATE TABLE IF NOT EXISTS mediant_software(
    sw_id INT NOT NULL AUTO_INCREMENT,
    mediantid INT,
    med_license JSON, 
    unitcost decimal(20,2),
    supportcost decimal(20,2),
    userlimit int,
    PRIMARY KEY(sw_id),
    FOREIGN KEY(mediantid) REFERENCES mediant(mediantid)
);
*/
CREATE TABLE IF NOT EXISTS customer
(
    custid int NOT NULL AUTO_INCREMENT,
    company_name LONGTEXT,
    location varchar(255),
    fob int,
    cif int,
    halsubtotal decimal(10,2),
    mrc decimal(10,2),
    capitalcost decimal(10,2),
    marginal decimal(10,2),
    total decimal(10,2),
    PRIMARY KEY (custid)
);
INSERT INTO trunktype(trunk_name) VALUES ("SIP");
INSERT INTO trunktype(trunk_name) VALUES ("ANALOG");
INSERT INTO trunktype(trunk_name) VALUES ("E1/T1");

INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("Polycom Plug and Play Camera","",102.61, "Handset");
INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("Polycom Expansion Module (Paper Based)","",83.52,"Handset");
INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("Polycom Expansion Module (Color)","",178.98,"Handset");
INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("Blackwire C315","USB Corded Monoaural Headset",56.16,"Headset");
INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("Blackwire C325","USB Corded Binaural Headset",60.17,"Headset");
INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("Blackwire 520","Over the head Corded USB headset, Binaural",80.23,"Headset");
INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("Blackwire 720","Over the head Corded USB headset, Binaural",120.35,"Headset");
INSERT INTO accessory (name, description, unitcost, ttype) VALUES ("HW261N","10' Coiled cable, QD to (2) 3. 5 MM  Stereo Jack plugs",97.87,"Headset");


INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("AudioCodes IP 405",47.11,2.67, "Regular");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom VVX 300",74.39,11.46, "Regular");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom VVX 310",105.12,11.46, "Regular");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom VVX 400",124.32,11.46, "Mid-Range");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom VVX 410",143.52,11.46, "Mid-Range");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom VVX 500",181.95,18.15, "Executive");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom VVX 600",229.92,18.15, "Executive");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom SoundStation IP 5000",287.52,11.46, "Conference");
INSERT INTO handset  (name, unitcost, supportcost, ttype) VALUES ("Polycom SoundStation IP 7000",684.72,11.46,"Conference");

INSERT INTO mediapack (name, unitcost, supportcost,num_trunks,num_analog) VALUES ("MediaPack 112 (2FXS)",131.51,21.81,0,2);
INSERT INTO mediapack (name, unitcost, supportcost,num_trunks,num_analog)  VALUES ("MediaPack 114 (4FXS)",255.48,41.23,0,4);
INSERT INTO mediapack (name, unitcost, supportcost,num_trunks,num_analog)  VALUES ("MediaPack 118 (8FXS)",455.35,73.34,0,8);
INSERT INTO mediapack (name, unitcost, supportcost,num_trunks,num_analog)  VALUES ("MediaPack 124 (24FXS)",998.67,101.22,0,24);
INSERT INTO mediapack (name, unitcost, supportcost,num_trunks, trunk_id ,num_analog)  VALUES ("MediaPack 114 (4FXO)",280.97,27.05,4,2,0);
INSERT INTO mediapack (name, unitcost, supportcost,num_trunks, trunk_id ,num_analog)  VALUES ("MediaPack 118 (8FXO)",497.06,74.92,8,2,0);
INSERT INTO mediapack (name, unitcost, supportcost,num_trunks, trunk_id ,num_analog)  VALUES ("MediaPack 114 (2FXS/2FXO)",267.49,41.71,2,2,0);
INSERT INTO mediapack (name, unitcost, supportcost,num_trunks, trunk_id,num_analog)  VALUES ("MediaPack 118 (4FXS/4FXO)",474.56,74.13,4,2,0);

/*INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 500",0,0,640.50,44.23);
INSERT INTO mediant (name, concurrent_user, surviv_user, unitcost, supportcost) VALUES ("Mediant 800",60,0,3971.74,625.41);
INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 800",30,0,3775.51,485.33);
INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 800",0,0,2524.13,205.44);
INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 1000",0,0,2712.64,371.04);
INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 1000",0,600,3527.27,365.67);
INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 1000",0,0,3686.09,504.19);
INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 1000",0,600,4570.97,532.77);
INSERT INTO mediant (name, concurrent_user, surviv_user,unitcost, supportcost) VALUES ("Mediant 1000",30,100,5984.38,662.79);*/

INSERT INTO switches(part_num,switch_name,num_ports,price,description) VALUES ("SG300-10MPP-K9-NA","Cisco SG300 - 10 ports",10,45.24,"Cisco SG300-10MPP 10-port Gigabit Max PoE+ Managed Switch");
INSERT INTO switches(part_num,switch_name,num_ports,price,description) VALUES ("SG300-28MP-K9-NA","Cisco SG300 - 28 ports",28,100.88,"Cisco SG300-28MP 28-port Gigabit Max-PoE Managed Switch");
INSERT INTO switches(part_num,switch_name,num_ports,price,description) VALUES ("SG300-52MP-K9-NA","Cisco SG300 - 52 ports",52,186.31,"Cisco SG 300-52MP 52-port Gigabit Max-PoE Managed Switch");
INSERT INTO switches(part_num,switch_name,num_ports,price,description) VALUES ("EX2200-C-12P-2G","Juniper EX2200 - 12 ports",12,83.84,"Juniper EX2200-C compact, fanless switch with 12-port 10/100/1000BaseT (12-ports PoE+) and 2 Dual-Purpose (10/100/1000BaseT or SFP) uplink ports (optics not included)");
INSERT INTO switches(part_num,switch_name,num_ports,price,description) VALUES ("EX2200-24P-4G","Juniper EX2200 - 24 ports",24,131.29,"Juniper EX 2200, 24-port 10/100/1000BaseT (24-ports PoE+) with 4 SFP uplink ports (optics not included)");
INSERT INTO switches(part_num,switch_name,num_ports,price,description) VALUES ("EX2200-48P-4G","Juniper EX2200 - 48 ports",48,215.85,"Juniper EX 2200, 48-port 10/100/1000BaseT (48-ports PoE+) with 4 SFP uplink ports (optics not included)");


INSERT INTO phone_license (name,description,price) VALUES ("Standard License(Analog phones)","Star Codes,Call Forwarding (all flavors),Last Number, Redial Voicemail,Automatic Recall Direct Inward Dialing,Calling Number Delivery Assume 9 Dialing,Calling Name Delivery Intercom Codes,Call Hold Short Codes,Attended Call Transfer Speed Dials,Three Way Calling Group Call Pickup,Call Waiting",5.95);
INSERT INTO phone_license (name,description,price) VALUES ("Standard License","Star Codes,Call Forwarding (all flavors),Last Number, Redial Voicemail,Automatic Recall Direct Inward Dialing,Calling Number Delivery Assume 9 Dialing,Calling Name Delivery Intercom Codes,Call Hold Short Codes,Attended Call Transfer Speed Dials,Three Way Calling Group Call Pickup,Call Waiting",7.95);
INSERT INTO phone_license (name,description,price) VALUES ("Business License","Star Codes, Busy Lamp Field with Call Pickup, Intercom Codes, Attended Call Transfer, Last Number Redial,Shared Line Appearance, Short Codes, Unattended Call Transfer, Automatic Recall, Intercom/Push To Talk, Speed Dials, Three Way Calling, Calling Number Delivery,Multiple Lines, Group Call Pickup, Call Waiting, Calling Name Delivery,CommPortal Communicator, SimRing,Call Forwarding (all flavors), Caller ID Delivery Blocking, Accession Communicator, ICM Income Call Manager, Voicemail, Call Hold, Direct Inward Dialing, Call Park, Assume 9 Dialing, Multiple Call Appearances",12.00);
INSERT INTO phone_license (name,description,price) VALUES ("Enterprise License","CommPortal Web Self Care, Call Park, Direct Inward Dialing, Attended Call Transfer, Star Codes, Busy Lamp Field with Call Pickup, Assume 9 Dialing, Unattended Call Transfer, Last Number Redial, Call Transfer Directly to Voicemail, Intercom Codes, Three Way Calling, Automatic Recall, Multiple Lines, Short Codes, Call Waiting, Automatic Callback, CommPortal Communicator, Speed Dials, Call Forwarding (all flavors), Calling Number Delivery, CommPortal  Assistant, Group Call Pickup, Voicemail, Calling Name Delivery, Accession Communicator, Do Not Disturb, Intercom/Push To Talk, Caller ID Delivery Blocking, Meet Me Conferencing (Personal Conf. Bridge), SimRing, Multiple Appearance Directory Numbers, Call Hold, Call Forking, ICM Income Call Manager, Shared Line Appearance, Multiple Call Appearances, Softphone",16.00);

/*INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services"]',247.04,27.17,5);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services"]',247.04,27.17,10);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services"]',247.04,27.17,25);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services"]',247.04,27.17,30);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services"]',247.04,27.17,100);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services"]',247.04,27.17,120);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services"]',247.04,27.17,250);

INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',279.3,28.84,5);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',477.75,53.79,10);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',845.25,86.66,20);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',1029.00,111.13,25);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',1212.75,140.70,30);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',1837.50,197.29,50);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',2168.25,238.87,60);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',3601.50,403.76,100);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',4299.75,511.14,120);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',6982.50,838.60,200);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services"]',8452.50,972.44,250);

INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (7,'["Quality of Service/Firewall services"]',314.05,34.55,5);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (7,'["Quality of Service/Firewall services"]',1154.44,126.99,25);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (7,'["Quality of Service/Firewall services"]',2401.24,264.14,60);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (7,'["Quality of Service/Firewall services"]',3991.15,439.03,100);

INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["WAN redundancy","Quality of Service/Firewall services - SIP Registration"]',87.84,9.66,50);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Quality of Service/Firewall services - SIP Registration"]',73.50,14.34,50);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (7,'["Quality of Service/Firewall services- SIP Registration"]', 165.09,18.16,100);

INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (1,'["Survivability"]',276.36,32.31,200);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (4,'["Survivability"]',276.36,28.28,200);
INSERT INTO mediant_software(mediantid,med_license,unitcost,supportcost,userlimit) VALUES (7,'["Survivability"]',367.50,38.19,600);*/

INSERT INTO trunktype(trunk_name) VALUES ("SIP");
INSERT INTO trunktype(trunk_name) VALUES ("ANALOG");
INSERT INTO trunktype(trunk_name) VALUES ("E1/T1");