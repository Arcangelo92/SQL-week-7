USE chinook;

-- ES. 1 -- Fate un elenco di tutte le tabelle.

SELECT * FROM ALBUM;
SELECT * FROM ARTIST;
SELECT * FROM CUSTOMER;
SELECT * FROM EMPLOYEE;
SELECT * FROM GENRE;
SELECT * FROM INVOICE;
SELECT * FROM INVOICELINE;
SELECT * FROM MEDIATYPE;
SELECT * FROM PLAYLIST;
SELECT * FROM PLAYLISTTRACK;
SELECT * FROM TRACK;

-- ES.1 -- Visualizzate le prime 10 righe della tabella Album.

SELECT * FROM ALBUM A
WHERE A.ALBUMID BETWEEN 1 AND 10;

-- ES.1 -- Trovate il numero totale di canzoni della tabella Tracks.

SELECT DISTINCT COUNT(TRACKID) FROM TRACK;

-- ES.1 -- Trovate i diversi generi presenti nella tabella Genre.

SELECT DISTINCT G.NAME AS GENERE FROM GENRE G;

-- ES.2 -- Recuperate il nome di tutte le tracce e del genere associato. 

SELECT T.NAME AS NOME_TRACCIA, G.NAME AS GENERE
FROM TRACK T
JOIN GENRE G ON T.GENREID = G.GENREID;

-- ES. 3 -- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?

SELECT A.NAME AS NOME_ARTISTA
FROM ARTIST A
LEFT JOIN ALBUM AL ON A.ARTISTID = AL.ARTISTID
WHERE AL.ALBUMID IS NULL;

-- ES.4 -- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. Esiste un modo per recuperare il nome della tipologia di media?

SELECT MEDIATYPE.NAME AS NOME_MEDIA, TRACK.NAME AS NOME_CANZONE, GENRE.NAME AS NOME_GENERE FROM MEDIATYPE
JOIN TRACK ON TRACK.MEDIATYPEID = MEDIATYPE.MEDIATYPEID
JOIN GENRE ON GENRE.GENREID = TRACK.GENREID
ORDER BY GENRE.NAME;

-- ES.5 -- Elencate i nomi di tutti gli artisti e dei loro album.

SELECT ARTIST.NAME AS ARTISTA, ALBUM.TITLE AS ALBUM FROM ARTIST
JOIN ALBUM ON ARTIST.ARTISTID = ALBUM.ALBUMID
ORDER BY ARTIST.NAME;
