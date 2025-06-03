{%- import 'addressable.sv' as addressable with context -%}

{%- for node in top_node.descendants() -%}
 {%- if isinstance(node, FieldNode) -%}
  {%- if node is hw_writable and not node.get_property('next') and node is internal %}
    wire {{node.parent|full_array_ranges}}[{{node|bit_range(from_zero=True)}}] {{signal(node)}};
  {%- endif -%}

  {%- if node is hw_readable and node is internal %}
    wire {{node.parent|full_array_ranges}}[{{node|bit_range(from_zero=True)}}] {{signal(node)}};
  {%- endif -%}

 {%- endif -%}
{%- endfor %}
