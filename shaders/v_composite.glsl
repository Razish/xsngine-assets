#version 140

in vec2 in_Position;
in vec2 in_TexCoord;
in vec4 in_Colour;

out vec2 texCoord;
out vec4 colour;

void main() {
	gl_Position = vec4( in_Position, 0.0, 1.0 );

	texCoord = in_TexCoord;
	colour = in_Colour;
}
