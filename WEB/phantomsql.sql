-- CHECK
CREATE TABLE emails (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- CHECK
CREATE TABLE tour (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    urlT VARCHAR(255),
    ubicacion VARCHAR(255) NOT NULL,
    escenario VARCHAR(255),
    artistasInvitados TEXT
);

-- CHECK
CREATE TABLE obras (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fechaSalida DATE NOT NULL,
    tipo ENUM("album", "EP") NOT NULL,
    duracion  TIME NOT NULL,
    portada VARCHAR(255) NOT NULL
);
-- CHECK
CREATE TABLE cancion ( 
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    duracion TIME NOT NULL,
    idAlbum INT(6) UNSIGNED,
    FOREIGN KEY (idAlbum) REFERENCES obras(id) ON DELETE CASCADE
);
-- 
CREATE TABLE merch (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cover_image VARCHAR(255) NOT NULL,
    urlM VARCHAR(255) NOT NULL
);

-- Tabla de ejemplo de tour. CHECK
INSERT INTO tour (fecha, urlT, ubicacion, escenario, artistasInvitados) VALUES
('2024-05-15', 'https://ticketmaster.com/', 'Madrid, España', 'Wanda Metropolitano', 'Thundercat'),
('2024-05-22', 'https://ticketmaster.com/', 'Barcelona, España', 'Estadi Olímpic Lluís Companys', 'RHCP'),
('2024-05-29', 'https://ticketmaster.com/', 'Lisboa, Portugal', 'Altice Arena', 'AC/DC'),
('2024-06-05', 'https://ticketmaster.com/', 'París, Francia', 'Stade de France', 'Green Day'),
('2024-06-12', 'https://ticketmaster.com/', 'Londres, Reino Unido', 'Wembley Stadium', ''),
('2024-06-19', 'https://ticketmaster.com/', 'Berlín, Alemania', 'Olympiastadion', 'Free Nationals'),
('2024-06-26', 'https://ticketmaster.com/', 'Ámsterdam, Países Bajos', 'Johan Cruijff Arena', ''),
('2024-07-03', 'https://ticketmaster.com/', 'Bruselas, Bélgica', 'King Baudouin Stadium', 'Jamiroquai'),
('2024-07-10', 'https://ticketmaster.com/', 'Milán, Italia', 'San Siro Stadium', 'Tom Misch'),
('2024-07-17', 'https://ticketmaster.com/', 'Roma, Italia', 'Stadio Olimpico', ''),
('2024-07-24', 'https://ticketmaster.com/', 'Viena, Austria', 'Ernst Happel Stadium', ''),
('2024-07-31', 'https://ticketmaster.com/', 'Praga, República Checa', 'Sinobo Stadium', 'Kendrick Lamar, Kanye West'),
('2024-08-07', 'https://ticketmaster.com/', 'Varsovia, Polonia', 'PGE Narodowy', 'Deftones'),
('2024-08-14', 'https://ticketmaster.com/', 'Budapest, Hungría', 'Puskás Aréna', 'Twenty One Pilots'),
('2024-08-21', 'https://ticketmaster.com/', 'Atenas, Grecia', 'OAKA Stadium', ''),
('2024-08-28', 'https://ticketmaster.com/', 'Estocolmo, Suecia', 'Friends Arena', 'Mac DeMarco'),
('2024-09-04', 'https://ticketmaster.com/', 'Copenhague, Dinamarca', 'Parken Stadium', 'Masayoshi Takanaka'),
('2024-09-11', 'https://ticketmaster.com/', 'Oslo, Noruega', 'Ullevål Stadium', ''),
('2024-09-18', 'https://ticketmaster.com/', 'Helsinki, Finlandia', 'Helsinki Olympic Stadium', 'Royal Blood'),
('2024-09-25', 'https://ticketmaster.com/', 'Dublín, Irlanda', 'Croke Park', 'Marcos Valle');

-- Tabla de ejemplo de obras. CHECK
INSERT into obras(nombre, fechaSalida, tipo, duracion, portada) VALUES  
('Phantom Pulse', '2016-10-31', 'Album', '00:46:30', '/img/album/phantomPulse.png'),
('Soulful Specters', '2018-02-17', 'EP', '00:23:51', '/img/album/soulfulSpecters.jpeg'),
('Front row to Apocalipsis', '2018-08-29', 'Album', '00:42:14', '/img/album/frontRow.jpeg'),
('Death Throne', '2020-06-25', 'Album', '00:53:11', '/img/album/deathThrone.jpeg'),
('Lost Melodies', '2021-03-22', 'EP', '00:24:00', '/img/album/lostMelodies.jpeg'),
('Haunting Harmonies', '2022-09-05', 'Album', '00:42:45', '/img/album/hauntingMemories.jpeg'),
('Whispers in the Dark', '2024-05-09', 'Album', '00:41:37', '/img/album/whispersDark.jpeg');

-- Tabla de ejemplos de canciones. CHECK
INSERT into cancion(nombre, duracion, idAlbum) VALUES
('Voidwalker', '00:05:12', 1),
('Spectral Echoes', '00:05:45', 1),
('Phantom Pulse', '00:04:35', 1),
('Lurking Shadows', '00:05:01', 1),
('Eternal Night', '00:07:32', 1),
('Ghostmasters', '00:06:20', 1),
('Heinous Heartbeat', '00:05:30', 1),
('Door Creak', '00:06:35', 1),
('Soulful Specters', '00:03:55', 2),
('5th MAY Of Death', '00:04:45', 2),
('Duke Ellington Tombstone', '00:05:10', 2),
('Fusion of Fear', '00:04:40', 2),
('Distant Lights', '00:05:21', 2),
('Shadow Stalker', '00:03:35', 3),
('Whispering Wraith', '00:04:22', 3),
('Lurking Shadows', '00:05:14', 3),
('Ghostly Apparition', '00:04:55', 3),
('Midnight Haunt', '00:06:30', 3),
('Haunted Pulse', '00:04:47', 3),
('Front row to Apocalipsis', '00:08:00', 3),
('Spectral Scream', '00:04:51', 3),
('Death Throne', '00:03:50', 4),
('Nebula Nightmare', '00:04:30', 4),
('Particle Phobia', '00:05:07', 4),
('Chamber of Doom', '00:04:20', 4),
('Atemporal Torment', '00:04:35', 4),
('Wave of Fear', '00:06:11', 4),
('Endless Loop ', '00:07:12', 4),
('Endless Loop', '00:05:39', 4),
('Soundscape of Shadows', '00:06:03', 4),
('Celestial Curse', '00:05:45', 4),
('Wave Runner', '00:03:40', 5),
('Soundscape', '00:04:25', 5),
('Pulse Wave', '00:05:00', 5),
('Sonic Boom', '00:04:45', 5),
('Echoes in the Deep', '00:06:10', 5),
('Astral Agony', '00:03:30', 6),
('Haunting Harmonies', '00:04:35', 6),
('Vengeful Spirits', '00:05:20', 6),
('Paradoxical Nightmare', '00:04:50', 6),
('Resonance', '00:06:01', 6),
('Dissonant Dread', '00:06:12', 6),
('Eerie Silence', '00:06:25', 6),
('Undead', '00:05:52', 6),
('Skeleton Bone', '00:03:25', 7),
('Whispers in the Dark', '00:04:40', 7),
('Red Eyes', '00:05:30', 7),
('Evil Within', '00:04:55', 7),
('Amorfophobia', '00:06:35', 7),
('Limpful and Cross-eyed', '00:06:12', 7),
('Damnings', '00:04:53', 7),
('Phantom-made Plasma', '00:05:27', 7);

-- Tabla de ejemplo de merch.
INSERT into merch(nombre, descripcion, precio, cover_image, urlM) VALUES 
('Camiseta Whispers In The Dark', 'Camiseta negra con logo','25,95','',''),
('Gorra Whispers In The Dark', 'Gorra azul con logo','15,95','',''),
('Sudadera Whispers In The Dark', 'Sudadera negra desgastada con logo','59,95','','')
('Chaqueta Whispers In The Dark', '','55,95','','');
