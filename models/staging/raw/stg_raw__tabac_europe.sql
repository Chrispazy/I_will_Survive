with 

source as (

    select * from {{ source('raw', 'tabac_europe') }}

),

renamed as (

    select
        data_flow,
        last_update,
        freq,
        unit,
        smoking,
        isced11,
        sex,
        age,
        geo,
        time_period,
        obs_value,
        obs_flag

    from source

)

select * from renamed
