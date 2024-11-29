SELECT
    dept,
    ROUND(AVG(prev),2) AS prev,
    CASE
        WHEN dept = '01' THEN 'Ain'
        WHEN dept = '02' THEN 'Aisne'
        WHEN dept = '03' THEN 'Allier'
        WHEN dept = '04' THEN 'Alpes-de-Haute-Provence'
        WHEN dept = '05' THEN 'Hautes-Alpes'
        WHEN dept = '06' THEN 'Alpes-Maritimes'
        WHEN dept = '07' THEN 'Ardèche'
        WHEN dept = '08' THEN 'Ardennes'
        WHEN dept = '09' THEN 'Ariege'
        WHEN dept = '10' THEN 'Aube'
        WHEN dept = '11' THEN 'Aude'
        WHEN dept = '12' THEN 'Aveyron'
        WHEN dept = '13' THEN 'Bouches-du-Rhône'
        WHEN dept = '14' THEN 'Calvados'
        WHEN dept = '15' THEN 'Cantal'
        WHEN dept = '16' THEN 'Charente'
        WHEN dept = '17' THEN 'Charente-Maritime'
        WHEN dept = '18' THEN 'Cher'
        WHEN dept = '19' THEN 'Corrèze'
        WHEN dept = '21' THEN 'Côte-d’Or'
        WHEN dept = '22' THEN 'Côtes-d’Armor'
        WHEN dept = '23' THEN 'Creuse'
        WHEN dept = '24' THEN 'Dordogne'
        WHEN dept = '25' THEN 'Doubs'
        WHEN dept = '26' THEN 'Drôme'  
        WHEN dept = '27' THEN 'Eure'
        WHEN dept = '28' THEN 'Eure-et-Loir'
        WHEN dept = '29' THEN 'Finistère'
        WHEN dept = '30' THEN 'Gard'
        WHEN dept = '31' THEN 'Haute-Garonne'
        WHEN dept = '32' THEN 'Gers'
        WHEN dept = '33' THEN 'Gironde'
        WHEN dept = '34' THEN 'Hérault'
        WHEN dept = '35' THEN 'Ille-et-Vilaine'
        WHEN dept = '36' THEN 'Indre'
        WHEN dept = '37' THEN 'Indre-et-Loire'
        WHEN dept = '38' THEN 'Isère'
        WHEN dept = '39' THEN 'Jura'
        WHEN dept = '40' THEN 'Landes'
        WHEN dept = '41' THEN 'Loir-et-Cher'
        WHEN dept = '42' THEN 'Loire'
        WHEN dept = '43' THEN 'Haute-Loire'
        WHEN dept = '44' THEN 'Loire-Atlantique'
        WHEN dept = '45' THEN 'Loiret'
        WHEN dept = '46' THEN 'Lot'
        WHEN dept = '47' THEN 'Lot-et-Garonne'
        WHEN dept = '48' THEN 'Lozère'
        WHEN dept = '49' THEN 'Maine-et-Loire'
        WHEN dept = '50' THEN 'Manche'
        WHEN dept = '51' THEN 'Marne'
        WHEN dept = '52' THEN 'Haute-Marne'
        WHEN dept = '53' THEN 'Mayenne'
        WHEN dept = '54' THEN 'Meurthe-et-Moselle'
        WHEN dept = '55' THEN 'Meuse'
        WHEN dept = '56' THEN 'Morbihan'
        WHEN dept = '57' THEN 'Moselle'
        WHEN dept = '58' THEN 'Nièvre'
        WHEN dept = '59' THEN 'Nord'
        WHEN dept = '60' THEN 'Oise'
        WHEN dept = '61' THEN 'Orne'
        WHEN dept = '62' THEN 'Pas-de-Calais'
        WHEN dept = '63' THEN 'Puy-de-Dôme'
        WHEN dept = '64' THEN 'Pyrénées-Atlantiques'
        WHEN dept = '65' THEN 'Hautes-Pyrénées'
        WHEN dept = '66' THEN 'Pyrénées-Orientales'
        WHEN dept = '67' THEN 'Bas-Rhin'
        WHEN dept = '68' THEN 'Haut-Rhin'
        WHEN dept = '69' THEN 'Rhône'
        WHEN dept = '70' THEN 'Haute-Saône'
        WHEN dept = '71' THEN 'Saône-et-Loire'
        WHEN dept = '72' THEN 'Sarthe'
        WHEN dept = '73' THEN 'Savoie'
        WHEN dept = '74' THEN 'Haute-Savoie'
        WHEN dept = '75' THEN 'Paris'
        WHEN dept = '76' THEN 'Seine-Maritime'
        WHEN dept = '77' THEN 'Seine-et-Marne'
        WHEN dept = '78' THEN 'Yvelines'
        WHEN dept = '79' THEN 'Deux-Sèvres'
        WHEN dept = '80' THEN 'Somme'
        WHEN dept = '81' THEN 'Tarn'
        WHEN dept = '82' THEN 'Tarn-et-Garonne'
        WHEN dept = '83' THEN 'Var'
        WHEN dept = '84' THEN 'Vaucluse'
        WHEN dept = '85' THEN 'Vendée'
        WHEN dept = '86' THEN 'Vienne'
        WHEN dept = '87' THEN 'Haute-Vienne'
        WHEN dept = '88' THEN 'Vosges'
        WHEN dept = '89' THEN 'Yonne'
        WHEN dept = '90' THEN 'Territoire de Belfort'
        WHEN dept = '91' THEN 'Essonne'
        WHEN dept = '92' THEN 'Hauts-de-Seine'
        WHEN dept = '93' THEN 'Seine-Saint-Denis'
        WHEN dept = '94' THEN 'Val-de-Marne'
        WHEN dept = '95' THEN 'Val_d_Oise'
        WHEN dept = '971' THEN 'Guadeloupe'
        WHEN dept = '972' THEN 'Martinique'
        WHEN dept = '973' THEN 'Guyane'
        WHEN dept = '974' THEN 'La Réunion'
        WHEN dept = '976' THEN 'Mayotte'
        WHEN dept = '2A' THEN 'Corse du Sud'
        WHEN dept = '2B' THEN 'Corse du Nord'
    END AS nom_departement,
FROM {{ ref('effectif_pathologies_clean') }}
WHERE dept != '971'
    AND dept != '972'
    AND dept != '973'
    AND dept != '974'
    AND dept != '976'
GROUP BY dept
ORDER BY dept ASC
