shader_type canvas_item;

uniform vec4 start_color: source_color;
uniform vec4 end_color: source_color;
uniform float perturb;

vec4 lerp(vec4 start, vec4 end, float t)
{
	vec4 ret;
	ret.r = (start.r + (end.r - start.r) * t);
	ret.g = (start.g + (end.g - start.g) * t);
	ret.b = (start.b + (end.b - start.b) * t);
	ret.a = (start.a + (end.a - start.a) * t);

	return ret;
}

void fragment() {
	COLOR = vec4(lerp(start_color, end_color, UV.x + perturb).rgb, texture(TEXTURE, UV).a);
}