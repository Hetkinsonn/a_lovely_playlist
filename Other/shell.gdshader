shader_type canvas_item;

uniform float speed = 0.0;
uniform float height = 20.0;

void fragment() {
	vec4 test = texture(TEXTURE,UV + vec2(0,sin(TIME*speed+UV.x*12.5)/height));
	COLOR = test;
}

