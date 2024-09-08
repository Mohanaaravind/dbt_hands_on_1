{% macro time_travel(column,time_part = 'day',number = 30) %}
dateadd(
            {{ time_part }},
            {{ number }},
            {{ column }}
)
    
{% endmacro %}