SELECT * 
FROM {{ source('raw', 'pathologies_fr') }}
WHERE NOT(region = 99)
AND NOT(dept='999')
AND NOT(libelle_sexe LIKE '%tous%sex%')
AND NOT (cla_age_5 LIKE '%tsage%')