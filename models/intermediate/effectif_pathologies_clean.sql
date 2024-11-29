SELECT 
    annee,
    patho_niv1,
    patho_niv2,
    patho_niv3,
    CASE 
        WHEN cla_age_5 = '05-sept' THEN '05-09'
        WHEN cla_age_5 = 'oct-14' THEN '10-14'
        ELSE cla_age_5
    END AS cla_age_5,
    dept,
    ntop,
    npop,
    prev,
    libelle_sexe
FROM {{ ref('stg_raw__pathologies_fr') }}
WHERE patho_niv1 = 'Maladies cardioneurovasculaires'
    AND libelle_sexe <> 'tous sexes'
    AND cla_age_5 <> 'tsage'
    AND dept <> '999'
