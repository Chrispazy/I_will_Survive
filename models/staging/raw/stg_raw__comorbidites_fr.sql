with 

source as (

    select * from {{ source('raw', 'comorbidites_fr') }}

),

renamed as (

    select
        annee,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        top_,
        comorbidite,
        libelle_comorbidite,
        region,
        dept,
        ncomorb,
        ntop,
        proportion_comorb,
        patho_niv2_comorb,
        patho_niv3_comorb,
        patho_niv1_comorb,
        niveau_prioritaire

    from source

)

select * from renamed
