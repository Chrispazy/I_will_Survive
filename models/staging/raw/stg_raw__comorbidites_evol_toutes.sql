with 

source as (

    select * from {{ source('raw', 'comorbidites_evol_toutes') }}

),

renamed as (

    select
        annee,
        patho_niv1_comorb,
        comorbidity_patients,
        total_patients_with_comorbidity,
        ratio

    from source

)

select * from renamed
