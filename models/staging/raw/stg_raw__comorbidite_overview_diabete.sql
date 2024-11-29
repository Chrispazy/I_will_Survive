with 

source as (

    select * from {{ source('raw', 'comorbidite_overview_diabete') }}

),

renamed as (

    select
        annee,
        total_patients_with_comorbidity,
        diabetes_patients,
        diabetes_ratio

    from source

)

select * from renamed
