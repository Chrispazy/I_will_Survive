WITH first_table AS (
    SELECT
        dept,
        libelle_sexe,
        ROUND(AVG(prev),2) AS prev,
    FROM {{ ref('effectif_pathologies_clean') }}
    GROUP BY dept, libelle_sexe
    ORDER BY dept ASC
)

SELECT
    dept,
    ROUND(AVG(CASE WHEN libelle_sexe = 'hommes' THEN prev END), 2) AS hommes,
    ROUND(AVG(CASE WHEN libelle_sexe = 'femmes' THEN prev END), 2) AS femmes,
    ROUND(
        ((AVG(CASE WHEN libelle_sexe = 'hommes' THEN prev END) - AVG(CASE WHEN libelle_sexe = 'femmes' THEN prev END)) /
        AVG(CASE WHEN libelle_sexe = 'femmes' THEN prev END)) * 100,
        2
    ) AS percentage_difference
FROM first_table
GROUP BY dept
ORDER BY dept ASC