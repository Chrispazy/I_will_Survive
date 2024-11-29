SELECT
    dept,
    ROUND(AVG(prev),2) AS prev,
FROM {{ ref('effectif_pathologies_clean') }}
GROUP BY dept
ORDER BY dept ASC