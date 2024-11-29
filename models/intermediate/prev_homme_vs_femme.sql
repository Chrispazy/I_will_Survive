SELECT
    libelle_sexe,
    ROUND(AVG(prev),2) AS prev,
FROM {{ ref('effectif_pathologies_clean') }}
GROUP BY libelle_sexe