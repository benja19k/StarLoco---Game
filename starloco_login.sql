-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.21-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5130
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table starloco_login.accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `guid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET latin1 NOT NULL,
  `pass` text CHARACTER SET latin1 NOT NULL,
  `banned` tinyint(3) NOT NULL DEFAULT '0',
  `bannedTime` bigint(255) NOT NULL DEFAULT '0',
  `pseudo` varchar(30) CHARACTER SET latin1 NOT NULL,
  `question` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'DELETE?',
  `reponse` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'DELETE',
  `lastConnectionDate` varchar(100) CHARACTER SET latin1 NOT NULL,
  `lastIP` varchar(30) CHARACTER SET latin1 NOT NULL,
  `friends` text CHARACTER SET latin1 NOT NULL,
  `enemy` text CHARACTER SET latin1 NOT NULL,
  `vip` int(1) NOT NULL DEFAULT '0',
  `reload_needed` tinyint(1) NOT NULL DEFAULT '1',
  `logged` int(1) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `totalVotes` int(11) NOT NULL DEFAULT '0',
  `subscribe` bigint(255) NOT NULL DEFAULT '0',
  `heurevote` bigint(50) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `muteTime` bigint(255) DEFAULT NULL,
  `muteRaison` text,
  `mutePseudo` text,
  `image` int(11) DEFAULT '0',
  `email` text,
  `lastVoteIP` varchar(255) DEFAULT NULL,
  `showOrHide` tinyint(1) NOT NULL DEFAULT '0',
  `showOrHidePos` tinyint(1) NOT NULL DEFAULT '0',
  `dateRegister` varchar(10) NOT NULL DEFAULT '01/01/2015',
  `lastConnectDay` text NOT NULL,
  `rules` tinyint(1) NOT NULL DEFAULT '1',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.administration.commands
DROP TABLE IF EXISTS `administration.commands`;
CREATE TABLE IF NOT EXISTS `administration.commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` text CHARACTER SET latin1 NOT NULL,
  `args` text CHARACTER SET latin1,
  `description` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.administration.groups
DROP TABLE IF EXISTS `administration.groups`;
CREATE TABLE IF NOT EXISTS `administration.groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET latin1 NOT NULL,
  `isPlayer` tinyint(2) NOT NULL,
  `inLadder` tinyint(2) NOT NULL,
  `commands` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.area_data
DROP TABLE IF EXISTS `area_data`;
CREATE TABLE IF NOT EXISTS `area_data` (
  `id` int(11) NOT NULL,
  `superarea` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.banip
DROP TABLE IF EXISTS `banip`;
CREATE TABLE IF NOT EXISTS `banip` (
  `ip` varchar(15) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.client_rss_news
DROP TABLE IF EXISTS `client_rss_news`;
CREATE TABLE IF NOT EXISTS `client_rss_news` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `date` bigint(255) NOT NULL,
  `icon` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.coffres
DROP TABLE IF EXISTS `coffres`;
CREATE TABLE IF NOT EXISTS `coffres` (
  `id` int(11) NOT NULL,
  `id_house` int(11) NOT NULL,
  `mapid` int(11) NOT NULL,
  `cellid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.houses
DROP TABLE IF EXISTS `houses`;
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cell_id` int(10) unsigned NOT NULL DEFAULT '0',
  `saleBase` text NOT NULL,
  `mapid` int(11) NOT NULL DEFAULT '0',
  `caseid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`map_id`,`cell_id`,`mapid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.mountpark_data
DROP TABLE IF EXISTS `mountpark_data`;
CREATE TABLE IF NOT EXISTS `mountpark_data` (
  `mapid` int(11) NOT NULL,
  `cellid` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `sizeObj` int(11) NOT NULL,
  `priceBase` int(11) NOT NULL,
  `cellMount` int(11) NOT NULL,
  `cellPorte` int(11) NOT NULL,
  `cellEnclos` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`mapid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `account` int(11) NOT NULL,
  `groupe` int(11) NOT NULL DEFAULT '-1',
  `sexe` tinyint(4) NOT NULL,
  `class` smallint(6) NOT NULL,
  `color1` int(11) NOT NULL,
  `color2` int(11) NOT NULL,
  `color3` int(11) NOT NULL,
  `kamas` bigint(11) NOT NULL,
  `spellboost` int(11) NOT NULL,
  `capital` int(11) NOT NULL,
  `energy` int(11) NOT NULL DEFAULT '10000',
  `level` int(11) NOT NULL,
  `xp` bigint(32) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL,
  `gfx` int(11) NOT NULL,
  `alignement` int(11) NOT NULL DEFAULT '0',
  `honor` int(11) NOT NULL DEFAULT '0',
  `deshonor` int(11) NOT NULL DEFAULT '0',
  `alvl` int(11) NOT NULL DEFAULT '0' COMMENT 'Niveau alignement',
  `vitalite` int(11) NOT NULL DEFAULT '0',
  `force` int(11) NOT NULL DEFAULT '0',
  `sagesse` int(11) NOT NULL DEFAULT '0',
  `intelligence` int(11) NOT NULL DEFAULT '0',
  `chance` int(11) NOT NULL DEFAULT '0',
  `agilite` int(11) NOT NULL DEFAULT '0',
  `seeFriend` tinyint(4) NOT NULL DEFAULT '1',
  `seeAlign` tinyint(4) NOT NULL DEFAULT '0',
  `seeSeller` tinyint(4) NOT NULL DEFAULT '0',
  `canaux` varchar(15) CHARACTER SET latin1 NOT NULL DEFAULT '*#%!pi$:?',
  `map` int(11) NOT NULL,
  `cell` int(11) NOT NULL,
  `pdvper` int(11) NOT NULL DEFAULT '100',
  `spells` text CHARACTER SET latin1 NOT NULL,
  `objets` text CHARACTER SET latin1 NOT NULL,
  `storeObjets` text CHARACTER SET latin1 NOT NULL,
  `savepos` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '10298,314',
  `zaaps` varchar(250) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `jobs` varchar(300) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `mountxpgive` int(11) NOT NULL DEFAULT '0',
  `mount` int(11) NOT NULL DEFAULT '-1',
  `title` int(11) NOT NULL DEFAULT '0',
  `wife` int(1) NOT NULL DEFAULT '0',
  `morphMode` text CHARACTER SET latin1,
  `emotes` varchar(500) CHARACTER SET latin1 DEFAULT '',
  `prison` bigint(255) NOT NULL DEFAULT '0',
  `server` int(11) NOT NULL,
  `logged` int(5) DEFAULT '0',
  `allTitle` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `parcho` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `timeDeblo` bigint(255) DEFAULT NULL,
  `noall` tinyint(4) NOT NULL DEFAULT '0',
  `deadInformation` varchar(255) NOT NULL DEFAULT '0,0,0,0',
  `deathCount` int(11) NOT NULL DEFAULT '0',
  `totalKills` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.pubs
DROP TABLE IF EXISTS `pubs`;
CREATE TABLE IF NOT EXISTS `pubs` (
  `data` text CHARACTER SET utf8 NOT NULL,
  `server` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.servers
DROP TABLE IF EXISTS `servers`;
CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` text CHARACTER SET latin1 NOT NULL,
  `key` text CHARACTER SET latin1,
  `population` int(11) DEFAULT '0',
  `isSubscriberServer` int(11) DEFAULT '1',
  `uptime` bigint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.shop.categories
DROP TABLE IF EXISTS `site.shop.categories`;
CREATE TABLE IF NOT EXISTS `site.shop.categories` (
  `id` tinyint(5) NOT NULL,
  `name` text CHARACTER SET latin1 NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.shop.objects
DROP TABLE IF EXISTS `site.shop.objects`;
CREATE TABLE IF NOT EXISTS `site.shop.objects` (
  `name` text NOT NULL,
  `template` int(11) NOT NULL,
  `jp` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '1000000',
  `category` int(11) NOT NULL DEFAULT '-1',
  `server` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template`,`server`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.shop.objects.templates
DROP TABLE IF EXISTS `site.shop.objects.templates`;
CREATE TABLE IF NOT EXISTS `site.shop.objects.templates` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` text CHARACTER SET latin1,
  `description` text CHARACTER SET latin1,
  `skin` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `effects` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.shop.points.purchase
DROP TABLE IF EXISTS `site.shop.points.purchase`;
CREATE TABLE IF NOT EXISTS `site.shop.points.purchase` (
  `account` varchar(255) CHARACTER SET latin1 NOT NULL,
  `points` int(10) NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 NOT NULL,
  `pays` text CHARACTER SET latin1 NOT NULL,
  `type` text CHARACTER SET latin1 NOT NULL,
  `date` varchar(16) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.shop.purchase
DROP TABLE IF EXISTS `site.shop.purchase`;
CREATE TABLE IF NOT EXISTS `site.shop.purchase` (
  `account` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT '1',
  `server` int(11) NOT NULL,
  `date` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.timeline.news
DROP TABLE IF EXISTS `site.timeline.news`;
CREATE TABLE IF NOT EXISTS `site.timeline.news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `img` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.timeline.news.comment
DROP TABLE IF EXISTS `site.timeline.news.comment`;
CREATE TABLE IF NOT EXISTS `site.timeline.news.comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_news` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.site.user.votes
DROP TABLE IF EXISTS `site.user.votes`;
CREATE TABLE IF NOT EXISTS `site.user.votes` (
  `ip` varchar(20) NOT NULL,
  `date` bigint(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.subarea_data
DROP TABLE IF EXISTS `subarea_data`;
CREATE TABLE IF NOT EXISTS `subarea_data` (
  `id` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.world.entity.guilds
DROP TABLE IF EXISTS `world.entity.guilds`;
CREATE TABLE IF NOT EXISTS `world.entity.guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `emblem` varchar(20) CHARACTER SET latin1 NOT NULL,
  `lvl` int(11) NOT NULL DEFAULT '1',
  `xp` bigint(20) NOT NULL DEFAULT '0',
  `capital` int(11) NOT NULL DEFAULT '0',
  `maxCollectors` int(11) NOT NULL DEFAULT '1',
  `spells` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '462;0|461;0|460;0|459;0|458;0|457;0|456;0|455;0|454;0|453;0|452;0|451;0|',
  `stats` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '176;100|158;1000|124;100|',
  `date` bigint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.world.entity.mounts
DROP TABLE IF EXISTS `world.entity.mounts`;
CREATE TABLE IF NOT EXISTS `world.entity.mounts` (
  `id` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `xp` int(32) NOT NULL,
  `level` int(11) NOT NULL,
  `endurance` int(11) NOT NULL,
  `amour` int(11) NOT NULL,
  `maturity` int(11) NOT NULL,
  `serenity` int(11) NOT NULL,
  `reproductions` int(11) NOT NULL,
  `fatigue` int(11) NOT NULL,
  `energy` int(11) NOT NULL,
  `objects` text CHARACTER SET latin1 NOT NULL,
  `ancestors` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT ',,,,,,,,,,,,,',
  `capacitys` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL,
  `map` int(11) NOT NULL,
  `cell` int(11) NOT NULL,
  `owner` int(11) unsigned zerofill NOT NULL,
  `orientation` int(11) NOT NULL,
  `fecundatedDate` bigint(255) NOT NULL,
  `couple` int(11) NOT NULL,
  `savage` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.world.entity.objects
DROP TABLE IF EXISTS `world.entity.objects`;
CREATE TABLE IF NOT EXISTS `world.entity.objects` (
  `id` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `stats` text CHARACTER SET latin1 NOT NULL,
  `puit` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `guid` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.world.entity.obvijevans
DROP TABLE IF EXISTS `world.entity.obvijevans`;
CREATE TABLE IF NOT EXISTS `world.entity.obvijevans` (
  `id` int(10) NOT NULL,
  `template` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.world.entity.pets
DROP TABLE IF EXISTS `world.entity.pets`;
CREATE TABLE IF NOT EXISTS `world.entity.pets` (
  `id` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  `lastEatDate` longtext CHARACTER SET latin1 NOT NULL,
  `quantityEat` int(1) NOT NULL,
  `pdv` int(11) NOT NULL,
  `corpulence` int(11) NOT NULL,
  `isEPO` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.world.entity.players.quests
DROP TABLE IF EXISTS `world.entity.players.quests`;
CREATE TABLE IF NOT EXISTS `world.entity.players.quests` (
  `id` int(11) NOT NULL,
  `quest` int(11) NOT NULL,
  `finish` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `stepsValidation` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table starloco_login.world.event.type
DROP TABLE IF EXISTS `world.event.type`;
CREATE TABLE IF NOT EXISTS `world.event.type` (
  `id` int(5) NOT NULL,
  `maxPlayers` int(5) NOT NULL DEFAULT '8',
  `name` text NOT NULL,
  `description` text NOT NULL,
  `firstWinner` varchar(255) NOT NULL DEFAULT '',
  `secondWinner` varchar(255) NOT NULL DEFAULT '',
  `thirdWinner` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
