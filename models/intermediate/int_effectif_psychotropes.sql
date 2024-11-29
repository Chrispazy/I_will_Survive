SELECT *,
       CAST(CONCAT(annee, '-01-01') AS DATE) AS date
FROM {{ ref('stg_raw__pathologies_fr') }}
WHERE patho_niv1 = 'Traitements psychotropes (hors pathologies)'