WITH first_table AS (
    SELECT
        dept,
        cla_age_5,
        ROUND(AVG(prev),2) AS prev,
    FROM {{ ref('effectif_pathologies_clean') }}
    GROUP BY dept, cla_age_5
    ORDER BY dept ASC
)

SELECT
    dept,
    ROUND(AVG(CASE WHEN cla_age_5 = '00-04' THEN prev END), 2) AS _00_04,
    ROUND(AVG(CASE WHEN cla_age_5 = '05-09' THEN prev END), 2) AS _05_09,
    ROUND(AVG(CASE WHEN cla_age_5 = '10-14' THEN prev END), 2) AS _10_14,
    ROUND(AVG(CASE WHEN cla_age_5 = '15-19' THEN prev END), 2) AS _15_19,
    ROUND(AVG(CASE WHEN cla_age_5 = '20-24' THEN prev END), 2) AS _20_24,
    ROUND(AVG(CASE WHEN cla_age_5 = '25-29' THEN prev END), 2) AS _25_29,
    ROUND(AVG(CASE WHEN cla_age_5 = '30-34' THEN prev END), 2) AS _30_34,
    ROUND(AVG(CASE WHEN cla_age_5 = '35-39' THEN prev END), 2) AS _35_39,
    ROUND(AVG(CASE WHEN cla_age_5 = '40-44' THEN prev END), 2) AS _40_44,
    ROUND(AVG(CASE WHEN cla_age_5 = '45-49' THEN prev END), 2) AS _45_49,
    ROUND(AVG(CASE WHEN cla_age_5 = '50-54' THEN prev END), 2) AS _50_54,
    ROUND(AVG(CASE WHEN cla_age_5 = '55-59' THEN prev END), 2) AS _55_59,
    ROUND(AVG(CASE WHEN cla_age_5 = '60-64' THEN prev END), 2) AS _60_64,
    ROUND(AVG(CASE WHEN cla_age_5 = '65-69' THEN prev END), 2) AS _65_69,
    ROUND(AVG(CASE WHEN cla_age_5 = '70-74' THEN prev END), 2) AS _70_74,
    ROUND(AVG(CASE WHEN cla_age_5 = '75-79' THEN prev END), 2) AS _75_79,
    ROUND(AVG(CASE WHEN cla_age_5 = '80-84' THEN prev END), 2) AS _80_84,
    ROUND(AVG(CASE WHEN cla_age_5 = '85-89' THEN prev END), 2) AS _85_89,
    ROUND(AVG(CASE WHEN cla_age_5 = '90-94' THEN prev END), 2) AS _90_94,
    ROUND(AVG(CASE WHEN cla_age_5 = '95et+' THEN prev END), 2) AS _95_et_plus,
    -- ROUND(
    --     ((AVG(CASE WHEN cla_age_5 = 'hommes' THEN prev END) - AVG(CASE WHEN cla_age_5 = 'femmes' THEN prev END)) /
    --     AVG(CASE WHEN cla_age_5 = 'femmes' THEN prev END)) * 100,
    --     2
    -- ) AS percentage_difference
FROM first_table
GROUP BY dept
ORDER BY dept ASC