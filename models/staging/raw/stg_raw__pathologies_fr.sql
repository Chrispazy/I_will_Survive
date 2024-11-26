with 

source as (

    select * from {{ source('raw', 'pathologies_fr') }}

),

renamed as (

    select
        annee,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        cla_age_5,
        dept,
        ntop,
        npop,
        prev,
        niveau_prioritaire,
        libelle_sexe,
        tri

    from source

)

select * from renamed
