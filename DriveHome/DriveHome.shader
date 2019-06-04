//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/MdfBRX
//The Drive Home
//by BigWIngs



Shader"Clawbird/DriveHome"{
Properties{
_DistanceThreshold("distance", float) = 10
_Opacity("opacity", float) = 0.9
_test1("test1", float) = 0
}
SubShader{
Tags{ "Queue" = "Transparent" "RenderType" = "Transparent" }
	LOD 100

	Blend SrcAlpha OneMinusSrcAlpha
	
Pass{
CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma fragmentoption ARB_precision_hint_fastest
#include "UnityCG.cginc"

#define iTime _Time.y*1.1

#pragma target 3.0

struct appdata{
float4 vertex : POSITION;
float2 uv : TEXCOORD0;
};
uniform fixed4     fragColor;
uniform fixed      iChannelTime[4];// channel playback time (in seconds)
uniform fixed3     iChannelResolution[4];// channel resolution (in pixels)
uniform fixed4     iMouse;// mouse pixel coords. xy: current (if MLB down), zw: click
uniform fixed4     iDate;// (year, month, day, time in seconds)
uniform fixed      iSampleRate;// sound sample rate (i.e., 44100)

float _Opacity;
float _test1;

struct v2f
{
float2 uv : TEXCOORD0;
float4 vertex : SV_POSITION;
float4 screenCoord : TEXCOORD1;
};
float _DistanceThreshold;



//--------------------------------------------------------------------------------------------------
struct _Channel
{
    float3 _resolution;
    float _time;
};
#pragma pack_matrix(row_major)
struct rm__Channel
{
    float3 _resolution;
    float _time;
};
#pragma pack_matrix(column_major)
struct std__Channel
{
    float3 _resolution;
    float _time;
};
#pragma pack_matrix(row_major)
struct std_rm__Channel
{
    float3 _resolution;
    float _time;
};
#pragma pack_matrix(column_major)
_Channel _Channel_ctor(float3 x0, float x1)
{
    _Channel structure = { x0, x1};
    return structure;
}
float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
float2x2 mat2(float x0, float x1, float x2, float x3)
{
    return float2x2(x0, x1, x2, x3);
}
float3 vec3(float x0)
{
    return float3(x0, x0, x0);
}
float3 vec3(float x0, float x1, float x2)
{
    return float3(x0, x1, x2);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Uniforms

uniform float4 _iMouse;

#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings

float fract(float x) 
{
	return x - floor(x);
}
     
float2 fract(float2 x) 
{
    return x - floor(x);
}

float3 fract(float3 x) 
{
    return x - floor(x);
}
//

static float4 out_outColor = {0, 0, 0, 0};
static float4 gl_FragCoord = float4(0, 0, 0, 0);

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewCoords : packoffset(c1);
    float3 dx_DepthFront : packoffset(c2);
    float2 dx_ViewScale : packoffset(c3);
};

//#define GL_USES_FRAG_COORD
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
void _mainImage_float4(inout float4 _c, in float2 _f);
;
static float3 _ro = {0, 0, 0};
static float3 _rd = {0, 0, 0};
float _N(in float _t)
{
return fract((sin((_t * 10234.324)) * 123423.23));
;
}
;
float3 _N31(in float _p)
{
float3 _p3 = fract((vec3(_p) * float3(0.1031, 0.11369, 0.13787)));
(_p3 += dot(_p3, (_p3.yzx + 19.190001)));
return fract(vec3(((_p3.x + _p3.y) * _p3.z), ((_p3.x + _p3.z) * _p3.y), ((_p3.y + _p3.z) * _p3.x)));
;
}
;
float _DistLine(in float3 _ro, in float3 _rd, in float3 _p)
{
return length(cross((_p - _ro), _rd));
;
}
;
float3 _ClosestPoint(in float3 _ro, in float3 _rd, in float3 _p)
{
return (_ro + (max(0.0, dot((_p - _ro), _rd)) * _rd));
;
}
;
float _Remap(in float _a, in float _b, in float _c, in float _d, in float _t)
{
return ((((_t - _a) / (_b - _a)) * (_d - _c)) + _c);
;
}
;
float _BokehMask(in float3 _ro, in float3 _rd, in float3 _p, in float _size, in float _blur)
{
float _d = _DistLine(_ro, _rd, _p);
float _m = smoothstep(_size, (_size * (1.0 - _blur)), _d);
(_m *= lerp(0.69999999, 1.0, smoothstep((0.80000001 * _size), _size, _d)));
return _m;
;
}
;
float _SawTooth(in float _t)
{
return ((cos((_t + cos(_t))) + (sin((2.0 * _t)) * 0.2)) + (sin((4.0 * _t)) * 0.02));
;
}
;
float _DeltaSawTooth(in float _t)
{
return (((0.40000001 * cos((2.0 * _t))) + (0.079999998 * cos((4.0 * _t)))) - ((1.0 - sin(_t)) * sin((_t + cos(_t)))));
;
}
;
float2 _GetDrops(in float2 _uv, in float _seed, in float _m)
{
float _t = (_Time.y + (_m * 30.0));
float2 _o = {0.0, 0.0};
(_uv.y += (_t * 0.050000001));
(_uv *= float2(20.0, 5.0));
float2 _id = floor(_uv);
float3 _n = _N31((_id.x + ((_id.y + _seed) * 546.35242)));
float2 _bd = fract(_uv);
float2 _uv2 = _bd;
(_bd -= 0.5);
(_bd.y *= 4.0);
(_bd.x += ((_n.x - 0.5) * 0.60000002));
(_t += (_n.z * 6.2800002));
float _slide = _SawTooth(_t);
float _ts = {1.5};
float2 _trailPos = vec2((_bd.x * _ts), ((fract((((_bd.y * _ts) * 2.0) - (_t * 2.0))) - 0.5) * 0.5));
(_bd.y += (_slide * 2.0));
float _dropShape = (_bd.x * _bd.x);
(_dropShape *= _DeltaSawTooth(_t));
(_bd.y += _dropShape);
float _d = length(_bd);
float _trailMask = smoothstep(-0.2, 0.2, _bd.y);
(_trailMask *= _bd.y);
float _td = length((_trailPos * max(0.5, _trailMask)));
float _mainDrop = smoothstep(0.2, 0.1, _d);
float _dropTrail = smoothstep(0.1, 0.02, _td);
(_dropTrail *= _trailMask);
(_o = lerp((_bd * _mainDrop), _trailPos, _dropTrail));
return _o;
;
}
;
void _CameraSetup(in float2 _uv, in float3 _pos, in float3 _lookat, in float _zoom, in float _m)
{
(_ro = _pos);
float3 _f = normalize((_lookat - _ro));
float3 _r = cross(float3(0.0, 1.0, 0.0), _f);
float3 _u = cross(_f, _r);
float _t = _Time.y;
float2 _offs = {0.0, 0.0};
float2 _dropUv = _uv;
float _x = (((sin((_t * 0.1)) * 0.5) + 0.5) * 0.5);
(_x = ((-_x) * _x));
float _s = sin(_x);
float _c = cos(_x);
float2x2 _rot = mat2(_c, (-_s), _s, _c);
(_dropUv = mul(_uv, transpose(_rot)));
(_dropUv.x += ((-sin((_t * 0.1))) * 0.5));
(_offs = _GetDrops(_dropUv, 1.0, _m));
(_offs += _GetDrops((_dropUv * 1.4), 10.0, _m));
(_offs += _GetDrops((_dropUv * 2.4000001), 25.0, _m));
float _ripple = ((sin(((_t + ((_uv.y * 3.1415) * 30.0)) + (_uv.x * 124.0))) * 0.5) + 0.5);
(_ripple *= 0.0049999999);
(_offs += vec2((_ripple * _ripple), _ripple));
float3 _center = (_ro + (_f * _zoom));
float3 _i = ((_center + ((_uv.x - _offs.x) * _r)) + ((_uv.y - _offs.y) * _u));
(_rd = normalize((_i - _ro)));
}
;
float3 _HeadLights(in float _i, in float _t)
{
float _z = fract((((-_t) * 2.0) + _i));
float3 _p = vec3(-0.30000001, 0.1, (_z * 40.0));
float _d = length((_p - _ro));
float _size = (lerp(0.029999999, 0.050000001, smoothstep(0.02, 0.07, _z)) * _d);
float _m = {0.0};
float _blur = {0.1};
(_m += _BokehMask(_ro, _rd, (_p - float3(0.079999998, 0.0, 0.0)), _size, _blur));
(_m += _BokehMask(_ro, _rd, (_p + float3(0.079999998, 0.0, 0.0)), _size, _blur));
(_m += _BokehMask(_ro, _rd, (_p + float3(0.1, 0.0, 0.0)), _size, _blur));
(_m += _BokehMask(_ro, _rd, (_p - float3(0.1, 0.0, 0.0)), _size, _blur));
float _distFade = max(0.0099999998, pow((1.0 - _z), 9.0));
(_blur = 0.80000001);
(_size *= 2.5);
float _r = {0.0};
(_r += _BokehMask(_ro, _rd, (_p + float3(-0.090000004, -0.2, 0.0)), _size, _blur));
(_r += _BokehMask(_ro, _rd, (_p + float3(0.090000004, -0.2, 0.0)), _size, _blur));
(_r *= (_distFade * _distFade));
return ((float3(0.80000001, 0.80000001, 1.0) * (_m + _r)) * _distFade);
;
}
;
float3 _TailLights(in float _i, in float _t)
{
(_t = ((_t * 1.5) + _i));
float _id = (floor(_t) + _i);
float3 _n = _N31(_id);
float _laneId = smoothstep(0.5, 0.50999999, _n.y);
float _ft = fract(_t);
float _z = (3.0 - (_ft * 3.0));
(_laneId *= smoothstep(0.2, 1.5, _z));
float _lane = lerp(0.60000002, 0.30000001, _laneId);
float3 _p = vec3(_lane, 0.1, _z);
float _d = length((_p - _ro));
float _size = (0.050000001 * _d);
float _blur = {0.1};
float _m = (_BokehMask(_ro, _rd, (_p - float3(0.079999998, 0.0, 0.0)), _size, _blur) + _BokehMask(_ro, _rd, (_p + float3(0.079999998, 0.0, 0.0)), _size, _blur));
float _bs = (_n.z * 3.0);
float _brake = smoothstep(_bs, (_bs + 0.0099999998), _z);
(_brake *= smoothstep((_bs + 0.0099999998), _bs, (_z - (0.5 * _n.y))));
(_m += ((_BokehMask(_ro, _rd, (_p + float3(0.1, 0.0, 0.0)), _size, _blur) + _BokehMask(_ro, _rd, (_p - float3(0.1, 0.0, 0.0)), _size, _blur)) * _brake));
float _refSize = (_size * 2.5);
(_m += _BokehMask(_ro, _rd, (_p + float3(-0.090000004, -0.2, 0.0)), _refSize, 0.80000001));
(_m += _BokehMask(_ro, _rd, (_p + float3(0.090000004, -0.2, 0.0)), _refSize, 0.80000001));
float3 _col = ((float3(1.0, 0.1, 0.1) * _m) * _ft);
float _b = _BokehMask(_ro, _rd, (_p + float3(0.12, 0.0, 0.0)), _size, _blur);
(_b += (_BokehMask(_ro, _rd, (_p + float3(0.12, -0.2, 0.0)), _refSize, 0.80000001) * 0.2));
float3 _blinker = {1.0, 0.69999999, 0.2};
(_blinker *= (smoothstep(1.5, 1.4, _z) * smoothstep(0.2, 0.30000001, _z)));
(_blinker *= clamp((sin((_t * 200.0)) * 100.0), 0.0, 1.0));
(_blinker *= _laneId);
(_col += (_blinker * _b));
return _col;
;
}
;
float3 _StreetLights(in float _i, in float _t)
{
float _side = sign(_rd.x);
float _offset = (max(_side, 0.0) * 0.0625);
float _z = fract(((_i - _t) + _offset));
float3 _p = vec3((2.0 * _side), 2.0, (_z * 60.0));
float _d = length((_p - _ro));
float _blur = {0.1};
float3 _rp = _ClosestPoint(_ro, _rd, _p);
float _distFade = _Remap(1.0, 0.69999999, 0.1, 1.5, (1.0 - pow((1.0 - _z), 6.0)));
(_distFade *= (1.0 - _z));
float _m = (_BokehMask(_ro, _rd, _p, (0.050000001 * _d), _blur) * _distFade);
return (_m * float3(1.0, 0.69999999, 0.30000001));
;
}
;
float3 _EnvironmentLights(in float _i, in float _t)
{
float _n = _N((_i + floor(_t)));
float _side = sign(_rd.x);
float _offset = (max(_side, 0.0) * 0.0625);
float _z = fract((((_i - _t) + _offset) + fract((_n * 234.0))));
float _n2 = fract((_n * 100.0));
float3 _p = vec3(((3.0 + _n) * _side), (((_n2 * _n2) * _n2) * 1.0), (_z * 60.0));
float _d = length((_p - _ro));
float _blur = {0.1};
float3 _rp = _ClosestPoint(_ro, _rd, _p);
float _distFade = _Remap(1.0, 0.69999999, 0.1, 1.5, (1.0 - pow((1.0 - _z), 6.0)));
float _m = _BokehMask(_ro, _rd, _p, (0.050000001 * _d), _blur);
(_m *= ((_distFade * _distFade) * 0.5));
(_m *= (1.0 - pow(((sin((((_z * 6.2800002) * 20.0) * _n)) * 0.5) + 0.5), 20.0)));
float3 _randomCol = vec3(fract((_n * -34.5)), fract((_n * 4572.0)), fract((_n * 1264.0)));
float3 _col = lerp(float3(1.0, 0.1, 0.1), float3(1.0, 0.69999999, 0.30000001), fract((_n * -65.419998)));
(_col = lerp(_col, _randomCol, _n));
return ((_m * _col) * 0.2);
;
}
;
void _mainImage_float4(inout float4 _fragColor, in float2 _fragCoord)
{
float _t = _Time.y;
float3 _col = {0.0, 0.0, 0.0};
float2 _uv = (_fragCoord.xy / float2(1.,1.));
(_uv -= 0.5);
(_uv.x *= (1 / 1));
float2 _mouse = (_iMouse.xy / float2(1.,1.));
float3 _pos = {0.30000001, 0.15000001, 0.0};
float _bt = (_t * 5.0);
float _h1 = _N(floor(_bt));
float _h2 = _N(floor((_bt + 1.0)));
float _bumps = (lerp(_h1, _h2, fract(_bt)) * 0.1);
(_bumps = (((_bumps * _bumps) * _bumps) * 1.0));
(_pos.y += _bumps);
float _lookatY = (_pos.y + _bumps);
float3 _lookat = vec3(0.30000001, _lookatY, 1.0);
float3 _lookat2 = vec3(0.0, _lookatY, 0.69999999);
(_lookat = lerp(_lookat, _lookat2, ((sin((_t * 0.1)) * 0.5) + 0.5)));
(_uv.y += (_bumps * 4.0));
_CameraSetup(_uv, _pos, _lookat, 2.0, _mouse.x);
(_t *= 0.029999999);
(_t += _mouse.x);
{ for(float _i = {0.0}; (_i < 1.0); (_i += 0.125))
{
(_col += _StreetLights(_i, _t));
}
}
;
{ for(float _i = {0.0}; (_i < 1.0); (_i += 0.125))
{
float _n = _N((_i + floor(_t)));
(_col += _HeadLights((_i + ((_n * 0.125) * 0.69999999)), _t));
}
}
;
{ for(float _i = {0.0}; (_i < 1.0); (_i += 0.125))
{
(_col += _EnvironmentLights(_i, _t));
}
}
;
(_col += _TailLights(0.0, _t));
(_col += _TailLights(0.5, _t));
(_col += (clamp(_rd.y, 0.0, 1.0) * float3(0.60000002, 0.5, 0.89999998)));
(_fragColor = vec4(_col, 0.0));
}
;
;




//----------------------------------------------------------------------------------



v2f vert(appdata v)
{
v2f o;
o.vertex = UnityObjectToClipPos(v.vertex);
o.uv = v.uv;
o.screenCoord.xy = ComputeScreenPos(o.vertex);
return o;
}


fixed4 frag(v2f i) : SV_Target{

{
if (_test1 != 5.12)
			return fixed4(1.,1.,1.,0.);
			
	fixed2 uv = i.uv;
	uv.x *=  1 / 1;

    // background	 
	//fixed3 color = fixed3(0.8 + 0.2*uv.y,0.8 + 0.2*uv.y,0.8 + 0.2*uv.y);

    // Put stuff here
	float4 color = float4(0.0, 0.0, 0.0, _Opacity);
	
	_mainImage_float4(color, i.uv);
	(color.w = _Opacity);
	//(outColor = color);
	

    // vigneting	
	//color *= sqrt(1.5-0.5*length(uv));
	//color = c2;

	return  fixed4(color);
}
}ENDCG
}
}
}

