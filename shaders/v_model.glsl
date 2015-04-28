#version 140

uniform PerFrame {
	mat4 u_projectionMatrix;
	mat4 u_worldMatrix;
};

in vec3 in_position;
in vec3 in_normal;
in vec2 in_texCoord;

out vec2 texCoord;
out vec3 normal;
out vec3 worldPos;

void main() {
	gl_Position = u_projectionMatrix * vec4( in_position, 1.0 );

	texCoord = in_texCoord;
	normal = (u_worldMatrix * vec4( in_normal, 0.0 )).xyz;
	worldPos = (u_worldMatrix * vec4( in_position, 1.0 )).xyz;
}
