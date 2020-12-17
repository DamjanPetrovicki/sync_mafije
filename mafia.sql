USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_vagos', 'Vagosi', 1),
    ('society_automafija', 'Automafija', 1),
    ('society_pinkpanteri', 'Pinkpanteri', 1),
    ('society_zg80', 'ZG80', 1),
    ('society_crnogorci', 'Crnogorci', 1),
    ('society_cartel', 'Cartel', 1),
    ('society_gsf', 'Gsf', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_vagos', 'Vagosi', 1),
    ('society_automafija', 'Automafija', 1),
    ('society_pinkpanteri', 'Pinkpanteri', 1),
    ('society_zg80', 'ZG80', 1),
    ('society_crnogorci', 'Crnogorci', 1),
    ('society_cartel', 'Cartel', 1),
    ('society_gsf', 'Gsf', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_vagos', 'Vagosi', 1),
    ('society_automafija', 'Automafija', 1),
    ('society_pinkpanteri', 'Pinkpanteri', 1),
    ('society_zg80', 'ZG80', 1),
    ('society_crnogorci', 'Crnogorci', 1),
    ('society_cartel', 'Cartel', 1),
    ('society_gsf', 'Gsf', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
	('vagos', 'Vagosi', 1),
    ('automafija', 'Automafija', 1),
    ('pinkpanteri', 'Pinkpanteri', 1),
    ('zg80', 'ZG80', 1),
    ('crnogorci', 'Crnogorci', 1),
    ('cartel', 'Cartel', 1),
    ('gsf', 'Gsf', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	-- ('police',0,'recruit','Recrue',20,'{}','{}'),
	-- ('police',1,'officer','Officier',40,'{}','{}'),
	-- ('police',2,'sergeant','Sergent',60,'{}','{}'),
	-- ('police',3,'lieutenant','Lieutenant',85,'{}','{}'),
	-- ('police',4,'boss','Commandant',100,'{}','{}')
    -- boss zamjenik radnik novak
    ('vagos',1,'novak','Novak',2000,'{}','{}'),
	('vagos',2,'radnik','Radnik',2500,'{}','{}'),
	('vagos',3,'zamjenik','Zamjenik Šefa',3000,'{}','{}'),
    ('vagos',4,'boss','Šef',3500,'{}','{}'),

    ('automafija',1,'novak','Novak',2000,'{}','{}'),
	('automafija',2,'radnik','Radnik',2500,'{}','{}'),
	('automafija',3,'zamjenik','Zamjenik Šefa',3000,'{}','{}'),
    ('automafija',4,'boss','Šef',3500,'{}','{}'),

    ('pinkpanteri',1,'novak','Novak',2000,'{}','{}'),
	('pinkpanteri',2,'radnik','Radnik',2500,'{}','{}'),
	('pinkpanteri',3,'zamjenik','Zamjenik Šefa',3000,'{}','{}'),
    ('pinkpanteri',4,'boss','Šef',3500,'{}','{}'),

    ('zg80',1,'novak','Novak',2000,'{}','{}'),
	('zg80',2,'radnik','Radnik',2500,'{}','{}'),
	('zg80',3,'zamjenik','Zamjenik Šefa',3000,'{}','{}'),
    ('zg80',4,'boss','Šef',3500,'{}','{}'),

    ('crnogorci',1,'novak','Novak',2000,'{}','{}'),
	('crnogorci',2,'radnik','Radnik',2500,'{}','{}'),
	('crnogorci',3,'zamjenik','Zamjenik Šefa',3000,'{}','{}'),
    ('crnogorci',4,'boss','Šef',3500,'{}','{}'),

    ('cartel',1,'novak','Novak',2000,'{}','{}'),
	('cartel',2,'radnik','Radnik',2500,'{}','{}'),
	('cartel',3,'zamjenik','Zamjenik Šefa',3000,'{}','{}'),
    ('cartel',4,'boss','Šef',3500,'{}','{}'),

    ('gsf',1,'novak','Novak',2000,'{}','{}'),
	('gsf',2,'radnik','Radnik',2500,'{}','{}'),
	('gsf',3,'zamjenik','Zamjenik Šefa',3000,'{}','{}'),
    ('gsf',4,'boss','Šef',3500,'{}','{}')
;