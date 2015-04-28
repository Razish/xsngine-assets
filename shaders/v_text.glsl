#version 140

uniform PerFrame {
	mat4 u_projectionMatrix;
	mat4 u_worldMatrix;
};

in vec2 in_position;
in vec2 in_texCoord;
in vec4 in_colour;

out vec2 texCoord;
out vec4 colour;

void main() {
	gl_Position = u_projectionMatrix * vec4( in_position, 0.0, 1.0 );

	texCoord = in_texCoord;
	colour = in_colour;
}
