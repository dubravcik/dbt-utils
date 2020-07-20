{% macro hash(field) -%}
  {{ adapter_macro('dbt_utils.hash', field) }}
{%- endmacro %}


{% macro default__hash(field) -%}
    md5(cast({{field}} as {{dbt_utils.type_string()}}))
{%- endmacro %}


{% macro bigquery__hash(field) -%}
    to_hex({{dbt_utils.default__hash(field)}})
{%- endmacro %}


{% macro sqlserver__hash(field) -%}
    CONVERT(VARCHAR(32), HashBytes('MD5',  cast({{field}} as varchar )), 2)
{%- endmacro %}
