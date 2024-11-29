SELECT
    cla_age_5,
    ROUND(AVG(prev),2) AS prev,
FROM {{ ref('effectif_pathologies_clean') }}
GROUP BY cla_age_5
ORDER BY cla_age_5 ASC