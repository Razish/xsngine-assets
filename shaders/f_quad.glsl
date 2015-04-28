#version 140

uniform sampler2D u_texture;

in vec2 texCoord;
in vec4 colour;

out vec4 out_fragColor;

void main() {
	out_fragColor = vec4( colour.rgb, 1.0 );
}
