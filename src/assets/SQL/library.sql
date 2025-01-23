-- Structure de la table `utilisateurs`
CREATE TABLE `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'utilisateur',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Déchargement des données de la table `utilisateurs`
INSERT INTO `utilisateurs` (`nom`, `prenom`, `email`, `mot_de_passe`, `role`) VALUES
('Admin', 'User', 'john@smith.com', '$2y$10$NtF5vd8V4JnqLdpTKRVZa.4UT8mQ.xe2.G96h3nzdv87WJ6W0yVCa', 'admin'),
('John', 'Doe', 'marc@lord.com', '$$2y$10$dvwo33oFFZUeTGHvPakiIOnVsms9qVZ21bcttQFCJRFGWm5yRbRlS', 'utilisateur');

-- Structure de la table `livres`
CREATE TABLE `livres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `auteur` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_publication` date NOT NULL,
  `isbn` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `statut` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'disponible',
  `photo_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Déchargement des données de la table `livres`
INSERT INTO `livres` (`titre`, `auteur`, `date_publication`, `isbn`, `description`, `statut`, `photo_url`) VALUES
('Developpement Web mobile avec HTML, CSS et JavaScript Pour les Nuls', 'William HARREL', '2023-11-09', 'DHIDZH1374R', 'Un livre indispensable à tous les concepteurs ou développeurs de sites Web pour iPhone, iPad, smartphones et tablettes ! Ce livre est destiné aux développeurs qui veulent créer un site Internet destiné aux plate-formes mobiles en adoptant les standards du Web que sont HTML, XHTML, les CSS et JavaScript.', 'emprunté', 'https://cdn.cultura.com/cdn-cgi/image/width=180/media/pim/82_metadata-image-20983225.jpeg');

-- Structure de la table `emprunts`
CREATE TABLE `emprunts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `livre_id` int NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs`(`id`),
  FOREIGN KEY (`livre_id`) REFERENCES `livres`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Déchargement des données de la table `emprunts`
INSERT INTO `emprunts` (`utilisateur_id`, `livre_id`, `date_emprunt`, `date_retour`) VALUES
(2, 1, '2023-11-10', NULL);