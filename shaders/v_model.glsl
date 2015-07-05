#version 140

uniform PerFrame {
	mat4 u_ProjectionMatrix;
};

uniform vec3 u_Position; // world space
in vec3 in_Position; // local space
in vec3 in_Normal;
in vec2 in_TexCoord;

out vec2 texCoord;
out vec3 normal;

void main() {
	// u_Position is world space
	// in_Position is local space
	gl_Position = u_ProjectionMatrix * vec4( u_Position + in_Position, 1.0 );

	texCoord = in_TexCoord;
	normal = in_Normal;
}
