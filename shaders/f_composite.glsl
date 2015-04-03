#version 140

uniform sampler2D u_sceneTexture;
uniform sampler2D u_depthTexture;

in vec2 texCoord;
in vec4 colour;

out vec4 out_FragColor;

void main() {
	out_FragColor = vec4( texture( u_depthTexture, texCoord ).rgb, 1.0 );
}
