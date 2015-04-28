#version 140

uniform sampler2D u_viewTexture;

in vec2 texCoord;
in vec4 colour;

out vec4 out_fragColor;

void main() {
	vec3 view = texture( u_viewTexture, texCoord ).rgb;
	out_fragColor = vec4( view, 1.0 );
}
