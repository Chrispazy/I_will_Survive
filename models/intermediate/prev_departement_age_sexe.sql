SELECT
    dept,
    cla_age_5,
    libelle_sexe,
    ROUND(AVG(prev),2) AS prev,
FROM {{ ref('effectif_pathologies_clean') }}
GROUP BY dept, cla_age_5, libelle_sexe
ORDER BY dept, cla_age_5 ASC