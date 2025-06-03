{%- import 'addressable.sv' as addressable with context -%}

{%- for node in top_node.descendants() -%}
 {%- if isinstance(node, FieldNode) -%}
  {%- if node is hw_writable and not node.get_property('next') and node is not internal %}
    input  logic {{node.parent|full_array_ranges}}[{{node|bit_range(from_zero=True)}}] {{signal(node)}},
  {%- endif -%}

  {%- if node is hw_readable and node is not internal %}
    output logic {{node.parent|full_array_ranges}}[{{node|bit_range(from_zero=True)}}] {{signal(node)}},
  {%- endif -%}

 {%- endif -%}
{%- endfor %}
