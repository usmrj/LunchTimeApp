#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    vec2 origin;
    vec2 radius;
    vec4 zeroColor;
    vec4 oneColor;
};

void main() {
    vec2 d = qt_TexCoord0 - origin;
    vec2 n = d / radius;
    float l = sqrt(n.x * n.x + n.y * n.y);
    fragColor = mix(zeroColor, oneColor, min(1, l));
}
