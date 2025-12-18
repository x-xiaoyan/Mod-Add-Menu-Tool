Texture1D<float4> IniParams : register(t120);

#define SIZE   IniParams[87].xy
#define OFFSET IniParams[87].zw
#define FLIP  IniParams[78].xy

struct vs2ps {
    float4 pos : SV_Position0;
    float2 uv  : TEXCOORD1;
};

#ifdef VERTEX_SHADER
void main(
        out vs2ps output,
        uint vertex : SV_VertexID)
{
    float2 BaseCoord, Offset;
    Offset.x = OFFSET.x * 2 - 1;
    Offset.y = (1 - OFFSET.y) * 2 - 1;
    BaseCoord.xy = float2((2 * SIZE.x), (2 * (-SIZE.y)));

    switch (vertex) {
        case 0:
            output.pos.xy = float2(BaseCoord.x + Offset.x, BaseCoord.y + Offset.y);
            output.uv = float2(1, 0);
            break;
        case 1:
            output.pos.xy = float2(BaseCoord.x + Offset.x, 0 + Offset.y);
            output.uv = float2(1, 1);
            break;
        case 2:
            output.pos.xy = float2(0 + Offset.x, BaseCoord.y + Offset.y);
            output.uv = float2(0, 0);
            break;
        case 3:
            output.pos.xy = float2(0 + Offset.x, 0 + Offset.y);
            output.uv = float2(0, 1);
            break;
        default:
            output.pos.xy = 0;
            output.uv = float2(0, 0);
            break;
    };
    output.pos.zw = float2(0, 1);
}
#endif

#ifdef PIXEL_SHADER
Texture2D<float4> tex : register(t100);

void main(vs2ps input, out float4 result : SV_Target0)
{
    uint width, height;
    tex.GetDimensions(width, height);
    if (!width || !height) discard;

    float2 uv = input.uv;

    if (FLIP.x == 1)
        uv.x = 1 - uv.x;

    if (FLIP.y != 1)
        uv.y = 1 - uv.y;

    result = tex.Load(int3(uv * float2(width, height), 0));
}
#endif
