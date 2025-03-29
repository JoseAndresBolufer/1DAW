-- 1.
SELECT *
FROM comarques
ORDER BY nom_comarca ASC --763 Ordenades

-- 2.
SELECT *
FROM comarques
WHERE provincia = 'Teruel'; --10 resultats

--3.
SELECT nom_comarca
FROM comarques
WHERE provincia = 'Alicante'; --9 resultats sense que ixca alicante

--4.
SELECT p.nom, p.nhabitants
FROM poblacions p, comarques c
WHERE provincia = 'Alicante'
	AND p.nom_comarca = c.nom_comarca; --106 resultats (he tingut que mirar per entendre les relacions)

--5.
SELECT p.nom, p.nhabitants
FROM poblacions p, comarques c
WHERE provincia = 'Alicante'
	AND p.nom_comarca = c.nom_comarca
ORDER BY p.nhabitants DESC --106 resultats ordenats de mes a menys

--6.
SELECT *
FROM instituts
WHERE localitat = 'Benidorm'; --7 resultats

--7.
SELECT i.nom, i.localitat, i.num_estudiants
FROM instituts i, poblacions p
WHERE nom_comarca = 'Marina Baja'
	AND i.localitat = p.nom; --12 resultats

--8.
SELECT i.nom, i.localitat, i.num_estudiants
FROM instituts i, poblacions p, comarques c
WHERE provincia = 'Alicante'
	AND i.localitat = p.nom
	and p.nom_comarca = c.nom_comarca; --181 resultats (I SENSE MIRAR OLEEEE)

--9.
SELECT nom, codi, localitat
FROM instituts
WHERE localitat LIKE 'B%'; --32 resultats (m'ha costat aplicar el LIKE '' perq no sabia que anava entre cometes)

--10.
SELECT i.nom, i.codi, i.localitat, i.num_estudiants
FROM instituts i
WHERE localitat LIKE 'A%'
	AND num_estudiants < 500; --43 resultats (este ha sigut fàcil aplicant la lògica amb l'exemple d'abans)

--11.
SELECT nom, llengua, nom_comarca
FROM poblacions
WHERE nom_comarca IN ('Marina Baja', 'Marina Alta', 'Safor'); --80 resultats. He tingut que preguntar a chatgpt per vore que feia falta un IN, després llevar el = que havia abans

--12.
SELECT i.nom, i.localitat, p.llengua, p.nom_comarca
FROM instituts i, poblacions p
WHERE i.localitat = p.nom
	AND p.nom_comarca IN ('Marina Baja', 'Marina Alta', 'Safor')
	AND i.num_estudiants BETWEEN 100 AND 300; --9 resultats. He entes que sempre, en el cas d'utilitzar 2 o més tables, les he de relacionar primer en el WHERE i a continuació fer les consultes necesaries 

--13.
SELECT nom, localitat
FROM instituts
WHERE nom LIKE '%SAN %' --26 he tingut que mirar el resultat, perqúe sense el () ixien mes resultats dels demanats. Val, acabe de veure que no havia posat espai despres de SAN, i aixo feia que si ixien les lletres SAN també apareixien resultats
--El que em fa preguntarme, hi ha algun problema si no gaste ()??

--14.
SELECT localitat
FROM instituts
WHERE nom LIKE '%SAN %'
GROUP BY localitat
ORDER BY localitat ASC; --ORDER BY ha d'anar després de GROUP BY per que no done error. També he llevat nom perqué no necesite que ixca no, i al estar en (FROM instituts), ja pot llegir la columna nom sense tindre que mostrar-la