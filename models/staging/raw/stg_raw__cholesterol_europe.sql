with 

source as (

    select * from {{ source('raw', 'cholesterol_europe') }}

),

renamed as (

    select
        data_flow,
        last_update,
        freq,
        duration,
        hlthcare,
        sex,
        age,
        quant_inc,
        unit,
        geo,
        time_period,
        obs_value,
        obs_flag

    from source

)

select * from renamed
