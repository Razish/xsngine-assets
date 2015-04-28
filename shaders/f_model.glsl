#version 140

uniform sampler2D u_texture;

in vec2 texCoord;
in vec3 normal;
in vec3 worldPos;

out vec3 out_diffuse;
out vec3 out_normal;
out vec3 out_position;
out vec3 out_texCoord;

void main() {
	out_diffuse = texture( u_texture, texCoord ).rgb;
	out_normal = normalize( normal );
	out_position = worldPos;
	out_texCoord = vec3( texCoord, 0.0 );
}
