#version 140

uniform sampler2D u_texture;
//TODO: more textures (dirt, grass, rock, snow)

in vec4 colour;
in vec2 texCoord;

out vec4 out_fragColor;

void main() {
	out_fragColor = vec4( texture( u_texture, texCoord ).rgb, 1.0 );
}
