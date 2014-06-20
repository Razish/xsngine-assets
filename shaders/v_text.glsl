#version 140

uniform PerFrame {
	mat4 u_ProjectionMatrix;
	mat4 u_ViewMatrix;
};

in vec2 in_Position;
in vec2 in_TexCoord;
in vec4 in_Color;

out vec4 color;
out vec2 texCoord;

void main() {
	gl_Position = u_ProjectionMatrix * vec4( in_Position, 0.0, 1.0 );

	color = in_Color;
	texCoord = in_TexCoord;
}
