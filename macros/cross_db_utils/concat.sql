{% macro concat(fields) %}
  {{ adapter_macro('dbt_utils.concat', fields) }}
{% endmacro %}


{% macro default__concat(fields) -%}
	{% if fields|length > 1 %}
    concat({{ fields|join(', ') }})
	{% else %}
	{{ fields|join(', ') }}
	{% endif %}	
{%- endmacro %}


{% macro alternative_concat(fields) %}
    {{ fields|join(' || ') }}
{% endmacro %}


{% macro redshift__concat(fields) %}
    {{dbt_utils.alternative_concat(fields)}}
{% endmacro %}


{% macro snowflake__concat(fields) %}
    {{dbt_utils.alternative_concat(fields)}}
{% endmacro %}
