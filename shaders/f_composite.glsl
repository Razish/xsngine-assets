#version 140

uniform sampler2D u_sceneTexture;

in vec2 texCoord;
in vec4 colour;

out vec4 out_FragColor;

void main() {
	out_FragColor = texture( u_sceneTexture, texCoord ) * colour;
}
