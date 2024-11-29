WITH first_table AS (
    SELECT
        cla_age_5,
        libelle_sexe,
        ROUND(AVG(prev),2) AS prev,
    FROM {{ ref('effectif_pathologies_clean') }}
    GROUP BY cla_age_5, libelle_sexe
    ORDER BY cla_age_5 ASC
)

SELECT
    cla_age_5,
    ROUND(AVG(CASE WHEN libelle_sexe = 'hommes' THEN prev END), 2) AS hommes,
    ROUND(AVG(CASE WHEN libelle_sexe = 'femmes' THEN prev END), 2) AS femmes,
    ROUND(
        ((AVG(CASE WHEN libelle_sexe = 'hommes' THEN prev END) - AVG(CASE WHEN libelle_sexe = 'femmes' THEN prev END)) /
        AVG(CASE WHEN libelle_sexe = 'femmes' THEN prev END)) * 100,
        2
    ) AS percentage_difference
FROM first_table
GROUP BY cla_age_5
ORDER BY cla_age_5 ASC