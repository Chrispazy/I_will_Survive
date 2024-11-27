SELECT 
    *
FROM {{ source('raw', 'comorbidites_fr') }}
