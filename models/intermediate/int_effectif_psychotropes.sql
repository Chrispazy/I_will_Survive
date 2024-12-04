SELECT 
    patho_niv1, 
    npop, 
    libelle_sexe as sexe,
    prev,
    CAST(CONCAT(annee, '-01-01') AS DATE) AS date,
    CASE 
        WHEN patho_niv2 IS NULL THEN 'Psychotropes généraux'
        WHEN patho_niv2 LIKE 'Traitements antidépresseurs ou régulateurs%' THEN 'Antidépresseurs'
        WHEN patho_niv2 = 'Traitements anxiolytiques (hors pathologies)' THEN 'Anxiolytiques'
        WHEN patho_niv2 = 'Traitements neuroleptiques (hors pathologies)' THEN 'Neuroleptiques'
        WHEN patho_niv2 = 'Traitements hypnotiques (hors pathologies)' THEN 'Hypnotiques'
        ELSE patho_niv2
    END AS patho_niv2
FROM 
    {{ ref('stg_raw__pathologies_fr') }}
WHERE 
    patho_niv1 = 'Traitements psychotropes (hors pathologies)'
    AND prev IS NOT NULL
    AND libelle_sexe <> 'tous sexes'
    AND cla_age_5 <> 'tsage'
    AND dept <> '999'