uniform vec2 u_resolution;
varying vec2 vUv;
uniform float u_time;

mat2 scale(vec2 scale){
    return mat2(scale.x, 0.0, 0.0, scale.y);
}

void main(){

    vec2 newUV = vUv;
    vec2 coord = newUV;
    // vec2 coord = (gl_FragCoord.xy / u_resolution);

    // vec2 translate = vec2(-2, -0.5);
    // coord += translate;

    vec3 color = vec3(0.0);

    float angle = atan(-coord.y + 0.5, coord.x - 0.5) * 0.1;
    float len = length(coord - vec2(0.5, 0.5));

    color.r += sin(len * 40.0 + angle * 40.0 + u_time);
    color.g += cos(len * 30.0 + angle * 60.0 - u_time);
    color.b += sin(len * 50.0 + angle * 50.0 + 2.0);

    gl_FragColor = vec4(color, 1.0);
}