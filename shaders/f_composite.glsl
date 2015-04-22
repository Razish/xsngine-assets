#version 140

uniform sampler2D u_sceneTexture;

in vec2 texCoord;
in vec4 colour;

out vec4 out_FragColor;

void main() {
	out_FragColor = vec4( texture( u_sceneTexture, texCoord ).rgb, 1.0 );
}
