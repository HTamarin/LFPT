-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: supereuro
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_stats`
--

DROP TABLE IF EXISTS `game_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL,
  `id_question` int NOT NULL,
  `answer` varchar(50) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_stats`
--

LOCK TABLES `game_stats` WRITE;
/*!40000 ALTER TABLE `game_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_theme` int NOT NULL,
  `difficulty` int NOT NULL,
  `question` varchar(255 DEFAULT NULL,
  `image` varchar(255)  DEFAULT NULL,
  `value` bigint DEFAULT NULL,
  `texteR1` varchar(50)  DEFAULT NULL,
  `texteR2` varchar(50)  DEFAULT NULL,
  `texteR3` varchar(50)  DEFAULT NULL,
  `correct_answer` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_question_theme` (`id_theme`),
  CONSTRAINT `FK_question_theme` FOREIGN KEY (`id_theme`) REFERENCES `theme` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,1,'Le mot « cash » désigne ?',NULL,1,'Des pièces et des billets','Un chanteur','Une cachette',1),(2,1,1,'Que signifie « time is money » en anglais ?',NULL,1,'Le temps c’est de l’argent','Le temps manque d’argent','L’avenir manque de temps',1),(3,1,1,'Comment dit-on « payer » en anglais ? ',NULL,1,'To pray','To pay','To say',2),(4,1,1,'Comment dit-on « acheter » en anglais ?',NULL,1,'To buy','To try','Shopping',1),(5,1,1,'Comment dit-on « impôt » en anglais ?',NULL,1,'Trade','Rate','Tax',3),(6,1,1,'Comment dit-on « rabais » en anglais ?',NULL,1,'Discount','Loss','More',1),(7,1,1,'Que signifie « coin » ?',NULL,1,'Canard','Recoin','Pièce de monnaie',3),(8,1,1,'Comment dit-on « or » en anglais ?',NULL,1,'Silver','Gold','Copper',2),(9,1,1,'Comment dit-on « gagner » en anglais ?',NULL,1,'To add','To win','To grow',2),(10,1,1,'Que signifie « half » ?',NULL,1,'Tiers provisionnel','Moitié','Veau d\'or',2),(11,1,1,'Que signifie « cheap » ?',NULL,1,'Une pomme de terre frite','Un mouton','Pas cher',3),(12,1,1,'Que signifie « expensive » ?',NULL,1,'Parlant beaucoup','Qui se dilate','Cher',3),(13,1,1,'Que signifie « enough » ?',NULL,1,'Encore','Trop','Assez',3),(14,1,1,'Que signifie \"businessman\" ?',NULL,1,'Homme d\'affaires','Homme pressé','Personne qui vend des contrefaçons',1),(15,1,1,'Que signifie « banker » ?',NULL,1,'Un banquier','Un banc','Une banque',1),(16,1,2,'En finance, le mot « account »  désigne ?',NULL,2,'Un compte','Une histoire fantastique','Un titre de noblesse',1),(17,1,2,'Le mot « note» est utilisé pour désigner ?',NULL,2,'Un banquier','Un billet','Une carte bancaire',2),(18,1,2,'Que signifie « to purchase » ?',NULL,2,'Acheter','Pourchasser','Vendre',1),(19,1,2,'Comment dit-on « carte bancaire » en anglais ?',NULL,2,'Green card','Bank card','Cash card',2),(20,1,2,'Que signifie « sales » sur une vitrine ?',NULL,2,'Soldes','A laver','Grande terrasse à l\'arrière',1),(21,1,2,'Comment dit-on « la Bourse » en anglais ?',NULL,2,'Stock Exchange','Stonehenge','Borough Market',1),(22,1,2,'Que signifie «trader » ?',NULL,2,'Un vagabond','Un caissier','Un opérateur sur les marchés financiers',3),(23,1,2,'Que signifie « tip » ?',NULL,2,'Pourboire','Mannequin','Robinet',1),(24,1,2,'Comment dit-on « perte » en anglais ?',NULL,2,'Hole','Loss','Hide',2),(25,1,2,'Comment se nomme la monnaie anglaise ?',NULL,2,'Lettuce','Pound','Inch',2),(26,1,2,'Comment dit-on « cinq cent vingt trois » en anglais ?',NULL,2,'Seven hundred and eighty nine','Five hundred and twenty three','Four thousand and thirty two',2),(27,1,2,'Comment dit-on \"sans taxes\" ?',NULL,2,'Bargain','Duty-free','Cashless',2),(28,1,3,'Que signifie « saving money »?',NULL,3,'Sauver quelqu’un','Épargner de l’argent','Trouver de l’argent',2),(29,1,3,'Que signifie « loan » ?',NULL,3,'Un prêt','Un porte-monnaie','Un logement',1),(30,1,3,'Que signifie « expenses » ?',NULL,3,'Espèces','Dépenses','Achat',2),(31,1,3,'Que signifie « rate » ?',NULL,3,'Rate','Taux','Manquer',2),(32,1,3,'Que signifie « gap » ?',NULL,3,'Casquette','Gaz de schiste','Ecart',3),(33,1,3,'Que signifie « bid » ?',NULL,3,'Echec, raté','Enchère, offre','Oiseau',2),(34,1,3,'Comment dit-on « financement participatif » en anglais ?',NULL,3,'Merger','Crowdfunding','Commonwealth',2),(35,1,3,'Comment dit-on « virement » en anglais ?',NULL,3,'Debit','Turnround','Transfer',3),(36,1,3,'A Londres, qu\'est-ce qu\'un  « ATM » ?',NULL,3,'La monnaie galloise','Un placement sûr','Un distributeur de billets',3),(37,1,3,'Que signifie « fees » ?',NULL,3,'Les frais ','Les glaces','Les fées',1),(38,1,3,'Comment dit-on « un montant en chiffres » en anglais ?',NULL,3,'Amount in full','Amount in figures','Amount in code',2),(39,1,3,'Que signifie «customs » ?',NULL,3,'La douane','Les habits','La corpulence',1),(40,1,3,'Comment dit-on « tirelire » en anglais ?',NULL,3,'Sparing bank','Piggy bank','Saving bank',2),(41,1,3,'Comment dit-on « spéculer / parier » en anglais ?',NULL,3,'To paddle','To gamble','To ramble',2),(42,1,3,'Que signifie « bank clerk » ?',NULL,3,'Un(e) employé(e) de banque','Une personne dont la banque a clôturé le compte','Un chinchilla',1),(43,1,3,'Comment dit-on « retirer de l\'argent » en anglais ?',NULL,3,'To keep the change','To withdraw money','To change money',2),(44,2,1,'Parmi ces éléments, lequel est une dépense ?',NULL,1,'L\'argent reçu pour un anniversaire','L\'argent de poche','L\'achat d’un pantalon',3),(45,2,1,'Qu’est-ce qu’un virement ?',NULL,1,'Un transfert d’argent d’un compte à un autre','Un licenciement','Un demi-tour',1),(46,2,1,'Qu’est-ce qu’un Livret A ?',NULL,1,'Un prêt d’argent','Un produit d’épargne','Un livre sur l\'argent',2),(47,2,1,'Une carte bancaire est ?',NULL,1,'Un moyen de paiement','Un moyen de transport','Un moyen de pression',1),(48,2,1,'Quelle est la monnaie des États-Unis ? ',NULL,1,'Le dollar','L\'euro','La livre',1),(49,2,1,'Un distributeur automatique permet de ?',NULL,1,'Retirer de l’argent sous forme de billets','Payer ses impôts','Faire un don',1),(50,2,1,'Qu\'est-ce que le yen ?',NULL,1,'Un animal africain','Un jeu de dés','La monnaie du Japon',3),(51,2,1,'Être à découvert signifie ?',NULL,1,'Avoir vendu ses vêtements','Avoir dépensé plus d’argent qu’on n’en possède','S’être fait prendre à voler de l’argent',2),(52,2,2,'Une somme d’argent empruntée est  ?',NULL,2,'Une dette','Un intérêt','Un don',1),(53,2,2,'La Banque de France est ?',NULL,2,'La banque de l’équipe de France','La banque centrale française','La banque des présidents français',2),(54,2,2,'La Bourse est ?',NULL,2,'Un porte-monnaie','Un lieu d’échanges de produits financiers','Un porte-bonheur',2),(55,2,2,'Le patrimoine désigne ?',NULL,2,'La patrie des moines tibétains','Les biens détenus par l’État','L’ensemble des biens d’une personne',3),(56,2,2,'La monnaie utilisée dans un autre pays est appelée ?',NULL,2,'Un slogan','Un jingle','Une devise',3),(57,2,2,'Qu\'est ce que le rouble ?',NULL,2,'Une personne rusée','La monnaie russe','Une multiplication par 1,5',2),(59,2,2,'En matière monétaire, qu\'est-ce qu\'un napoléon ?',NULL,2,'Un faux monnayeur','Le libellé du 1er billet de banque','Une pièce en or',3),(60,2,2,'Que fait un usurier ?',NULL,2,'Un prêteur à un taux exagéré','Un testeur de produits','Un forgeron au XVIème siècle',1),(61,2,2,'Un financier est un gâteau mais aussi ?',NULL,2,'Un bateau','Un artificier dans l\'armée','Un professionnel de la Bourse',3),(62,2,2,'Qu\'est-ce que Wall-Street ?',NULL,2,'La rue de la mode à New-York','La Bourse américaine','Le surnom de l\'ex-mur de Berlin',2),(63,2,2,'Un relevé de compte c\'est ?',NULL,2,'Le résumé de mes opérations bancaires','Le document indiquant mes coordonnées bancaires','Un document à fournir aux impôts',1),(64,2,2,'En finance, acheter une action c\'est  ?',NULL,2,'Réparer une erreur comptable','Acheter une part de la dette de l\'Etat','Investir dans le capital d\'une entreprise',3),(65,2,2,'En finance, acheter une obligation, c\'est ?',NULL,2,'Payer un salaire','Acheter une part de dette','Effectuer des virements réguliers',2),(66,2,2,'Que veut dire faire opposition ?',NULL,2,'Refuser une ouverture de compte','Répondre par courrier recommandé','Demander à sa banque le blocage de sa carte',3),(67,2,2,'A quel âge peut on ouvrir un Livret Jeune ?',NULL,2,'16 ans','12 ans','18 ans',2),(69,2,2,'Un placement disponible peut ?',NULL,2,'Être souscrit les jours ouvrés','Être retiré et utilisé quand on veut','Être consulté sans code confidentiel',2),(70,2,2,'Un compte rémunéré... ?',NULL,2,'Rapporte des intérêts','Est libellé en devise étrangère','Est une forme de crédit',1),(72,2,2,'Le « phishing » est une fraude …?',NULL,2,'Pour obtenir vos données personnelles','Pour pêcher dans des eaux interdites','Pour maquiller son CV',1),(73,2,2,'C\'est quoi un indice boursier ?',NULL,2,'La preuve d\'un délit d\'initié','Un indicateur de performance','Une information pour un épargnant',2),(74,2,2,'Que faut-il faire avec sa carte bancaire ?',NULL,2,'La prêter à son meilleur ami','Apprendre son code par cœur','Ecrire le code pour ne pas l\'oublier',2),(75,2,2,'Le découvert bancaire c’est … ?',NULL,2,'Un bonus pour les clients fidèles','Un droit pour les moins de 18 ans','Une forme de crédit',3),(77,2,2,'A partir de quel âge peut-on ouvrir un Livret A ?',NULL,2,'Dès la naissance ','12 ans ','18 ans',1),(78,2,2,'Le paiement sans contact chez un commerçant est possible jusqu\'à ?',NULL,2,'150','Sans limite','50',3),(79,2,2,'Qu\'est ce qu\'un créancier ? ',NULL,2,'Une personne à qui je dois de l\'argent','Un faux monnayeur','Une personne qui me doit de l\'argent',1),(80,2,2,'Qu\'est ce qu\'un débiteur ?',NULL,2,'Une personne à qui je dois de l\'argent ','Un distributeur de billets ','Une personne qui me doit de l\'argent',3),(81,2,2,'Qu\'est-ce que le solde bancaire ?',NULL,2,'Un compte sans frais ni commission ','La différence entre épargne et crédit','La différence entre ressources et dépenses',3),(82,2,2,'Qu\'est-ce qu\'un taux de change ?',NULL,2,'Le prix d\'une monnaie dans une autre','Le taux d\'évolution du chômage','La variation des prix dans le temps',1),(83,2,2,'Comment commence l\'adresse d\'un site sécurisé pour les paiements en ligne ?',NULL,2,'https','www.secure system','secure.http',1),(84,2,2,'Que signifie le sigle RIB ? ',NULL,2,'Relevé informatique bancaire','Relevé d\'Information Bancaire','Relevé d\'Identité Bancaire',3),(85,2,2,'Je loue un appartement, je dois l\'assurer ?',NULL,2,'Oui','Non',NULL,1),(86,2,2,'Comment s\'appellent les revenus tirés d\'une action  ?',NULL,2,'Les dividendes','Les intérêts','Les bonus',1),(87,2,2,'Un délit d\'initié, c\'est  acheter des titres ?',NULL,2,'A la hausse','A la baisse','A partir d\'une information secrète',3),(88,2,2,'Que signifie le sigle ISR  ?',NULL,2,'Investissement super rentable','Investissement socialement responsable','Information sur les revenus',2),(89,2,3,'Quand a été créée la Banque de France ?',NULL,3,'1800','1870','1945',1),(90,2,3,'Que sont les agios ?',NULL,3,'Des pièces de monnaie espagnoles','Des frais bancaires','Des légumes',2),(91,2,3,'Qu’est-ce qu’un pécule ? ',NULL,3,'Une somme d’argent économisée','Un jeu de boules','Un récipient',1),(92,2,3,'En finance, que veut dire le sigle OPA ?',NULL,3,'Opération par apport','Offre publique d\'achat','Ouverture par anticipation',2),(93,2,3,'Qui a inventé la carte à mémoire ?',NULL,3,'Roland Moréno','IBM','APPLE',1),(94,2,3,'C\'est quoi l\'échéance d\'un prêt ?',NULL,3,'Le montant total','Le taux d\'intérêt assurance comprise','La date de fin de remboursement',3),(96,2,3,'Le montant des intérêts d\'un livret d\'épargne c\'est ?',NULL,3,'Le gain annuel de l\'argent déposé','Les frais perçus par la banque ','La somme maximale que l\'on peut déposer',1),(97,2,3,'Le safran est aussi cher que ?',NULL,3,'La truffe','La mandragore','L\'or',3),(99,2,3,'Se porter caution c\'est ?',NULL,3,'Le considérer comme un ami','S\'engager à payer ses dettes','Prendre une position en Bourse',2),(100,2,3,'Quelle est la durée de validité d\'un chèque ?',NULL,3,'1 an et 8 jours','1 mois et 8 jours','8 jours',1),(104,2,3,'Quel établissement assure des missions d\'intérêt général ?',NULL,3,'La Caisse des Dépôts et Consignations','La Caisse Générale du Commerce et de l\'Industrie','La Banque Générale',1),(105,2,3,'Qu\'est il interdit de placer dans une coffre-fort ?',NULL,3,'Des denrées alimentaires périssables','Des bijoux','Des billets de banque',1),(106,2,3,'Dans l\'assurance, lors d\'un sinistre (feu, accident…) la franchise c\'est ?',NULL,3,'Ce qui reste à la charge de l\'assureur','Ce qui est remboursé par l\'assureur','Ce qui reste à la charge de l\'assuré',3),(107,2,3,'Le taux d\'un prêt à taux variable varie en fonction ?',NULL,3,'Du remboursement déjà effectué','Du montant restant à rembourser','De la variation des marchés financiers',3),(108,2,3,'En finance, que veut dire faire défaut ?',NULL,3,'Créer de la fausse monnaie','Ne pas rembourser son crédit','Signer des chèques en bois',2),(109,2,3,'Pièces et billets, c\'est la monnaie fiduciaire. Les comptes bancaires c\'est ?',NULL,3,'La monnaie bancaire','La monnaie scripturale','La masse monétaire',2),(110,2,3,'L\'assurance d\'une automobile ou d\'une moto est obligatoire ? ',NULL,3,'Non','Oui',NULL,2),(111,3,1,'La valeur d\'un billet de 20 € est inférieure à ?',NULL,1,'30 pièces de 50 cts','17 pièces de 1 €','11 pièces de 2 €',3),(112,3,1,'J\'ai 1 billet de 20 € et 12 pièces de 50 cts soit ?',NULL,1,'26','28','32',1),(113,3,1,'100 € équivalent à ?',NULL,1,'1 billet de 50 € et 30 pièces de 2 €','4 billets de 20 € et 3 billets de 5 €','4 billets de 20 € et 20 pièces de 1 euro',3),(114,3,1,'J’ai 20 pièces de 5 cts, 10 de 50 cts et une de 1 euro, soit ?',NULL,1,'5','7','16',2),(115,3,1,'Si j’achète 3 pains à 1,60 € chacun, cela me coûte ?',NULL,1,'3,8','4, 80 €','5,2',2),(116,3,1,'3 kilos de fraises coûtent 6,90 €. Un kilo coûte ?',NULL,1,'2,3','3,2','3,3',1),(117,3,1,'Mon menu coûte 20 €. J’ai 4 billets de 10 €, donc j’en utilise ?',NULL,1,'1','2','3',2),(118,3,1,'Je prête 30 € à un ami. Il me rend 20 €, il me doit encore ?',NULL,1,'20','10','15',2),(119,3,1,'J’ai gagné 417 € mais ai dépensé 205 €. Il me reste ?',NULL,1,'212','112','12',1),(120,3,1,'Isa gagnait 1000 € par mois. Depuis, elle gagne 2000 €, soit ?',NULL,1,'Autant qu’avant','2 fois moins qu’avant','2 fois plus qu’avant',3),(121,3,1,'100 € donneront 102 € dans un an. 300 € donneront dans un an ?',NULL,1,'102','306','300',2),(122,3,1,'Un billet de 10 € vaut plus que ?',NULL,1,'4 pièces de 2 €','11 pièces de 1 €','22 pièces de 50 cts',1),(123,3,1,'La monnaie étrangère vaut 0,1 €. Je change 100 €. Je reçois… ?',NULL,1,'110 unités','10 unités','1000 unités',3),(124,3,2,'Combien coûte un vêtement de 90 € soldé à 30 % ?',NULL,2,'63','60','27',1),(126,3,2,'Ma banque rémunère mes 100 € à 2,5 % et me prend 1 € de frais. A la fin de l\'année j\'ai ?',NULL,2,'101,5','102,5','103,5',1),(127,3,2,'Un achat de 50 € avec un rabais de 20 % mis dans un sac qui coute 5 € me revient à ?',NULL,2,'45','44','40',1),(128,3,2,'Vaut-il mieux placer sur un an  ?',NULL,2,'100 € à 4 %','500 € à 0,8 %','Je gagne la même somme',3),(129,3,2,'Vous achetez une livre de bonbons à 12,80 € le kilo. Vous payez ? ',NULL,2,'12,8','6,4','6,8',2),(130,3,2,'Votre achat de 350 € est exonéré de TVA à 20 %. Sinon, vous l\'auriez payé ?',NULL,2,'400','420','280',2),(131,3,2,'Vous placez sur 1 an 250 € au taux de 2 %, vous disposez en fin d\'année de... ?',NULL,2,'252','500','255',3),(132,3,2,'J\'achète 6 pommes à 40 cts l\'une et 5 poires à 50 cts l\'une. Combien je paie ?',NULL,2,'4,9','49','5',1),(133,3,2,'Payé 12 € de l\'heure, le salaire d\'une journée de 7 h et 15 mn est ?',NULL,2,'87','85,8','84',1),(134,3,2,'Vous prêtez 220 € et on vous en rend 231 un an plus tard. Quel est le taux d\'intérêt ?',NULL,2,'0,11','0,05','0,1',2),(135,3,2,'Un lingot de 1kg contient 99,5 % d\'or pur, soit ? ',NULL,2,'995 g d\'or','1005 g d\'or','1000 g d\'or',1),(136,3,2,'J’ai 55,70 € et je dépense 14,90 €, il me reste ?',NULL,2,'40,8','30,8','40,9',1),(137,3,3,'J\'ai un exemplaire de chaque billet, soit ?',NULL,3,'675','780','885',3),(138,3,3,'Un milliardaire possède au moins ?',NULL,3,'1 T€','1 G€','1 M€',2),(139,3,3,'Si on gagne 1 fois sur 4 au casino et qu\'on joue 100 €, que va-t-il arriver ?',NULL,3,'On gagne 25 €','On ne sait pas, c\'est un jeu de hasard','On perd 100 €',2),(140,3,3,'L\'épaisseur de la pièce de 2 € est de 2,2 mm. Un tas de 240 € est haut de  ?',NULL,3,'26,4 cm','52,8 cm','48,0 cm',1),(141,3,3,'Un carat équivaut à 0,2 g. Et 5,4 carats ?',NULL,3,'10,8 g','10,8 dg','10,8 cg',2),(142,3,3,'J\'ai perdu 20 %. Combien gagner pour revenir à ma somme initiale ?',NULL,3,'0,15','0,2','0,25',3),(143,3,3,'J\'achète un ordinateur à 650 €. Je verse 200 € à l\'achat et paie pendant dix mois ?',NULL,3,'65 € / mois','45 € / mois','25 € / mois',2),(144,3,3,'Si j\'ai un exemplaire de chaque pièce en euro, combien ai-je d\'euros ?',NULL,3,'4,21','10','3,88',3),(145,4,1,'Que signifie le sigle CDD ?',NULL,1,'Contrat à durée déterminée','Convention de défiscalisation directe','Concentration des dividendes distribués',1),(148,4,1,'Quand on est en télétravail, on travaille ?',NULL,1,'Pour une chaîne de télévision','Dans la sphère Internet','Temporairement à son domicile',3),(150,4,1,'Que signifie le sigle PME ?',NULL,1,'Prix moyen de l\'énergie','Paiement en monnaie électronique','Petites et moyennes entreprises',3),(151,4,1,'Le bail est ?',NULL,1,'Un contrat d\'achat de machine outil','Un contrat de longue durée','Un contrat de location',3),(153,4,1,'Qu\'est ce que le pouvoir d\'achat ?',NULL,1,'Ce que je peux m\'offrir avec mes revenus','Le plafond de ma carte bancaire','Corrompre un fonctionnaire',1),(156,4,1,'Une dépense contrainte est  ? ',NULL,1,'Obligatoire','Minimale','Impulsive',1),(157,4,1,'L\'achat d\'un nouveau smartphone est une charge… ?',NULL,1,'Exceptionnelle','Contrainte','Courante',1),(158,4,1,'20 € gagnés avec un babysitting, c\'est ?',NULL,1,'Un don','Une dépense','Une ressource',3),(159,4,1,'200 € payés pour un nouveau smartphone, c\'est ?',NULL,1,'Une spéculation','Une dépense','Une ressource',2),(160,4,2,'Une importation, c\'est un bien ou un service acheté à l\'étranger ?',NULL,2,'Oui','Non',NULL,1),(161,4,2,'Une exportation, c\'est un bien ou un service vendu à l\'étranger ?',NULL,2,'Non','Oui',NULL,2),(162,4,2,'Qu\'est-ce que l\'inflation ?',NULL,2,'La hausse de la Bourse','La hausse généralisée des prix','La hausse des taux de rémunération de l\'épargne',2),(163,4,2,'Que signifie le sigle TVA ?',NULL,2,'Taxe à la valeur ajoutée','Taux variable ajusté','Taux en valeurs actualisées',1),(165,4,2,'Que signifie le sigle PIB ?',NULL,2,'Production industrielle brute','Performance individuelle brute','Produit intérieur brut',3),(166,4,2,'Qui a écrit \"Le capital\" ?',NULL,2,'Karl Marx','Nostradamus','Bill Gates',1),(167,4,2,'Qu\'est-ce qu\'un monopole ?',NULL,2,'Beaucoup d\'offreurs pour un seul acheteur','Un seul offreur pour beaucoup d\'acheteurs','Beaucoup d\'offreurs pour beaucoup d\'acheteurs',2),(168,4,2,'Qu\'appelle-t-on vente aux enchères ?',NULL,2,'Vente sans intermédiaire','Vente à celui qui offre le prix le plus élevé','Vente sur Internet',2),(171,4,2,'L\'épargne de précaution... ?',NULL,2,'Ne produit pas d\'intérêts','Est placée en vue de la retraite','Est disponible au cas où…',3),(172,4,2,'Qu\'est ce qui n\'est pas une ressource fixe ?',NULL,2,'Le salaire','La vente d\'un meuble dans une brocante','Les intérêts d\'un livret A',2),(173,4,2,'Qu\'est-ce qui ne permet pas de réduire ses dépenses ?',NULL,2,'Acheter en soldes','Acheter les objets vantés par la publicité','Vendre les objets inutilisés dans une brocante',2),(174,4,3,'Le secteur de l\'agriculture, de la pêche et de la forêt est le secteur ?',NULL,3,'Secondaire','Tertiaire','Primaire',3),(176,4,3,'Quelles activités ne font pas partie du secteur tertiaire ?',NULL,3,'L\'hôtellerie et la restauration','L\'aéronautique et la construction navale','La communication et l\'information',2),(177,4,3,'Le mécénat, c\'est quoi ?',NULL,3,'Investissement dans l\'agriculture','Soutien financier sans contrepartie','Réhabilitation des personnes condamnées à tort',2),(179,4,3,'Une association à but non lucratif... ?',NULL,3,'Ne distribue pas de bénéfices à ses membres','N\'achète pas de produits de luxe','N\'a pas de salariés',1),(181,4,3,'Que veut dire salaire net ?',NULL,3,'Sans les cotisations sociales','Pas touché au \"black\"','Annuel, primes incluses',1),(183,4,3,'Le commerce équitable permet de ?',NULL,3,'Rémunérer correctement les producteurs','Taxer les gros pollueurs','Eviter l\'abattoir aux chevaux âgés',1),(184,4,3,'Quel type de formation permet d\'avoir un salaire ?',NULL,3,'L\'apprentissage','Les classes préparatoires','L\'année sabbatique',1),(185,5,1,'Sur la face française des pièces de 1 et 2 €, il y a :',NULL,1,'Un arbre',' L’arc de Triomphe','La tour Eiffel',1),(186,5,1,'Avant l\'euro, la monnaie française était ?',NULL,1,'L\'écu','Le franc','Le louis d\'or',2),(187,5,1,'Lequel de ces pays n’utilise pas l’euro ?',NULL,1,'L’Allemagne','La Suisse','L\'Espagne',2),(188,5,1,'Combien existe-t-il de pièces en euros ?',NULL,1,'3','5','8',3),(189,5,1,'Que trouve-t-on sur toutes les pièces en euros ?',NULL,1,'Monnet, le père de l’Europe','Marianne','Une carte de l’Europe',3),(190,5,1,'Quand sont apparues les pièces en euros ?',NULL,1,'En 1992','En 1998','En  2002',3),(191,5,1,'Parmi ces trois monnaies, laquelle n’est plus utilisée ?',NULL,1,'Le franc suisse','L\'euro','Le mark',3),(192,5,1,'De quelle couleur est le billet de 20 € ?',NULL,1,'Jaune','Bleu','Vert',2),(193,5,1,'Quelle monnaie n’a pas été remplacée par l’euro ?',NULL,1,'Le franc luxembourgeois','La livre sterling','La lire italienne',2),(194,5,1,'Quel billet d’euro est vert ?',NULL,1,'Le billet de 100 €','Le billet de 50 €','Le billet de 20 €',1),(195,5,1,'Combien existent-ils de pièces cuivrées en euros ?',NULL,1,'1','3','5',2),(196,5,2,'L\'euro  est la monnaie d\'une partie de l\'Europe, continent qui s\'étend ?',NULL,2,'De Lisbonne à Moscou','De l\'Atlantique à l\'Oural','De l\'Irlande à l\'Ukraine',2),(197,5,2,'La pièce de 10 cts a un diamètre...?',NULL,2,'Inférieur à celle de 5 cts','Supérieur à celle de 5 cts','Identique à celle de 5 cts',1),(198,5,2,'A quoi servent les points en relief sur les billets ?',NULL,2,'A les compter pour les banquiers','A les reconnaître pour les aveugles','A les décoller lors de la fabrication',2),(199,5,2,'Quel billet en euro n\'est plus émis depuis 2018 ?',NULL,2,'Le billet de 500 €','Le billet de 1000 €','Le billet de 5 €',1),(200,5,2,'Combien existe-t-il de billets en euros ?',NULL,2,'3','7','10',2),(201,5,3,'En quelle année a été créée la zone euro ?',NULL,3,'1999','2001','2012',1),(202,5,3,'Que symbolisent les ponts sur les billets en euros ?',NULL,3,'L’union',' La découverte','L’histoire',1),(203,5,3,'Que symbolisent les portes sur les billets en euros ?',NULL,3,'L’ouverture','La paix',' La liberté',1),(204,5,3,'Où a été signé le traité créant le \"Marché commun\" en 1957 ?',NULL,3,'Maastricht','Rome','Luxembourg',2),(205,5,3,'C\'est quoi le filigrane d\'un billet ?',NULL,3,'La signature de l\'émetteur','Le pourtour','L\'image en transparence',3),(206,5,3,'Où sont frappées les pièces en euro françaises ?',NULL,3,'A Paris (75)','A Chamalières (63)','A Pessac (33)',3),(207,5,3,'Avant l\'euro, qu\'est-ce qui n\'a jamais été la monnaie française ?',NULL,3,'La piastre','Le franc','La livre',1),(208,5,3,'L\'Europe envisage de créer un euro numérique, c\'est quoi ?',NULL,3,'Pour payer son équipement informatique','Une crypto-monnaie','Pour les échanges de monnaie entre banques',2),(209,5,3,'Quelle monnaie n\'a jamais existé ?',NULL,3,'Le ramdam','Le sucre','L\'obole',1),(210,5,3,'En France, on n\'a jamais payé en ?',NULL,3,'Denier','Drachme','Ecu',2),(211,5,3,'Qui a inventé le papier monnaie ?',NULL,3,'Johannes Gutenberg','Les Egyptiens','Les Chinois',3),(212,5,3,'Quelle monnaie n\'a pas disparu à la création de l\'euro ?',NULL,3,'Le florin néerlandais','Le franc Pacifique','La peseta',2),(213,5,3,'Une monnaie commune évite ?',NULL,3,'Les frais  de change','La guerre commerciale','Une fiscalité trop lourde',1),(214,5,3,'Quelle monnaie utilise-t-on en Andorre ?',NULL,3,'Le franc CFA','L\'euro','L\'andorran',2),(215,5,3,'Qu\'a l\'euro de plus qu\'une crypto-monnaie ?',NULL,3,'Il est plus beau','Il est plus cher','Il a cours légal',3),(216,5,3,'Une monnaie ne permet pas de … ?',NULL,3,'Echanger','Blanchir','Conserver',2),(217,6,1,'Que signifie « mettre de l’argent de côté »  ?',NULL,1,'Dépenser','Emprunter','Épargner',3),(218,6,1,'Que signifie « jeter l’argent par les fenêtres » ?',NULL,1,'Dépenser son argent sans compter','Déposer de l’argent en banque','Acheter des rideaux',1),(219,6,1,'Que signifie « mettre de l\'argent de côté » ?',NULL,1,'Voler de l’argent','Cacher de l\'argent','Epargner',2),(220,6,1,'Que signifie « payer en liquide » ?',NULL,1,'Payer des boissons','Payer en pièces et en billets','Payer par carte bancaire',2),(221,6,1,'Que signifie : « jeter l\'argent par les fenêtres » ?',NULL,1,'Faire isoler les fenêtres de la maison','Dépenser déraisonnablement','Acheter sur Internet',2),(223,6,1,'Que signifie : « se faire plumer » ?',NULL,1,'Se faire escroquer','Enfiler un costume de cérémonie','Perdre ses cheveux',1),(224,6,1,'Que signifie : « fêter ses noces d\'or » ?',NULL,1,'Déballer les cadeaux de mariage','Se faire une donation entre époux','Avoir été mariés pendant 50 ans',3),(225,6,1,'On la dit voleuse, il s\'agit de ?',NULL,1,'La pie','La salamandre','La mite',1),(226,6,1,'Que signifie : « avoir un cœur d\'or » ?',NULL,1,'Avoir une pile cardiaque aux ions d\'or','Être dur en affaires','Être bon et généreux',3),(227,6,2,'Que signifie « rendre la monnaie de sa pièce » ?',NULL,2,'Rembourser quelqu’un','Se battre avec une pièce de monnaie','Se venger',3),(228,6,2,'Que signifie « consommer à l’œil » ?',NULL,2,'Acheter des lunettes de soleil','Manger des yeux de poisson','Consommer gratuitement',3),(229,6,2,'Que signifie « être sur la paille » ?',NULL,2,'Avoir un bon matelas','Être ruiné','Dormir à l\'écurie',2),(230,6,2,'Que signifie « faire un chèque en bois » ?',NULL,2,'Payer sans avoir d’argent','Construire un meuble','Se promener dans les bois',1),(231,6,2,'Que signifie « être dans le rouge »?',NULL,2,'Avoir dépensé plus que ses ressources','Avoir pris un coup de soleil','Avoir la rougeole',1),(232,6,2,'Que signifie : « mettre la clé sous la porte » ?',NULL,2,'Cacher les clés sous le paillasson','Faire faillite pour une entreprise','Avoir monté les gonds de la porte à l\'envers',2),(233,6,2,'Que signifie : « graisser la patte » ?',NULL,2,'Nourrir un oiseau','Faire frire une cuisse de canard','Corrompre une personne',3),(234,6,2,'Que signifie : « vouloir le beurre et l’argent du beurre » ?',NULL,2,'Mélanger du beurre et de l\'eau','Faire une demande exagérée','Faire des études de crémier',2),(235,6,2,'Que signifie : « faire un pont d\'or » ?',NULL,2,'Acheter une bague de fiançailles','Dormir pendant le week-end','Faire une offre très intéressante',3),(236,6,2,'Au jeu, que signifie : «intéresser la partie » ?',NULL,2,'Miser de l\'argent','Autoriser les spectateurs','Changer la règle du jeu',1),(237,6,2,'Que signifie : « un enfant prodigue » ?',NULL,2,'Une personne qui dilapide son argent','Un génie en herbe','Une créature de jeu vidéo',1),(238,6,2,'Que signifie : « être fauché comme les blés » ?',NULL,2,'Être chauve','Avoir été pris dans une fusillade','Être pauvre',3),(239,6,2,'Que signifie : « être en compte avec quelqu\'un » ?',NULL,2,'Monter une affaire avec lui','Lui en vouloir','Lui devoir de l\'argent ou qu\'il vous en doive',3),(240,6,2,'Que signifie : « mettre la main à la poche » ?',NULL,2,'Payer','Voler','Epargner',1),(241,6,2,'Que signifie : « être un panier percé » ?',NULL,2,'Rêver en classe','Dilapider son argent','Perdre ses clés',2),(242,6,2,'J\'ai «l\'argent qui me brûle les doigts », je suis ?',NULL,2,'Econome','Dépensier','Banquier',2),(244,6,3,'Que signifie « être plein aux as » ?',NULL,3,'Être chanceux','Avoir trop dépensé','Être très riche',3),(245,6,3,'Que signifie « prendre pour argent comptant » ?',NULL,3,'Avoir de l’argent sur son compte','Croire naïvement quelqu’un','Retirer de l’argent',2),(246,6,3,'Que signifie « payer en monnaie de singe » ?',NULL,3,'Payer dans une monnaie qui n’a pas de valeur','Utiliser une monnaie ancienne','Faire du troc',1),(247,6,3,'Que signifie « payer en espèces sonnantes et trébuchantes » ?',NULL,3,'Payer en faisant sonner des pièces de monnaie','Trébucher sur des pièces de monnaie','Payer avec des  pièces et des billets',3),(248,6,3,'Que signifie « aux frais de la princesse » ?',NULL,3,'Avoir été invité à dîner par une princesse','Obtenir quelque chose gratuitement','Se marier avec une princesse',2),(249,6,3,'Que signifie « coûter les yeux de la tête » ?',NULL,3,'Coûter peu cher','Coûter très cher','Au meilleur prix',2),(250,6,3,'Que signifie « avoir des oursins dans les poches » ? ',NULL,3,'Pêcher des oursins','Aimer les animaux','Être radin',3),(251,6,3,'Que signifie « toucher le pactole » ?',NULL,3,'Recevoir beaucoup d’argent','Dépenser sans limites','Ne pas avoir de chance',1),(252,6,3,'Que signifie « tirer le diable par la queue » ?',NULL,3,'Être insolent','Manquer d\'argent','S\'amuser avec son animal',2),(253,6,3,'Que signifie « blanchir de l’argent » ?',NULL,3,'Nettoyer les pièces','Compter son argent','Changer de l’argent illégal en argent légal ',3),(255,6,3,'Qui a dit : « l\'argent n\'a pas d\'odeur » ?',NULL,3,'Le bandit américain Al Capone','Le parfumeur inventeur de l\'eau de Cologne','L\'empereur romain Vespasien',3),(256,6,3,'Que signifie : « tenir les cordons de la bourse » ?',NULL,3,'Gérer le budget familial','Fermer son porte-monnaie','Recevoir un héritage',1),(257,6,3,'Que signifie : « des comptes d\'apothicaire » ?',NULL,3,'Espérer une rentrée d\'argent','Réaliser des calculs très précis','Contester une facture',2),(258,6,3,'Que signifie : « en avoir pour son argent » ?',NULL,3,'Être satisfait de ce qu\'on a eu pour le prix payé','Vouloir voler une personne','Avoir été roulé',1),(259,6,3,'Que signifie : «juger sur pièces » ?',NULL,3,'Examiner des informations objectives','Goûter un tonneau de vin','Vérifier la teneur en métal d\'une pièce de monnaie',1),(260,6,3,'Qui est  « un bon serviteur mais un mauvais maître » ?',NULL,3,'Le banquier','L\'argent','Le boursier',2),(261,6,3,'Que signifie : « dîner à la fortune du pot » ?',NULL,3,'Manger une poule au pot','Manger beaucoup','Invité à l\'improviste',3),(262,6,3,'Que signifie : « faire des dépenses somptuaires » ?',NULL,3,'Embellir son appartement','Engager des frais excessifs','Payer un entrepreneur',2),(263,6,3,'Que signifie : « être chocolat » ?',NULL,3,'S\'être fait avoir','Être grassouillet','Avoir trop bronzé',1),(264,7,1,'Quel est le premier système d’échange de marchandises ?',NULL,1,'Le truc','Le troc','Le tic-tac',2),(265,7,1,'Qui était Crésus ?',NULL,1,'Un roi de Lydie qui a inventé la monnaie en or ','Un riche marchand grec','Le créateur d’un jeu vidéo',1),(266,7,1,'Qui a composé « l’Ode à la joie », l’hymne européen ?',NULL,1,'Beethoven','Mozart','Vivaldi',1),(267,7,1,'Le drapeau européen comporte ?',NULL,1,'6 étoiles','12 étoiles','27 étoiles',2),(268,7,1,'Qui a écrit  « L’Avare » ? ',NULL,1,'Jean de la Fontaine','Jacques Prévert','Molière',3),(269,7,1,'Picsou est un personnage créé par ?',NULL,1,'Walt Disney','Uderzo','Hergé',1),(270,7,1,'Dans quelle monnaie Jules César payait-il  ses soldats ?',NULL,1,'Sesterce','Lire','Pilum',1),(271,7,1,'Le masque de Toutankhamon est en... ?',NULL,1,'Argent ','Or','Platine',2),(272,7,1,'Dans quel conte un âne \"pond\" des pièces d\'or ?',NULL,1,'Peau d\'âne','Les mémoires d\'un âne','L\'âne culotte',1),(273,7,1,'Avec quoi les Chinois du 16ème siècle faisaient-ils leurs comptes ?',NULL,1,'Une clepsydre','Un boulier','Des buchettes',2),(274,7,1,'Dans la fable de La Fontaine,  la cigale ?',NULL,1,'Epargne','Est dépensière','Ne sait pas chanter',2),(275,7,1,'Quelle est la suite du \"Secret de la Licorne\" pour Tintin ?',NULL,1,'Le sceptre d\'Ottokar','Le trésor de Rackham le rouge','Les bijoux de la Castafiore',2),(276,7,1,'Qui a trouvé le trésor des 40 voleurs ?',NULL,1,'Barberousse','Aladin','Ali Baba',3),(277,7,1,'Au Monopoly, comment s\'appelle le maître du jeu ?',NULL,1,'La banque','Merlin','Trust',1),(278,7,1,'En quoi est constitué le \"Magot des Dalton\" ?',NULL,1,'En or volé à la banque de Red Rock Junction','En faux billets de 3 dollars','La paie des gardiens de la prison',2),(279,7,1,'Qui a écrit \"La fortune de Gaspard\"',NULL,1,'Jonathan Swift','La comtesse de Ségur','Honoré de Balzac',2),(280,7,1,'Dans quel album Astérix se cache dans un coffre-fort ?',NULL,1,'Chez les Helvètes','Le chaudron','L\'Odyssée d\'Obélix',1),(281,7,1,'De qui est le film « La ruée vers l\'or »  ?',NULL,1,'Steven Spielberg','Charlie Chaplin','François Truffaut',2),(282,7,2,'Qu\'elle était probablement la 1ère monnaie ?',NULL,2,' Des coquillages','Des objets fabriqués',' Des pièces d’or',1),(283,7,2,'Europe était ?',NULL,2,'Une princesse de la mythologie grecque','Un monument historique','Une femme politique',1),(284,7,2,'On parle de « la crise de 1929 » pour désigner ?',NULL,2,'Un conflit entre plusieurs pays','Une crise financière','Un film muet',2),(285,7,2,'Quand est célébrée la journée de l\'Europe ?',NULL,2,'Le 1er mai','Le 9 mai','Le 11 novembre',2),(286,7,2,'Qui a écrit  « L\'ile au trésor » ? ',NULL,2,'Robert Louis Stevenson','Enid Blyton','Casimir',1),(287,7,2,'Dans quelle fable de La Fontaine le travail est un trésor ?',NULL,2,'La laitière et le pot au lait','Le chat, la belette et le petit lapin','Le laboureur et ses enfants',3),(288,7,2,'Que cherchaient les conquistadors en Amazonie ?',NULL,2,'Le jaguar','Le fleuve Amazone','L\'Eldorado',3),(289,7,2,'Pour Harry Potter, quelle monnaie est en bronze ?',NULL,2,'La noise','La mornille','Le gallion',1),(290,7,2,'Que cherchaient Jason et les Argonautes ?',NULL,2,'La toison d\'or','La peau du lion de Némée','Le Graal',1),(291,7,2,'Comment s\'appelait l\'impôt sur le sel ?',NULL,2,'La gabelle','La saline','La dîme',1),(292,7,2,'Qui transformait tout ce qu\'il touchait en or ?',NULL,2,'Le dieu Héphaïstos','L\'empereur Marc-Aurèle','Le roi Midas',3),(293,7,2,'Qui voulait transformer le plomb en or ?',NULL,2,'Les orpailleurs','Les courtiers','Les alchimistes',3),(294,7,2,'Quel est le nom de la famille de grands banquiers florentins ?',NULL,2,'Les Colonna','Les Médicis','Les Sforza',2),(295,7,2,'A qui Pâris a-t-il donné la pomme d\'or de la plus belle ?',NULL,2,'Hélène de Troie','Cléopâtre','Aphrodite',3),(296,7,3,'Quel roi figure sur le premier franc ?',NULL,3,'Charlemagne','Jean II Le Bon','Louis IX',2),(297,7,3,'Quelle est l’origine du mot « salaire » ?',NULL,3,'Le poivre','La salade','Le sel',3),(298,7,3,'Le traité de Rome créant l’Union européenne a été signé en ?',NULL,3,'1945','1957','1962',2),(299,7,3,'Quelle est la devise de l’Union européenne ?',NULL,3,'« Unies dans la diversité »','« Ensemble pour changer »','« Regroupés pour mieux régner »',1),(300,7,3,'On parle de la « bulle Internet » pour désigner ?',NULL,3,'Une crise financière des années 2000','Un film','La naissance d’Internet',1),(301,7,3,'Qui a écrit le roman « L’argent » ? ',NULL,3,'Molière','La comtesse de Ségur','Emile Zola',3),(302,7,3,'Qui a créé le louis d\'or ?',NULL,3,'François 1er','Louis XIII','Louis XIV',2),(303,7,3,'En France, la première Bourse est apparue à ?',NULL,3,'Paris','Toulouse','Bordeaux',2),(304,7,3,'La première banque est apparue ?',NULL,3,'Au Moyen-âge','Dans l\'Antiquité','À la Renaissance',1),(305,7,3,'Qu\'est-ce que le « Système de Law » ? ',NULL,3,'Le code monétaire en Grande-Bretagne','Une arnaque financière au XVIIIème siècle','Une astuce pour gagner au casino',2),(306,7,3,'Lesquels de ces frères sont des banquiers et investisseurs du XIXème siècle ?',NULL,3,'Les frères Grimm','Les frères Pereire','Les frères Dardenne',2),(307,7,3,'En quoi étaient payés les biens nationaux à la Révolution ?',NULL,3,'En blé','En litres de vin (ancêtres des \"pots de vin\")','En assignats, monnaie papier',3),(308,7,3,'\"Monnaie de singe\" (Monkey Business en vo) est un film avec ?',NULL,3,'Georges Méliès','Laurel et Hardy','Les Marx Brothers',3),(309,7,3,'Qui était Alexandre Brongniart sous Napoléon 1er ?',NULL,3,'Le ministre des finances','L\'architecte du palais de la Bourse à Paris','Le meilleur soldat de la Grande Armée',2),(311,7,3,'Originaire de Bourges, il a financé son roi. Qui est-ce ?',NULL,3,'André Chénier','Philippe de Commynes','Jacques Cœur',3),(312,7,3,'Au Moyen-Age, qui a inventé l\'une des 1ères monnaies scripturales  ?',NULL,3,'Les marchands de Bruges','Les banquiers lombards','Les Cathares',2),(313,7,3,'On cherche toujours leur trésor. Qui sont-ils ?',NULL,3,'Les corsaires malouins','Les druides','Les templiers',3),(314,7,3,'Qui est Shylock dans « Le Marchand de Venise » de Shakespeare ?',NULL,3,'Un capitaine de bateau','Un usurier','Un géôlier',2),(315,7,3,'Qui prélevait les impôts avant la Révolution ?',NULL,3,'Le gabelou','Le fermier général','Le sénéchal',2),(316,7,3,'Le creusement de ce canal a causé une grande arnaque financière ?',NULL,3,'Canal de Panama','Canal de Suez','Canal du Midi',1),(317,7,3,'Qui peut voter au suffrage censitaire ?',NULL,3,'Ceux qui paient des impôts','Ceux qui ont fait des études supérieures','Ceux qui habitent au centre-ville',1),(318,7,3,'Une des premières bulles spéculatives concernait ?',NULL,3,'La porcelaine','Le savon','Les oignons de tulipe',3),(319,7,3,'Grand argentier, il fut arrêté par d\'Artagnan. Qui est-ce ?',NULL,3,'Nicolas Fouquet','Jean-Baptiste Colbert','Sébastien de Vauban',1),(320,7,3,'Qui a composé le tube «Money» ?',NULL,3,'Lady Gaga','Pink Floyd','Amy Winehouse',2),(321,1,1,'Comment dit-on finance en anglais ?',NULL,1,'Finance','Financio','Financia',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int NOT NULL,
  `diagram_id` int NOT NULL,
  `version` int DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`);
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `id` int NOT NULL,
  `val` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,'anglais'),(2,'banque'),(3,'calcul mental'),(4,'economie'),(5,'euro'),(6,'expressions'),(7,'histoire');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_theme`
--

DROP TABLE IF EXISTS `user_theme`;
/*!50001 DROP VIEW IF EXISTS `user_theme`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_theme` AS SELECT 
 1 AS `id`,
 1 AS `id_theme`,
 1 AS `difficulty`,
 1 AS `question`,
 1 AS `image`,
 1 AS `value`,
 1 AS `texteR1`,
 1 AS `texteR2`,
 1 AS `texteR3`,
 1 AS `correct_answer`,
 1 AS `theme`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `motdepasse` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT 'appli',
  `pseudo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `user_theme`
--

/*!50001 DROP VIEW IF EXISTS `user_theme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_theme` AS select `q`.`id` AS `id`,`q`.`id_theme` AS `id_theme`,`q`.`difficulty` AS `difficulty`,`q`.`question` AS `question`,`q`.`image` AS `image`,`q`.`value` AS `value`,`q`.`texteR1` AS `texteR1`,`q`.`texteR2` AS `texteR2`,`q`.`texteR3` AS `texteR3`,`q`.`correct_answer` AS `correct_answer`,`t`.`val` AS `theme` from (`question` `q` join (select `theme`.`id` AS `theme_id`,`theme`.`val` AS `val` from `theme`) `t` on((`q`.`id_theme` = `t`.`theme_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 17:29:31
