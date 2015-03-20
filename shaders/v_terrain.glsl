#version 140

uniform PerFrame {
	mat4 u_ProjectionMatrix;
};

in vec2 in_Position;
in vec2 in_TexCoord;
in vec4 in_Colour;

out vec4 colour;
out vec2 texCoord;

void main() {
	gl_Position = u_ProjectionMatrix * vec4( in_Position, 1.0 );

	colour = in_Colour;
	texCoord = in_TexCoord;
}
