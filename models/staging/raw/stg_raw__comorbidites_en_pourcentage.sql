with 

source as (

    select * from {{ source('raw', 'comorbidites_en_pourcentage') }}

),

renamed as (

    select
        comorbidite,
        comorbidity_count,
        total_count,
        pourcentage

    from source

)

select * from renamed
