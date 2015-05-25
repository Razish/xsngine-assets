#version 140

uniform sampler2D u_grassTexture;
uniform sampler2D u_dirtTexture;
uniform sampler2D u_snowTexture;

uniform float u_avgPoint;
uniform float u_highPoint;

in float height;
in vec3 normal;
in vec2 texCoord;

out vec4 out_FragColor;

void main() {
	vec2 range = vec2( u_avgPoint, u_highPoint );
	vec2 tc = mod( texCoord * 8.0, 0.99 );

	vec3 grass = texture( u_grassTexture, tc ).rgb;
	vec3 dirt = texture( u_dirtTexture, tc ).rgb;
	vec3 snow = texture( u_snowTexture, tc ).rgb;

	// steep surfaces tend toward dirt, from grass
	float incline = max(
		0.0,
		dot(
			normalize( normal.xyz ),
			vec3( 0.0, 1.0, 0.0 )
		)
	);
	vec3 textureColour = mix( dirt, grass, clamp( incline * 0.66666, 0.0, 1.0 ) );

	// higher surfaces are covered in snow
	// excuse the black magic ahead, i want it to rapidly blend to snow
	float v = min(
		range.y,
		max( range.x, height )
	);
	float d = range.y - range.x;
	float frac = (v - range.x) / d;
	float s = frac * 2.0;
	textureColour = mix(
		textureColour,
		snow,
		clamp(
			1.0 - (2.0 - pow( s, s )),
			0.0,
			1.0
		)
	);

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
