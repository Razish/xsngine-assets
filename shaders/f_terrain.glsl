#version 140

uniform sampler2D u_Texture;

in vec4 colour;
in vec2 texCoord;

out vec4 out_FragColor;

void main() {
	out_FragColor = vec4( texture( u_Texture, texCoord ).rgb, 1.0 );
}
