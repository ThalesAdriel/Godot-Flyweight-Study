//Grid Shader By ThalesAdriel - https://github.com/ThalesAdriel
shader_type canvas_item;

uniform sampler2D svg_texture : source_color;
uniform float size : hint_range(1.0, 100.0) = 25.0;
uniform float speed : hint_range(0.0, 10.0) = 1.0;
uniform float direction_x : hint_range(-1.0, 1.0) = 1.0;
uniform float direction_y : hint_range(-1.0, 1.0) = 1.0;

void fragment() {
    vec2 pos = FRAGCOORD.xy / size;

    float time_offset = TIME * speed;
    vec2 direction = normalize(vec2(direction_x, direction_y));
    vec2 movement = direction * time_offset;

    vec2 moved_pos = pos - movement;
    vec2 grid = floor(moved_pos);
    float mask = mod(grid.x + mod(grid.y, 2.0), 2.0);

    vec2 cell_uv = fract(moved_pos);
    vec4 svg_sample = texture(svg_texture, cell_uv);

    // Only show SVG texture where mask == 1, else transparent
    COLOR = mix(vec4(0.0), svg_sample, mask);
}