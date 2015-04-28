#version 140

uniform sampler2D u_diffuseTexture;
uniform sampler2D u_normalTexture;
uniform sampler2D u_positionTexture;
uniform sampler2D u_texCoordTexture;

in vec2 texCoord;
in vec4 colour;

out vec4 out_fragColor;

void main() {
	vec3 diffuse = texture( u_diffuseTexture, texCoord ).rgb;
	vec3 normal = texture( u_normalTexture, texCoord ).rgb;
	vec3 worldPos = texture( u_positionTexture, texCoord ).rgb;
	vec2 st = texture( u_texCoordTexture, texCoord ).rg;

	out_fragColor = vec4( diffuse, 1.0 );
}
