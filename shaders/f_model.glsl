#version 140

uniform sampler2D u_Texture;

in vec3 normal;
in vec2 texCoord;

out vec4 out_FragColor;

void main() {
	vec3 diffuse = texture( u_Texture, texCoord ).rgb;
	float d = max(
		0.0,
		dot(
			normalize( normal.xyz ),
			vec3( 0.75, -1.0, 0.0 )
		)
	);
	vec3 colour = diffuse * d;
	out_FragColor = vec4( colour, 1.0 );
}
