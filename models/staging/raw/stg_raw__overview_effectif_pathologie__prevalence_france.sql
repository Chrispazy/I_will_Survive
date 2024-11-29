with 

source as (

    select * from {{ source('raw', 'overview_effectif_pathologie__prevalence_france') }}

),

renamed as (

    select
        patho_niv1,
        prevalence_percentage

    from source

)

select * from renamed
