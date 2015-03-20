#version 140

uniform PerFrame {
	mat4 u_ProjectionMatrix;
};

in vec3 in_Position;
//in vec3 in_Normal;
//in vec2 in_TexCoord;

//out vec2 texCoord;

void main() {
	gl_Position = u_ProjectionMatrix * vec4( in_Position, 1.0 );

//	texCoord = in_TexCoord;
}
