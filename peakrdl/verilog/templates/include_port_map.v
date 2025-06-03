{%- import 'addressable.sv' as addressable with context -%}

{%- for node in top_node.descendants() -%}
 {%- if isinstance(node, FieldNode) -%}
  {%- if node is hw_writable and not node.get_property('next') %}
    .{{signal(node)}}_wdata ({{signal(node)}}),
  {%- endif -%}

  {%- if node is hw_readable %}
    .{{signal(node)}}_q ({{signal(node)}}),
  {%- endif -%}

 {%- endif -%}
{%- endfor %}
