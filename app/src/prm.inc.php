<?php
/****************************************************************************************
 * SMI (Services Maintenance Interventions) est une gestion libre de maintenance et de SAV
 *
 * Version 1.0.3
 *
 * Copyright (C) 2006-2015  Sylvain FATOME
 * This program is free software; you can redistribute it and/or modify it under the terms
 * of the GNU General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program
 * (in the directory docs);
 * if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301, USA.
 *
 * Contact : galawa@free.fr
 *
 * Web : http://smi.no-ip.org
 ****************************************************************************************/


// Vérification des tentatives de hack
$pos = strpos($_SERVER['PHP_SELF'], 'inc.php');
if ($pos !== FALSE) {
    header('Location: ../index.php');
}

//////////////////////////////////////////////////////////////////////////////////
/// Vous pouvez modifier ces variables en fonction de votre configuration      ///
//////////////////////////////////////////////////////////////////////////////////

/************************************************/
/**        Language de l'application           **/
/************************************************/

// Language par défaut de l'application (pris sur le browser)
$lng_appli = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);


/************************************************/
/**        Fuseau Horaire du serveur           **/
/************************************************/
date_default_timezone_set('africa/algiers');

/**************************************************/
/**        Répertoire de l'application           **/
/**************************************************/

define('REP', 'smi');    // Répertoire de l'application

$rep_appli = $racine_web . '/' . REP;        // Chemin web absolu vers l'application

/*******************************************/
/**        Nom de la base MySQL           **/
/*******************************************/

define('DBNAME', 'smi');                // Nom de la base de données
define('PREFIXE', 'smi');                // Préfixe des noms des tables

/*************************************************************/
/**               Constantes des bases MySQL                **/
/*************************************************************/

// login/mot de passe Administrateur par défaut (créé la 1ère fois)

$admin_code = 'admino';            // Code 'Administrateur'
$admin_mdp = 'admino2023';                // Mot de passe 'Administrateur'


// Constantes de connexion à la base MySQL

define('DBUSER', 'wwwrun');                // Utilisateur MySQL
define('DBPASS', 'root');        // Mot de Passe pour MySQL
define('DBHOST', 'samplex_db_1');        // Adresse IP du serveur MySQL


/****************************************************/
/**        Variables des téléchargements           **/
/****************************************************/

/*************************************************************/
/** Constantes et variables pour la gestion des icônes      **/
/** pour les statuts et des logos pour les agences,         **/
/** et les applications complémentaires                     **/
/*************************************************************/

// Constantes & Variables des répertoires pour les fichiers internes et téléchargés, et les sauvegardes

//$url_gfc = $root . REP . 'telechgt/fictec';                // Chemin REEL complet pour la gestion des fichiers techniques
$url_gfc = '/var/www/html/smi/telechgt/fictec';				// Chemin REEL complet pour la gestion des fichiers techniques
//$url_tfc = '/var/www/html/smi/telechgt/fictec/';                    // Chemin REEL depuis la racine pour le téléchargement des
// fichiers techniques
//$url_svg = $root . 'svg/';                        // Chemin REEL vers le répertoire des sauvegardes
$url_svg = '/var/www/html/smi/svg/';						// Chemin REEL vers le répertoire des sauvegardes

// Extensions autorisées
$extensions_ok = ['.png', '.zip', '.pdf', '.7z', '.txt', '.csv', '.rtf', '.wk1', '.wks', '.123', '.iso', '.xls', '.doc',
    '.ods', '.odt', '.odg', '.odp', '.odb', '.sxw', '.sxi', '.sti', '.sxd', '.gz', '.tar', '.gif', '.rar', '.arj', '.jpg', '.ppt', '.exe', '.jpg',
    '.gif', '.bmp'];

// Tailles maximum (en octets) des fichiers pouvant être téléchargés
// (Pensez à contrôler votre PHP.INI)
$taille_maxi_admin = 1024 * 6000;
$taille_maxi_cge = 1024 * 6000;
$taille_maxi_age = 1024 * 3000;
$taille_maxi_tec = 1024 * 2000;

/*******************************************/
/**        Variables des icônes           **/
/*******************************************/

// Constantes & Variables des répertoires icônes et images

/***********[ TRES TRES IMPORTANT SOUS LINUX !!! ]***************/
/**                                                            **/
/** pensez à changer le propriétaire du répertoire des icônes  **/
/** en le passant sous le même propriétaire que celui qui      **/
/** exécute les scripts, sinon, rien ne s'affichera.           **/
/** Par exemple 'chown wwwrun /srv/www/htdocs/maint/icones'    **/
/**                                                            **/
/****************************************************************/

$chemin_icones = '../icones';                    // Chemin relatif vers les icônes
$url_logos = $rep_appli . '/logos';                // Chemin complet vers le dossier de stockage des logos
$chemin_logos = '../logos';                        // Chemin relatif vers les logos
$cheminr_logos = $root . REP . '/logos';            // Chemin REEL vers les logos
$chemin_images = '../img';                        // Chemin relatif vers les images

/*************************************************************/
/**        Constantes & Variables pour les emails           **/
/*************************************************************/

$admin_name = 'cutopia';                // Nom de l'Administrateur
$admin_mail = 'abdelhakimzouai@gmail.com';            // Email de l'Administrateur

// Coordonnées du serveur smtp de votre FAI

$smtp_nom = '';            // Nom du serveur SMTP
// Vous pouvez en donner plusieurs (séparez-les avec des ';')
$smtp_port = 25;                        // Port du serveur SMTP
$smtp_login = '';                        // Login du serveur SMTP (si serveur avec authentification...laisser vide si pas d'authentification)
$smtp_mdp = '';                            // Mot de passe du serveur SMTP (si serveur avec authentification...laisser vide si pas d'authentification)
$smtp_pausem = 5;                        // Pause en secondes entre chaque envoi de mail (emailings)
$smtp_secure = '';                        // Mode de sécurité SMTP ('ssl', 'tls', ou rien)
// SMI n'en tien compte que s'il y a un login
$pop_before = false;                    // Si true, on fait un 'POP before SMTP', sinon rien
$pop_nom = '';                            // Non du serveur POP3 (SMI n'en tient compte que si 'POP before STMP')
$pop_port = 110;                        // Port du serveur POP3 (SMI n'en tient compte que si 'POP before STMP')
$pop_timeout = 30;                        // Time Out du serveur POP3 (SMI n'en tient compte que si 'POP before STMP')
$pop_login = '';                        // Login du serveur POP3 (SMI n'en tient compte que si 'POP before STMP')
$pop_mdp = '';                            // Mot de passe du serveur POP3 (SMI n'en tient compte que si 'POP before STMP')


/***************************************************/
/**        Applications complémentaires           **/
/***************************************************/

$url_cal = '';                                    // Racine de l'application calendrier / agenda
$url_fac = '';                                    // Racine de l'application facturation
$url_facc = '';                                    // Racine de l'application facturation client
