#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 wave(float2 position, float length, float amplitude, float time) {
    float offset = sin(time + position.x / length) * amplitude;
    return position - float2(offset, 0);
}
