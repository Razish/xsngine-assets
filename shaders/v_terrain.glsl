#version 140

uniform PerFrame {
	mat4 u_projectionMatrix;
	mat4 u_worldMatrix;
};

in vec3 in_position;
in vec2 in_texCoord;
in vec4 in_colour;

out vec4 colour;
out vec2 texCoord;

void main() {
	gl_Position = u_projectionMatrix * vec4( in_position, 1.0 );

	colour = in_colour;
	texCoord = in_texCoord;
}
