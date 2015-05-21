#version 140

uniform sampler2D u_Texture;

in vec3 normal;
in vec2 texCoord;

out vec4 out_FragColor;

void main() {
	vec3 textureColour = texture( u_Texture, texCoord ).rgb;

	// global light source, i.e. the sun
	vec3 directionalColour = vec3( 1.0, 0.5, 0.5 );
	float directionalLight = max(
		0.0,
		dot(
			normalize( normal.xyz ),
			vec3( 1.0, 1.0, 0.0 )
		)
	);

	vec3 ambientColour = vec3( 0.1, 0.1, 0.1 );
	float ambientIntensity = 0.5;

	vec3 colour =
		// ambient
		ambientColour * textureColour +
		// directional
		textureColour * directionalColour * directionalLight;

	out_FragColor = vec4( colour, 1.0 );
}
