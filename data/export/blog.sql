-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 03 nov. 2019 à 10:30
-- Version du serveur :  10.1.35-MariaDB
-- Version de PHP :  7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bases-php`
--
CREATE DATABASE IF NOT EXISTS `bases-php` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bases-php`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(0, 'autres'),
(1, 'pizza');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text,
  `idPost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `content`, `idPost`) VALUES
(5, 'test', 14),
(22, 'test', 10),
(23, 'test', 10),
(24, 'Excellent+%21', 10);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `idCategory` int(11) DEFAULT '0',
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `imagePath`, `title`, `content`, `idCategory`, `idUser`) VALUES
(10, 'img%5Cchevre_miel.jpg', 'Pizza%20ch%C3%A8vre%20miel%20cr%C3%A8me%20fraiche', '%3Ch1%3EPizza%20ch%C3%A8vre%20miel%20cr%C3%A8me%20fraiche%3C%2Fh1%3E%0A%0A%3Cp%3ENombre%20de%20personnes%20%3A%204%3C%2Fp%3E%0A%0A%3Ch3%3EIngr%C3%A9dients%3C%2Fh3%3E%0A%0A%3Cp%3E1%20p%C3%A2te%20%C3%A0%20pizza%20toute%20pr%C3%AAte%20%28ou%20faite%20maison%29%3C%2Fp%3E%0A%0A%3Cp%3E1%20b%C3%BBche%20de%20fromage%20de%20ch%C3%A8vre%3C%2Fp%3E%0A%0A%3Cp%3E4%20miel%20liquide%3C%2Fp%3E%0A%0A%3Cp%3E1%20petit%20pot%20de%20cr%C3%A8me%20fra%C3%AEche%20liquide%20%2820%20cl%29%3C%2Fp%3E%0A%0A%3Cp%3EOlives%3C%2Fp%3E%0A%0A%3Cp%3EEmmental%20r%C3%A2p%C3%A9%3C%2Fp%3E%0A%0A%3Cp%3ETEMPS%20TOTAL%20%3A%2045%20MIN%3C%2Fp%3E%0A%3Cp%3EPr%C3%A9paration%20%3A%2015%20min%3C%2Fp%3E%0A%3Cp%3ECuisson%20%3A%2030%20min%3C%2Fp%3E%0A%3Ch5%3EEtape%201%3C%2Fh5%3E%0A%3Cp%3EBien%20%C3%A9taler%20la%20p%C3%A2te%20sur%20du%20papier%20sulfuris%C3%A9%20et%20la%20r%C3%A9partir%20dans%20un%20plat%20%C3%A0%20four%20rond%20avec%20un%20minimum%20de%20rebords.%3C%2Fp%3E%0A%3Ch5%3EEtape%202%3C%2Fh5%3E%0A%3Cp%3EVerser%20la%20totalit%C3%A9%20du%20pot%20de%20cr%C3%A8me%20fra%C3%AEche%20dans%20le%20plat%20et%20bien%20la%20r%C3%A9partir.%3C%2Fp%3E%0A%3Ch5%3EEtape%203%3C%2Fh5%3E%0A%3Cp%3ECouper%20le%20ch%C3%A8vre%20en%20tranches%20ou%20en%20petits%20morceaux%2C%20puis%20le%20r%C3%A9partir%20sur%20le%20plat.%3C%2Fp%3E%0A%3Ch5%3EEtape%204%3C%2Fh5%3E%0A%3Cp%3EAjouter%20le%20miel%20liquide%20uniform%C3%A9ment.%3C%2Fp%3E%0A%3Ch5%3EEtape%205%3C%2Fh5%3E%0A%3Cp%3EPuis%20ajouter%20le%20fromage%20r%C3%A2p%C3%A9.%3C%2Fp%3E%0A%3Ch5%3EEtape%206%3C%2Fh5%3E%0A%3Cp%3ERajouter%20un%20peu%20de%20miel%20sur%20le%20fromage%20et%20%C3%A9ventuellement%20ajouter%20quelques%20olives.%3C%2Fp%3E%0A%3Ch5%3EEtape%207%3C%2Fh5%3E%0A%3Cp%3EEnfourner%20%C3%A0%20thermostat%206%20pendant%2030%20mn%20environ%2C%20mais%20surveiller%20%21%3C%2Fp%3E%0A%3Ch5%3EEtape%208%3C%2Fh5%3E%0A%3Cp%3ERetirer%20quand%20la%20p%C3%A2te%20est%20bien%20cuite%20dessous.%3C%2Fp%3E%0A%3Ch5%3EEtape%209%3C%2Fh5%3E%0A%3Cp%3EBon%20app%C3%A9tit.%3C%2Fp%3E', 1, 1),
(11, 'img%5Chawa%C3%AFenne.jpg', 'Pizza%20hawa%C3%AFenne', '%3Ch1%3EPizza%20hawa%C3%AFenne%3C%2Fh1%3E%0A%0A%3Cp%3ENombre%20de%20personnes%20%3A%204%3C%2Fp%3E%0A%0A%3Ch3%3EIngr%C3%A9dients%3C%2Fh3%3E%0A%0A%3Cp%3E1%20sachet%20de%20farine%20sp%C3%A9ciale%20pizza%3C%2Fp%3E%0A%0A%3Cp%3E1%20oignon%20moyen%3C%2Fp%3E%0A%0A%3Cp%3E1%20petite%20bo%C3%AEte%20de%20ma%C3%AFs%20en%20conserve%3C%2Fp%3E%0A%0A%3Cp%3E10%20rondelles%20d%27ananas%20en%20conserve%3C%2Fp%3E%0A%0A%3Cp%3EPaprika%3C%2Fp%3E%0A%0A%3Cp%3ECurry%3C%2Fp%3E%0A%0A%3Cp%3E1%20tomate%3C%2Fp%3E%0A%0A%3Cp%3E1%20bo%C3%AEte%20de%20concentr%C3%A9%20de%20tomates%3C%2Fp%3E%0A%0A%3Cp%3E1%20filet%20d%27huile%20de%20p%C3%A9pin%20de%20raisin%3C%2Fp%3E%0A%0A%3Cp%3EPoivre%20du%20moulin%3C%2Fp%3E%0A%0A%3Cp%3EParmesan%20r%C3%A2p%C3%A9%3C%2Fp%3E%0A%0A%3Cp%3ETEMPS%20TOTAL%20%3A%2035%20MIN%3C%2Fp%3E%0A%3Cp%3EPr%C3%A9paration%20%3A%2015%20min%3C%2Fp%3E%0A%3Cp%3ECuisson%20%3A%2020%20min%3C%2Fp%3E%0A%3Ch5%3EEtape%201%3C%2Fh5%3E%0A%3Cp%3EFaire%20la%20p%C3%A2te%20%C3%A0%20pizza%20comme%20indiqu%C3%A9%20sur%20l%27emballage%20mais%20moi%20je%20mets%20du%20papier%20cuisson%20sur%20la%20plaque%20et%20non%20de%20l%27huile%20%28moins%20gras%20d%C3%A9j%C3%A0%21%29%20puis%20allumer%20le%20four%20%28200-240%C2%B0C%20-%20thermostat%207-8%29%20et%20s%27occuper%20de%20la%20garniture%20pendant%20le%20repos%20de%20la%20p%C3%A2te%3A%3C%2Fp%3E%0A%3Ch5%3EEtape%202%3C%2Fh5%3E%0A%3Cp%3EDans%20une%20sauteuse%2C%20je%20fais%20revenir%20un%20oignon%20moyen%20puis%20j%27ajoute%20le%20poulet%20en%20petits%20lardons%2C%20je%20laisse%20mijoter%20%C3%A0%20feu%20doux%20et%2C%20quand%20le%20poulet%20perd%20un%20peu%20de%20son%20jus%2C%20je%20saupoudre%20de%20curry%20et%20de%20paprika.%3C%2Fp%3E%0A%3Ch5%3EEtape%203%3C%2Fh5%3E%0A%3Cp%3EPour%20la%20sauce%20tomate%3A%20faire%20boullir%20la%20tomate%20une%20minute%2C%20peler%20et%20%C3%A9p%C3%A9piner%20et%20passer%20%C3%A0%20la%20moulinette%2C%20puis%20ajouter%20le%20concentr%C3%A9%2C%20le%20filet%20d%27huile%20et%20le%20poivre%20%28un%20tour%20de%20moulin%20suffit%29%2C%20badigeonner%20la%20p%C3%A2te%20avec%20un%20pinceau%20pour%20faire%20la%20plus%20fine%20couche%20possible.%3C%2Fp%3E%0A%3Ch5%3EEtape%204%3C%2Fh5%3E%0A%3Cp%3EMettre%20le%20ma%C3%AFs%2C%20puis%20le%20poulet%2C%20puis%20les%20ananas%20en%20rondelles%20enti%C3%A8res%20ou%20coup%C3%A9es%20en%20petits%20morceaux%20%28je%20pr%C3%A9conise%20la%20deuxi%C3%A8me%20solution%29%20et%20pour%20finir%2C%20le%20parmesan%20en%20petite%20quantit%C3%A9.%3C%2Fp%3E%0A%3Ch5%3EEtape%205%3C%2Fh5%3E%0A%3Cp%3EMettre%20au%20four%20pendant%2020%20minutes%20mais%20il%20est%20pr%C3%A9f%C3%A9rable%20de%20v%C3%A9rifier%20%C3%A0%20mi-cuisson%20que%20les%20ananas%20ne%20grillent%20pas%20trop%20%28si%20oui%20mettre%20le%20four%20en%20chaleur%20tournante%29.%0A%3C%2Fp%3E%0A%3Ch5%3EEtape%206%3C%2Fh5%3E%0A%3Cp%3EVoil%C3%A0%2C%20et%20bon%20app%C3%A9tit%20%21%3C%2Fp%3E', 1, 1),
(12, 'img%5Cthon.jpg', 'Pizza%20au%20thon', '%3Ch3%3EPizza%20au%20thon%3C%2Fh3%3E%0A%3Cp%3ENombre%20de%20personnes%20%3A%204%3C%2Fp%3E%0A%0A%3Ch3%3EIngr%C3%A9dients%3C%2Fh3%3E%0A%0A%3Cp%3E1%20P%C3%A2te%20%C3%A0%20Pizza%20Fine%20et%20Rectangulaire%20HERTA%C2%AE%3C%2Fp%3E%0A%0A%3Cp%3E3%20cuill%C3%A8res%20%C3%A0%20soupe%20bomb%C3%A9es%20de%20cr%C3%A8me%20fra%C3%AEche%3C%2Fp%3E%0A%0A%3Cp%3E140%20g%20de%20thon%3C%2Fp%3E%0A%0A%3Cp%3E30%20g%20de%20c%C3%A2pres%3C%2Fp%3E%0A%0A%3Cp%3E2%20boules%20de%20mozzarella%3C%2Fp%3E%0A%0A%3Cp%3E8%20tomates%20cerise%3C%2Fp%3E%0A%0A%3Cp%3E1%2F4%20oignon%20rouge%3C%2Fp%3E%0A%0A%3Cp%3E1%20cuill%C3%A8re%20%C3%A0%20soupe%20de%20concentr%C3%A9%20de%20tomates%3C%2Fp%3E%0A%0A%3Cp%3E1%20petite%20gousse%20d%27ail%3C%2Fp%3E%0A%0A%3Cp%3E2%20cuill%C3%A8res%20%C3%A0%20soupe%20d%27huile%20d%27olive%3C%2Fp%3E%0A%0A%3Cp%3E1%20cuill%C3%A8re%20%C3%A0%20caf%C3%A9%20d%27origan%3C%2Fp%3E%0A%0A%0A%3Cp%3ETEMPS%20TOTAL%20%3A%2040%20MIN%3C%2Fp%3E%0A%3Cp%3EPr%C3%A9paration%20%3A%2020%20min%3C%2Fp%3E%0A%3Cp%3ECuisson%20%3A%2020%20min%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%201%3C%2Fh5%3E%0A%3Cp%3EPr%C3%A9chauffez%20votre%20four%20Th.6%2F7%20%28200%C2%B0C%29.%20D%C3%A9roulez%20la%20p%C3%A2te%20sur%20la%20plaque%20de%20votre%20four%20en%20conservant%20la%20feuille%20de%20papier%20sulfuris%C3%A9.%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%202%3C%2Fh5%3E%0A%3Cp%3EEpluchez%20et%20hachez%20l%27oignon.%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%203%3C%2Fh5%3E%0A%3Cp%3EDans%20un%20saladier%2C%20m%C3%A9langez%20le%20concentr%C3%A9%20de%20tomates%2C%20l%27huile%2C%20l%27ail%20%C3%A9cras%C3%A9%2C%20%20l%27origan%2C%20l%27oignon%20hach%C3%A9%20et%20le%20thon%20%C3%A9goutt%C3%A9.%20Salez%20et%20poivrez.%20R%C3%A9servez%20le%20m%C3%A9lange.%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%204%3C%2Fh5%3E%0A%3Cp%3ER%C3%A9partissez%20la%20cr%C3%A8me%20sur%20la%20pizza%20et%201%20boule%20de%20mozzarella%20coup%C3%A9e%20en%20rondelles.%20Faites%20cuire%208%20minutes%20environ.%20R%C3%A9partissez%20le%20m%C3%A9lange%20au%20thon%20avec%20les%20c%C3%A2pres%2C%20la%20mozzarella%20restante%20coup%C3%A9e%20en%20rondelles%20et%20les%20tomates%20cerise%20coup%C3%A9es%20en%20deux.%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%205%3C%2Fh5%3E%0A%3Cp%3EPoursuivez%20la%20cuisson%20environ%2010%20minutes.%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%206%3C%2Fh5%3E%0A%3Cp%3EBon%20app%C3%A9tit.%3C%2Fp%3E%20%20%0A', 1, 1),
(13, '	\r\nimg%5Chachis.jpg', 'Hachis%20parmentier', '%3Ch3%3EHachis%20parmentier%3C%2Fh3%3E%0A%3Cp%3ENombre%20de%20personnes%20%3A%204%3C%2Fp%3E%0A%0A%3Ch3%3EIngr%C3%A9dients%3C%2Fh3%3E%0A%0A%3Cp%3E400%20g%20de%20viande%20hach%C3%A9e%3C%2Fp%3E%0A%0A%3Cp%3E300%20g%20de%20pur%C3%A9e%3C%2Fp%3E%0A%0A%3Cp%3E2%20oignons%3C%2Fp%3E%0A%0A%3Cp%3E2%20gousses%20d%27ail%3C%2Fp%3E%0A%0A%3Cp%3E2%20tomates%3C%2Fp%3E%0A%0A%3Cp%3E1%20cuill%C3%A8re%20%C3%A0%20soupe%20de%20farine%3C%2Fp%3E%0A%0A%3Cp%3E1%20jaune%20d%27oeuf%3C%2Fp%3E%0A%0A%3Cp%3E30%20g%20de%20parmesan%3C%2Fp%3E%0A%0A%3Cp%3E30%20g%20de%20beurre%3C%2Fp%3E%0A%0A%3Cp%3E50%20g%20de%20fromage%20r%C3%A2p%C3%A9%3C%2Fp%3E%0A%0A%3Cp%3ESel%2C%20poivre%3C%2Fp%3E%0A%0A%0A%3Cp%3ETEMPS%20TOTAL%20%3A%2045%20MIN%3C%2Fp%3E%0A%3Cp%3EPr%C3%A9paration%20%3A%2025%20min%3C%2Fp%3E%0A%3Cp%3ECuisson%20%3A%2020%20min%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%201%3C%2Fh5%3E%0A%3Cp%3EHacher%20l%27oignon%20et%20l%27ail.Les%20faire%20revenir%20dans%20le%20beurre%20jusqu%27%C3%A0%20ce%20qu%27ils%20soient%20tendres.%3C%2Fp%3E%0A%3Ch5%3EEtape%202%3C%2Fh5%3E%0A%3Cp%3EAjouter%20les%20tomates%20coup%C3%A9es%20en%20d%C3%A9s%2C%20la%20viande%20hach%C3%A9e%2C%20la%20farine%2C%20du%20sel%2C%20du%20poivre%20et%20les%20herbes%20de%20Provence.%3C%2Fp%3E%0A%3Ch5%3EEtape%203%3C%2Fh5%3E%0A%3Cp%3EQuand%20tout%20est%20cuit%2C%20couper%20le%20feu%20et%20ajouter%20le%20jaune%20d%27oeuf%20et%20un%20peu%20de%20parmesan.%20Bien%20m%C3%A9langer.%3C%2Fp%3E%0A%3Ch5%3EEtape%204%3C%2Fh5%3E%0A%3Cp%3EPr%C3%A9chauffer%20le%20four%20%C3%A0%20200%C2%B0C%20%28thermostat%206-7%29.%3C%2Fp%3E%0A%3Ch5%3EEtape%205%3C%2Fh5%3E%0A%3Cp%3EEtaler%20au%20fond%20du%20plat%20%C3%A0%20gratin.%20Pr%C3%A9parer%20la%20pur%C3%A9e.%20L%27%C3%A9taler%20au%20dessus%20de%20la%20viande.%20Saupoudrer%20de%20fromage%20r%C3%A2p%C3%A9%20et%20faire%20gratiner.%3C%2Fp%3E%0A%3Ch5%3EEtape%206%3C%2Fh5%3E%0A%3Cp%3EBon%20app%C3%A9tit.%3C%2Fp%3E%20%20', 0, 1),
(14, '	\r\nimg%5Ccake.jpg', 'Cake%20au%20jambon%20et%20aux%20olives', '%3Ch3%3ECake%20au%20jambon%20et%20aux%20olives%3C%2Fh3%3E%0A%3Cp%3ENombre%20de%20personnes%20%3A%206%3C%2Fp%3E%0A%0A%3Ch3%3EIngr%C3%A9dients%3C%2Fh3%3E%0A%0A%3Cp%3E150%20g%20de%20farine%3C%2Fp%3E%0A%0A%3Cp%3E200%20g%20de%20jambon%3C%2Fp%3E%0A%0A%3Cp%3E150%20g%20d%27olive%20verte%20d%C3%A9noyaut%C3%A9es%3C%2Fp%3E%0A%0A%3Cp%3E75%20g%20de%20gruy%C3%A8re%20r%C3%A2p%C3%A9%3C%2Fp%3E%0A%0A%3Cp%3E4%20oeufs%3C%2Fp%3E%0A%0A%3Cp%3E10%20cl%20de%20lait%3C%2Fp%3E%0A%0A%3Cp%3E1%20sachet%20de%20levure%20chimique%3C%2Fp%3E%0A%0A%3Cp%3E1%20cuill%C3%A8re%20%C3%A0%20soupe%20d%27huile%3C%2Fp%3E%0A%0A%0A%3Cp%3ETEMPS%20TOTAL%20%3A%201H05%3C%2Fp%3E%0A%3Cp%3EPr%C3%A9paration%20%3A%2020%20min%3C%2Fp%3E%0A%3Cp%3ECuisson%20%3A%2045%20min%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%201%3C%2Fh5%3E%0A%3Cp%3EPr%C3%A9chauffer%20le%20four%20%C3%A0%20180%C2%B0C%20%28thermostat%206%29.%3C%2Fp%3E%0A%3Ch5%3EEtape%202%3C%2Fh5%3E%0A%3Cp%3ECouper%20les%20olives%20en%20rondelles%20et%20le%20jambon%20en%20morceaux.%3C%2Fp%3E%0A%3Ch5%3EEtape%203%3C%2Fh5%3E%0A%3Cp%3EVerser%20les%20oeufs%20dans%20la%20farine%20et%20m%C3%A9langer.%3C%2Fp%3E%0A%3Ch5%3EEtape%204%3C%2Fh5%3E%0A%3Cp%3EAjouter%20le%20jambon%2C%20les%20olives%20et%20le%20gruy%C3%A8re%20puis%20m%C3%A9langer.%3C%2Fp%3E%0A%3Ch5%3EEtape%205%3C%2Fh5%3E%0A%3Cp%3EAjouter%20la%20levure%20et%2C%20pour%20ne%20pas%20changer%2C%20m%C3%A9langer.%3C%2Fp%3E%0A%3Ch5%3EEtape%206%3C%2Fh5%3E%0A%3Cp%3EMettre%20le%20tout%20dans%20un%20plat%20%C3%A0%20cake%20au%20pr%C3%A9alable%20beurr%C3%A9%20et%20placer%20au%20four%2045%20min.%3C%2Fp%3E%20%20%0A%3Ch5%3EEtape%207%3C%2Fh5%3E%0A%3Cp%3EBon%20app%C3%A9tit%3C%2Fp%3E', 0, 1),
(15, '	\r\nimg%5Ccroissants.jpg', 'Petits%20croissants%20au%20saumon%20fum%C3%A9', '%3Ch3%3EPetits%20croissants%20au%20saumon%20fum%C3%A9%3C%2Fh3%3E%0A%3Cp%3ENombre%20de%20petits%20fours%20%3A%2016%3C%2Fp%3E%0A%0A%3Ch3%3EIngr%C3%A9dients%3C%2Fh3%3E%0A%0A%3Cp%3E1%20p%C3%A2te%20feuillet%C3%A9e%3C%2Fp%3E%0A%0A%3Cp%3E4%20tranches%20de%20saumon%20fum%C3%A9%3C%2Fp%3E%0A%0A%3Cp%3E2%20cuill%C3%A8res%20de%20lait%3C%2Fp%3E%0A%0A%0A%3Cp%3ETEMPS%20TOTAL%20%3A%2040%20min%3C%2Fp%3E%0A%3Cp%3EPr%C3%A9paration%20%3A%2015%20min%3C%2Fp%3E%0A%3Cp%3ECuisson%20%3A%2025%20min%3C%2Fp%3E%0A%0A%3Ch5%3EEtape%201%3C%2Fh5%3E%0A%3Cp%3EPr%C3%A9chauffer%20le%20four%20%C3%A0%20200%C2%B0C%20%28thermostat%206-7%29.%0ACouper%20votre%20rond%20de%20p%C3%A2te%20en%204%2C%20puis%20chaque%20quart%20en%204%3B%20ce%20qui%20fait%2016%20parts.%3C%2Fp%3E%0A%3Ch5%3EEtape%202%3C%2Fh5%3E%0A%3Cp%3EDisposer%20dessus%20des%20petits%20morceaux%20de%20saumon%20fum%C3%A9.%3C%2Fp%3E%0A%3Ch5%3EEtape%203%3C%2Fh5%3E%0A%3Cp%3ERouler%20chaque%20petite%20part%20en%20forme%20de%20petit%20croissant.%3C%2Fp%3E%0A%3Ch5%3EEtape%204%3C%2Fh5%3E%0A%3Cp%3EPasser%20un%20petit%20peu%20de%20lait%20dessus%2C%20et%20mettre%20%C3%A0%20four%2025%20min.%3C%2Fp%3E%0A%3Ch5%3EEtape%205%3C%2Fh5%3E%0A%3Cp%3EBon%20app%C3%A9tit%3C%2Fp%3E', 0, 1),
(16, '	\r\nimg%5Cgratin.jpg', 'Gratin%20dauphinois', '%3Ch3%3EGratin%20dauphinois%20%28recette%20originale%29%3C%2Fh3%3E%0A%3Cp%3ENombre%20de%20personnes%20%3A%205%3C%2Fp%3E%0A%0A%3Ch3%3EIngr%C3%A9dients%3C%2Fh3%3E%0A%0A%3Cp%3E1%20kg%20de%20pomme%20de%20terre%20belle%20de%20Fontenay%3C%2Fp%3E%0A%3Cp%3E1%20l%20de%20cr%C3%A8me%20liquide%3C%2Fp%3E%0A%3Cp%3E2%20gousses%20d%27ail%3C%2Fp%3E%0A%3Cp%3E2%20gousses%20d%27ail%3C%2Fp%3E%0A%3Cp%3ESel%2C%20Poivre%3C%2Fp%3E%0A%0A%0A%3Cp%3ETEMPS%20TOTAL%20%3A%201h30%3C%2Fp%3E%0A%3Cp%3EPr%C3%A9paration%20%3A%2030%20min%3C%2Fp%3E%0A%3Cp%3ECuisson%20%3A%201h%3C%2Fp%3E%0A%0A%0A%3Ch5%3EEtape%201%3C%2Fh5%3E%0A%3Cp%3EPr%C3%A9chauffer%20le%20four%20%C3%A0%20150%C2%B0C%20%28thermostat%205%29.%3C%2Fp%3E%0A%3Ch5%3EEtape%202%3C%2Fh5%3E%0A%3Cp%3EEplucher%20et%20couper%20les%20pommes%20de%20terres%20en%20rondelles.%0APresser%20l%27ail.%3C%2Fp%3E%0A%3Ch5%3EEtape%203%3C%2Fh5%3E%0A%3Cp%3ENapper%20le%20fond%20d%27un%20plat%20%C3%A0%20gratin%20de%20cr%C3%A8me.%3C%2Fp%3E%0A%3Ch5%3EEtape%204%3C%2Fh5%3E%0A%3Cp%3EAlterner%20une%20couche%20de%20pommes%20de%20terres%2C%20cr%C3%A8me%2C%20ail%2C%20sel%2C%20poivre%2C%3C%2Fp%3E%0A%3Ch5%3EEtape%205%3C%2Fh5%3E%0A%3Cp%3Ejusqu%27%C3%A0%20%C3%A9puisement%20des%20ingr%C3%A9dients.%3C%2Fp%3E%0A%3Ch5%3EEtape%206%3C%2Fh5%3E%0A%3Cp%3ETerminer%20en%20nappant%20de%20cr%C3%A8me%2C%20sel%2C%20poivre.%3C%2Fp%3E%0A%3Ch5%3EEtape%207%3C%2Fh5%3E%0A%3Cp%3EMettre%20au%20four%20pendant%20au%20moins%20une%20heure.%3C%2Fp%3E%0A%3Cp%3EPlus%20la%20temp%C3%A9rature%20est%20basse%20et%20le%20temps%20de%20cuisson%20long%2C%20plus%20les%20pommes%20seront%20fondantes...%3C%2Fp%3E%0A%3Ch5%3EEtape%208%3C%2Fh5%3E%0A%3Cp%3ED%C3%A9guster%3C%2Fp%3E%0A%0A', 0, 1),
(17, NULL, '8', '', 0, 1),
(18, NULL, '9', '', 0, 1),
(19, NULL, '10', '', 0, 1),
(20, NULL, '11', '', 0, 1),
(21, NULL, 'test', 'test', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPost` (`idPost`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategory` (`idCategory`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`);

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
