/*
 Get informations about the environment of the paths
 */
SELECT
    Abschnitt.name,
    Aussicht.name,
    Geräuschkulisse.name,
    Umgebung.name
FROM Weg
    JOIN Abschnitt on Weg.id = Abschnitt.weg_id
    JOIN Gegend on Gegend.id = Weg.gegend_id
    JOIN Aussicht on Aussicht.id = Gegend.aussicht_id
    JOIN Geräuschkulisse on Geräuschkulisse.id = Gegend.geräuschkulisse_id
    JOIN Umgebung on Umgebung.id = Gegend.umgebung_id;

/* Select the different sections of a given route */
SELECT
    Route.nummer,
    Abschnitt.nummer,
    Abschnitt.name
FROM Route
    JOIN Route_Abschnitt on Route.id = Route_Abschnitt.route_id
    JOIN Abschnitt on Route_Abschnitt.abschnitt_id = Abschnitt.id
WHERE route_id = 1;

/* Get all environments by name with a specific trail covering */
SELECT Abschnitt.name as Abschnittname, Abschnitt.weg_id FROM Abschnitt
    where weg_id in
        (SELECT Weg.id FROM Weg where belag_id in (SELECT id FROM Belag where Belag.id = 2));

/* Get owner name of a specific trail */
SELECT
    Weg.id,
    E.name
FROM Weg
    JOIN Eigentümer E on Weg.eigentümer_id = E.id
WHERE eigentümer_id = 2;

/* Get amount of all trails which are shorter than 500 meters */
SELECT COUNT(*) as `Anzahl Wanderwege` FROM Weg WHERE Weg.länge < 500;

/* Get all paths sorted by trail length. */
SELECT * FROM Weg ORDER BY Weg.länge DESC;
