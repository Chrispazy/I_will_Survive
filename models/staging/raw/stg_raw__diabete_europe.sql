with 

source as (

    select * from {{ source('raw', 'diabete_europe') }}

),

renamed as (

    select
        data_flow,
        last_update,
        freq,
        unit,
        hlth_pb,
        age,
        sex,
        geo,
        time_period,
        obs_value,
        obs_flag

    from source

)

select * from renamed
