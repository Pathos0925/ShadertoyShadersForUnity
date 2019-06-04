//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/4ldGz4
//[SH16B] Speed Drive 80
//by knarkowicz

Shader "Clawbird/SpeedDrive" {
    Properties {

			_DistanceThreshold ("_DistanceThreshold", float) = 1.8
			
			_Contrast ("Contrast", float) = 1.0
			
			_HeightOffset ("HeightOffset", float) = 0.0
			_TexA("_TexA", 2D) = "white" {}
			_TexB("_TexB", 2D) = "white" {}
			_TexC("_TexC", 2D) = "white" {}
			_TexD("_TexD", 2D) = "white" {}
			
			
    }
    SubShader {
		Tags{ "Queue" = "Transparent" "RenderType" = "Transparent" }
	LOD 100

	ZWrite Off
	ZTest Always
	Blend SrcAlpha OneMinusSrcAlpha

		Pass {
            CGPROGRAM
     
            #include "UnityCG.cginc"
            #pragma vertex vert
            #pragma fragment frag
     
            #pragma target 3.5
 
			uniform Texture2D _TexA;			
			uniform Texture2D _TexB;			
			uniform Texture2D _TexC;			
			uniform Texture2D _TexD;

			SamplerState sampler_TexA;
			SamplerState sampler_TexB;
			SamplerState sampler_TexC;
			SamplerState sampler_TexD;
     
			float _DistanceThreshold;
			float _HeightOffset;
			float _SC;
			
			
			float _Contrast;
			
        //--start translated

		//
float vec1(bool x0)
{
    return float(x0);
}
float vec1(int x0)
{
    return float(x0);
}
float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
float3 vec3(float x0)
{
    return float3(x0, x0, x0);
}
float3 vec3(float x0, float x1, float x2)
{
    return float3(x0, x1, x2);
}
float3 vec3(float2 x0, float x1)
{
    return float3(x0, x1);
}
float3x3 mat3(float3 x0, float3 x1, float3 x2)
{
    return float3x3(x0, x1, x2);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Uniforms

uniform float _iChannelTime[4] : register(c0);
uniform float4 _iMouse : register(c4);
uniform float3 _iResolution : register(c5);
static const uint _iChannel0 = 0;
static const uint _iChannel3 = 1;


#ifdef ANGLE_ENABLE_LOOP_FLATTEN
#define LOOP [loop]
#define FLATTEN [flatten]
#else
#define LOOP
#define FLATTEN
#endif
// Varyings

static float4 out_outColor = {0, 0, 0, 0};
static float4 gl_FragCoord = float4(0, 0, 0, 0);

cbuffer DriverConstants : register(b1)
{
    float4 dx_ViewCoords : packoffset(c1);
    float3 dx_DepthFront : packoffset(c2);
    float2 dx_ViewScale : packoffset(c3);
    struct SamplerMetadata
    {
        int baseLevel;
        int internalFormatBits;
        int wrapModes;
        int padding;
    };
    SamplerMetadata samplerMetadata[2] : packoffset(c4);
};

float4 gl_texture2D(const uint samplerIndex, float2 t)
{
	if (samplerIndex == 0)
	{
		return _TexA.Sample(sampler_TexA, float2(t.x, t.y));
	}
	else if (samplerIndex == 1)
	{
		return _TexB.Sample(sampler_TexB, float2(t.x, t.y));
	}
	else if (samplerIndex == 2)
	{
		return _TexC.Sample(sampler_TexC, float2(t.x, t.y));
	}
	else if (samplerIndex == 3)
	{
		return _TexD.Sample(sampler_TexD, float2(t.x, t.y));
	}
		return _TexA.Sample(sampler_TexA, float2(t.x, t.y));
}

float4 gl_texture2DLod(const uint samplerIndex, float2 t, float lod)
{
	if (samplerIndex == 0)
	{
		return _TexA.SampleLevel(sampler_TexA, float2(t.x, t.y), lod);
	}
	else if (samplerIndex == 1)
	{
		return _TexB.SampleLevel(sampler_TexB, float2(t.x, t.y), lod);
	}
	else if (samplerIndex == 2)
	{
		return _TexC.SampleLevel(sampler_TexC, float2(t.x, t.y), lod);
	}
	else if (samplerIndex == 3)
	{
		return _TexD.SampleLevel(sampler_TexD, float2(t.x, t.y), lod);
	}
		return _TexA.SampleLevel(sampler_TexA, float2(t.x, t.y), lod);
}

#define GL_USES_FRAG_COORD
float webgl_atan_emu(float y, float x)
{
    if(x == 0 && y == 0) x = 1;
    return atan2(y, x);
}


float webgl_mod_emu(float x, float y)
{
    return x - y * floor(x / y);
}



float2 webgl_mod_emu(float2 x, float y)
{
    return x - y * floor(x / y);
}



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
void _mainImage_float4(float3 ro, float3 rd, inout float4 _c, in float2 _f);
;
static float _gMaterial = {0.0};
static float _gTime = {0.0};
static float _gCarOffset = {0.0};
static float _gStreetLampDist = {100000.0};
static float _gCarLampDist = {100000.0};
static float _gReflStreetLampDist = {100000.0};
static float _gFogDensity = {0.1};
static float _gFogHeightFalloff = {0.1};
float _Saturate(in float _x)
{
return clamp(_x, 0.0, 1.0);
;
}
;
float _Cylinder(in float3 _p, in float _r, in float _height)
{
float _d = (length(_p.xz) - _r);
(_d = max(_d, (abs(_p.y) - _height)));
return _d;
;
}
;
float _Torus(in float3 _p, in float _r, in float _h)
{
float2 _q = vec2((length(_p.yz) - _h), _p.x);
return (length(_q) - _r);
;
}
;
float _Plane_float4(in float3 _p, in float4 _plane)
{
return (dot(_p, _plane.xyz) + _plane.w);
;
}
;
float _Sphere(in float3 _p, in float _s)
{
return (length(_p) - _s);
;
}
;
float _Box(in float3 _p, in float3 _b)
{
float3 _d = (abs(_p) - _b);
return (min(max(_d.x, max(_d.y, _d.z)), 0.0) + length(max(_d, 0.0)));
;
}
;
float _HexPrism(in float3 _p, in float _h, in float _r)
{
float3 _q = abs(_p);
return max((_q.z - _r), (max(((_q.x * 0.86602497) + (_q.y * 0.5)), _q.y) - _h));
;
}
;
float _Rectangle(in float2 _p, in float2 _b)
{
float2 _d = (abs(_p) - _b);
return (min(max(_d.x, _d.y), 0.0) + length(max(_d, 0.0)));
;
}
;
float _RepeatAngle(inout float2 _p, in float _n)
{
float _angle = (6.2831855 / _n);
float _a = (webgl_atan_emu(_p.y, _p.x) + (_angle / 2.0));
float _r = length(_p);
float _c = floor((_a / _angle));
(_a = (webgl_mod_emu(_a, _angle) - (_angle / 2.0)));
(_p = (vec2(cos(_a), sin(_a)) * _r));
return _c;
;
}
;
float _Circle(in float2 _p, in float _s)
{
return (length(_p) - _s);
;
}
;
float _Intersect(in float _a, in float _b)
{
return max(_a, _b);
;
}
;
float _Substract(in float _a, in float _b)
{
return max(_a, (-_b));
;
}
;
float _SubstractRound(in float _a, in float _b, in float _r)
{
float2 _u = max(vec2((_r + _a), (_r - _b)), float2(0.0, 0.0));
return (min((-_r), max(_a, (-_b))) + length(_u));
;
}
;
float _SubstractChamfer(in float _a, in float _b, in float _r)
{
return max(max(_a, (-_b)), (((_a + _r) - _b) * 0.70710999));
;
}
;
float _Union(in float _a, in float _b)
{
return min(_a, _b);
;
}
;
void _Rotate(inout float2 _p, in float _a)
{
(_p = ((cos(_a) * _p) + (sin(_a) * vec2(_p.y, (-_p.x)))));
}
;
float _Rand(in float2 _co)
{
return frac((sin(dot(_co.xy, float2(12.9898, 78.233002))) * 43758.547));
;
}
;
float _StreetLamps(in float3 _p)
{
(_p = abs(_p));
float _rx = {50.0};
(_p.x = (webgl_mod_emu(_p.x, _rx) - (0.5 * _rx)));
(_p.z -= 15.0);
float _a = _Box(_p, float3(0.30000001, 12.0, 0.30000001));
(_p += float3(0.0, -12.7, 3.5));
_Rotate(_p.yz, -1.2566371);
float _b = _Box(_p, float3(0.5, 4.0, 0.30000001));
float _bloom = _Box((_p + float3(0.0, -0.5, 0.60000002)), float3(0.5, 3.0, 0.1));
(_gStreetLampDist = min(_gStreetLampDist, _bloom));
return _Union(_a, _b);
;
}
;
float _Pyramid(in float3 _p, in float _h)
{
float3 _q = abs(_p);
return max((-_p.y), ((((_q.x + _q.y) + _q.z) - _h) / 3.0));
;
}
;
float _Pyramids(in float3 _p)
{
(_p += float3(-1220.0, 0.0, 0.0));
float3 _t = _p;
float _rx = {200.0};
float _rz = {150.0};
float s1 = {0};
if ((_t.x > 0.0))
{
(s1 = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
}
else
{
(s1 = _t.x);
}
(_t.x = s1);
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
_Rotate(_t.xz, 0.5);
float _a = _Pyramid(_t, 30.0);
(_t = _p);
(_rx = 400.0);
(_rz = 300.0);
float s2 = {0};
if ((_t.x > 0.0))
{
(s2 = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
}
else
{
(s2 = _t.x);
}
(_t.x = s2);
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
_Rotate(_t.xz, 0.5);
float _b = _Pyramid(_t, 80.0);
return _Union(_a, _b);
;
}
;
float _Obelisks(in float3 _p)
{
(_p += float3(-1220.0, -50.0, 0.0));
float _rx = {200.0};
float _rz = {150.0};
(_p.x = (webgl_mod_emu(_p.x, _rx) - (0.5 * _rx)));
(_p.z = (webgl_mod_emu(_p.z, _rz) - (0.5 * _rz)));
_Rotate(_p.xz, (0.5 + (_gTime * 1.5)));
float _a = _Pyramid(_p, 30.0);
_Rotate(_p.xz, (-1.0 - (_gTime * 3.0)));
(_p.y += 7.0);
_Rotate(_p.yx, -3.1415927);
float _b = _Pyramid(_p, 20.0);
return _Union(_a, _b);
;
}
;
float _Buildings(in float3 _p)
{
float3 _t = _p;
float _rx = {200.0};
float _rz = {100.0};
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
float _a = _HexPrism(_t.xzy, 18.0, 40.0);
float _at = _HexPrism(_t.xzy, 12.0, 50.0);
(_a = _Substract(_a, _at));
(_t = (_p + float3(100.0, 0.0, 0.0)));
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
float _b = _Box(_t, float3(20.0, 66.0, 20.0));
float _bt = _Box((_t + float3(0.0, -66.0, 0.0)), float3(15.0, 6.0999999, 15.0));
(_b = _Substract(_b, _bt));
(_rz = 200.0);
(_t = (_p + float3(150.0, 0.0, 0.0)));
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
float _c = _Box(_t, float3(20.0, 99.0, 20.0));
(_rz = 200.0);
(_t = (_p + float3(50.0, 0.0, 0.0)));
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
float _d = _Cylinder(_t, 20.0, 132.0);
return _Union(_Union(_Union(_a, _b), _c), _d);
;
}
;
float _Car(in float3 _p)
{
(_p.x = (-_p.x));
(_p.y -= 0.30000001);
float _a = _Box(_p, float3(4.1999998, 0.89999998, 1.8));
float3 _t = (_p + float3(-6.0, 0.0, 0.0));
_Rotate(_t.yx, 0.2);
float _b = _Plane_float4(_t, float4(0.0, -1.0, 0.0, 0.0));
(_t = (_p + float3(-5.0, 0.0, 0.0)));
_Rotate(_t.yx, -0.40000001);
float _c = _Plane_float4(_t, float4(0.0, 1.0, 0.0, 0.0));
(_t = (_p + float3(2.0, -0.2, 0.0)));
_Rotate(_t.yx, -0.40000001);
float _d = _Plane_float4(_t, float4(0.0, -1.0, 0.0, 0.0));
(_t = (_p + float3(2.0, -0.30000001, 0.0)));
_Rotate(_t.yx, -0.050000001);
float _e = _Plane_float4(_t, float4(0.0, -1.0, 0.0, 0.0));
(_t = (_p + float3(2.0, 1.0, 0.0)));
_Rotate(_t.yx, 0.2);
float _f = _Plane_float4(_t, float4(0.0, 1.0, 0.0, 0.0));
(_t = _p);
(_t.z = abs(_t.z));
(_t += float3(-3.9000001, -0.60000002, 0.0));
float _spoiler = _Box(_t, float3(0.2, 0.050000001, 1.7));
(_spoiler = _Union(_spoiler, _Box((_t - float3(0.0, -0.25, 1.4)), float3(0.2, 0.30000001, 0.15000001))));
float _bloom = _Box((_t + float3(-0.5, 0.69999999, 0.0)), float3(0.1, 0.30000001, 1.5));
(_gCarLampDist = min(_gCarLampDist, _bloom));
(_t = (_p + float3(1.0, -0.60000002, 0.0)));
_Rotate(_t.yx, -0.40000001);
float _frontWindow = _Box(_t, float3(0.60000002, 0.050000001, 1.6));
(_t = (_p + float3(-2.5, -0.69999999, 0.0)));
_Rotate(_t.yx, 0.2);
float _backWindow = _Box(_t, float3(1.0, 0.050000001, 1.6));
float _body = _Union(_Substract(_a, _Union(_Union(_Union(_b, _c), _Intersect(_d, _e)), _f)), _spoiler);
(_t = _p);
(_t.z = (-abs(_t.z)));
(_t += float3(0.0, -0.80000001, 1.2));
_Rotate(_t.yz, -0.89999998);
float _sideCutPlanes = _Plane_float4(_t, float4(0.0, -1.0, 0.0, 0.0));
(_body = _SubstractChamfer(_body, _Union(_backWindow, _frontWindow), 0.1));
(_body = _SubstractChamfer(_body, _sideCutPlanes, 0.050000001));
(_p.x += 0.1);
(_p.xz = abs(_p.xz));
(_t = (_p.xzy - float3(2.4000001, 1.5, -0.69999999)));
float _wheel = _Cylinder(_t, 0.69999999, 1.0);
(_body = _Substract(_body, _wheel));
(_wheel = _Substract(_Cylinder(_t, 0.55000001, 0.30000001), _Sphere((_t + float3(0.0, -0.15000001, 0.0)), 0.34999999)));
(_body = _Union(_body, _wheel));
return _body;
;
}
;
float _Curb(in float3 _p)
{
float _y = (_p.y - 0.5);
float _z = ((-abs(_p.z)) + 14.0);
return max(_y, _z);
;
}
;
float _Tunnel(in float3 _p)
{
float3 _t = _p;
(_t += float3(-2510.0, 0.0, 0.0));
float _a = _Box(_t, float3(200.0, 16.0, 50.0));
float _b = _Box(_t, float3(201.0, 14.0, 16.0));
(_a = _Substract(_a, _b));
(_t = _p);
(_t += float3(-7870.0, 0.0, 0.0));
float _c = _Box(_t, float3(200.0, 16.0, 50.0));
float _d = _Box(_t, float3(201.0, 14.0, 16.0));
(_c = _Substract(_c, _d));
float _rx = {12.0};
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = abs(_t.z));
(_b = _Box((_t + float3(0.0, 0.0, -16.0)), float3(4.0, 12.0, 2.0)));
return _Substract(_Union(_a, _c), _b);
;
}
;
float _CarInterior(in float3 _p)
{
(_p.y -= 3.0);
float3 _t = _p;
_Rotate(_t.xy, -0.69999999);
float _wheel = _Torus((_t + float3(0.0, 3.2, 2.0)), 0.23999999, 2.4000001);
float3 _s = (_t + vec3(0.0, ((sin(((0.30000001 * _t.z) - 1.7)) * 0.30000001) + 0.1), 0.0));
float _dashboard = _Box((_s + float3(-1.6, 2.0, 0.0)), float3(0.80000001, 2.0, 10.0));
_Rotate(_t.xy, 0.30000001);
float _d = _Box((_t + float3(-0.1, 2.2, 0.80000001)), float3(1.0, 1.2, 7.0));
(_dashboard = _SubstractRound(_dashboard, _d, 0.40000001));
return _Union(_wheel, _dashboard);
;
}
;
float _TerrainAO(in float3 _p)
{
float _ret = {1.0};
float3 _t = (_p + vec3((-_gCarOffset), -1.0, -3.0));
float _car = _Box(_t, float3(2.8, 5.0, 1.6));
(_ret = min(_ret, smoothstep(0.0, 1.0, (_car * 0.89999998))));
(_t = abs(_p));
float _rx = {50.0};
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.y -= 2.0);
(_t.z -= 15.0);
float _streetLamps = _Cylinder(_t, 0.2, 2.0);
(_ret = min(_ret, smoothstep(0.0, 1.0, (_streetLamps * 0.1))));
(_t = _p);
(_rx = 200.0);
float _rz = {100.0};
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
float _buildings = _HexPrism(_t.xzy, 18.0, 40.0);
(_t = (_p + float3(100.0, 0.0, 0.0)));
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
(_buildings = _Union(_buildings, _Box(_t, float3(20.0, 66.0, 20.0))));
(_rz = 200.0);
(_t = (_p + float3(150.0, 0.0, 0.0)));
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
(_buildings = _Union(_buildings, _Box(_t, float3(20.0, 99.0, 20.0))));
(_rz = 200.0);
(_t = (_p + float3(50.0, 0.0, 0.0)));
(_t.x = (webgl_mod_emu(_t.x, _rx) - (0.5 * _rx)));
(_t.z = (webgl_mod_emu(_t.z, _rz) - (0.5 * _rz)));
(_buildings = _Union(_buildings, _Cylinder(_t, 20.0, 132.0)));
(_ret = min(_ret, smoothstep(0.0, 1.0, (_buildings * 0.050000001))));
return lerp(_ret, 1.0, 0.5);
;
}
;
float _Scene(in float3 _p)
{
float _terrain = _Union(_Plane_float4(_p, float4(0.0, 1.0, 0.0, 0.0)), _Curb(_p));
float _tunnel = _Tunnel(_p);
if ((_gTime >= 77.0))
{
float3 _t = _p;
(_t.z = abs(_p.z));
(_terrain = _Substract(_terrain, _Plane_float4(_t, float4(0.0, 0.0, -1.0, 18.0))));
(_terrain = _Union(_terrain, _Box((_t + float3(-7700.0, 0.0, -20.0)), float3(10000.0, 3.0, 2.0))));
}
float s3 = {0};
if ((_gTime <= 25.0))
{
(s3 = _Pyramids(_p));
}
else
{
float s4 = {0};
if ((_gTime < 77.0))
{
(s4 = _Buildings(_p));
}
else
{
(s4 = _Obelisks(_p));
}
(s3 = s4);
}
float _buildings = s3;
float _streetLamps = _StreetLamps(_p);
(_p += vec3((-_gCarOffset), -1.0, -3.0));
float s5 = {0};
if (((_gTime > 59.0) && (_gTime < 67.0)))
{
(s5 = _CarInterior(_p));
}
else
{
(s5 = _Car(_p));
}
float _car = s5;
float _ret = _Union(_Union(_Union(_Union(_terrain, _buildings), _streetLamps), _car), _tunnel);
(_gMaterial = 5.0);
float s6 = {0};
if ((_terrain <= _ret))
{
(s6 = 1.0);
}
else
{
(s6 = _gMaterial);
}
(_gMaterial = s6);
float s7 = {0};
if ((_buildings <= _ret))
{
(s7 = 2.0);
}
else
{
(s7 = _gMaterial);
}
(_gMaterial = s7);
float s8 = {0};
if ((_car <= _ret))
{
(s8 = 3.0);
}
else
{
(s8 = _gMaterial);
}
(_gMaterial = s8);
float s9 = {0};
if ((_streetLamps <= _ret))
{
(s9 = 4.0);
}
else
{
(s9 = _gMaterial);
}
(_gMaterial = s9);
return _ret;
;
}
;
float _CastRay(in float3 _ro, in float3 _rd)
{
float _h = {0.5};
float _t = {0.0};
{ for(int _i = {0}; (_i < 64); (++_i))
{
if (((_h < 0.0099999998) || (_t > 500.0)))
{
break;
;
}
(_h = _Scene((_ro + (_rd * _t))));
(_t += _h);
}
}
;
if ((_t > 500.0))
{
(_t = -1.0);
}
return _t;
;
}
;
float3 _SceneNormal(in float3 _pos)
{
float3 _eps = {0.0099999998, 0.0, 0.0};
float3 _nor = vec3((_Scene((_pos + _eps.xyy)) - _Scene((_pos - _eps.xyy))), (_Scene((_pos + _eps.yxy)) - _Scene((_pos - _eps.yxy))), (_Scene((_pos + _eps.yyx)) - _Scene((_pos - _eps.yyx))));
return normalize((-_nor));
;
}
;
float _SpeedMeterY(in float2 _p)
{
(_p -= float2(4.0, 3.8));
float _d = _Circle(_p, 0.02);
float2 _t = _p;
_RepeatAngle(_t, 8.0);
(_d = min(_d, _Rectangle((_t + float2(-0.69999999, 0.0)), float2(0.079999998, 0.0099999998))));
(_t = _p);
_Rotate(_t.xy, 0.40000001);
_RepeatAngle(_t, 8.0);
(_d = min(_d, _Rectangle((_t + float2(-0.69999999, 0.0)), float2(0.029999999, 0.0099999998))));
(_d = max(_d, (-_Circle((_p + float2(0.0, 0.70999998)), 0.50999999))));
return _d;
;
}
;
float _SpeedMeterR(in float2 _p, in float _t)
{
(_p -= float2(4.0, 3.8));
_Rotate(_p.xy, ((_t + 0.5) + (0.5 * sin((_t + (2.0 * _gTime))))));
float _d = _Rectangle((_p + float2(-0.31999999, 0.0)), float2(0.18000001, 0.0099999998));
return _d;
;
}
;
float3 _Dashboard(in float3 _p3)
{
(_p3.x -= _gCarOffset);
float2 _p = {0, 0};
(_p.x = _p3.z);
(_p.y = ((_p3.y * 1.3) + 1.8));
float3 _color = {0.0, 0.0, 0.0};
float3 _yellow = {0.89999998, 0.69999999, 0.1};
float3 _red = {1.0, 0.1, 0.40000001};
float3 _purple = {0.54000002, 0.41999999, 0.77999997};
float _dy = min(_SpeedMeterY(_p), _SpeedMeterY((_p + float2(2.0, 0.0))));
float _horBarsY = {100000.0};
{ for(int _i = {0}; (_i < 4); (++_i))
{
//float _ampl = gl_texture2D(_iChannel3, vec2((((2.0 * vec1(_i)) + 1.5) / 8.0), 0.25)).x;
float _ampl = 0.5;
float _sizeX = ((0.69999999 * floor((_Saturate((1.4 * sqrt(_ampl))) * 6.0))) / 6.0);
(_horBarsY = min(_horBarsY, _Rectangle((_p - vec2((7.3000002 + _sizeX), (3.05 + (vec1(_i) * 0.40000001)))), vec2(_sizeX, 0.029999999))));
}
}
;
float _dr = {100000.0};
{ for(int _i = {0}; (_i < 3); (++_i))
{
float _sy = (0.44999999 + (floor(((0.1 * ((3.0 * sin((14.0 * _gTime))) + sin((7.0 * _gTime)))) / 0.2)) * 0.2));
float s10 = {0};
if ((_i == 1))
{
(s10 = 1.0);
}
else
{
(s10 = 0.38999999);
}
(_sy *= s10);
(_dr = min(_dr, _Rectangle((_p - vec2((5.5999999 + (vec1(_i) * 0.40000001)), 3.8)), vec2(0.1, _sy))));
}
}
;
float2 _t = _p;
(_t.y = (webgl_mod_emu(_t.y, 0.2) - 0.1));
float _di = _Rectangle(_t, float2(100.0, 0.059999999));
(_dr = max(_dr, (-_di)));
(_dr = min(_dr, min(_SpeedMeterR(_p, 0.0), _SpeedMeterR((_p + float2(2.0, 0.0)), 1.0))));
float _horBarsR = {100000.0};
{ for(int _i = {0}; (_i < 4); (++_i))
{
float _ampl = gl_texture2D(_iChannel3, vec2((((2.0 * vec1(_i)) + 0.5) / 8.0), 0.25)).x;
float _sizeX = ((0.69999999 * floor((_Saturate((1.4 * sqrt(_ampl))) * 6.0))) / 6.0);
(_sizeX = ((0.69999999 * floor((_sizeX * 6.0))) / 6.0));
(_horBarsR = min(_horBarsR, _Rectangle((_p - vec2((7.3000002 + _sizeX), (3.2249999 + (vec1(_i) * 0.40000001)))), vec2(_sizeX, 0.029999999))));
}
}
;
(_t = _p);
(_t.x += 0.2);
(_t.x = (webgl_mod_emu(_t.x, 0.25999999) - 0.13));
(_di = _Rectangle(_t, float2(0.059999999, 100.0)));
(_dr = min(_dr, max(_horBarsR, (-_di))));
(_dy = min(_dy, max(_horBarsY, (-_di))));
float _dp = {100000.0};
(_p.x = (webgl_mod_emu(_p.x, 2.0) - 1.0));
(_dp = min(_dp, _Rectangle((_p - float2(0.0, 3.8)), float2(0.0099999998, 1.2))));
(_color += ((2.0 * _yellow) * _Saturate(exp(((-_dy) * 40.0)))));
(_color += ((1.5 * _red) * _Saturate(exp(((-_dr) * 40.0)))));
(_color += ((1.0 * _purple) * _Saturate(exp(((-_dp) * 40.0)))));
float3 s11 = {0, 0, 0};
if (((_p3.x - (_p3.y * 0.30000001)) > -0.69999999))
{
(s11 = _color);
}
else
{
(s11 = float3(0.0, 0.0, 0.0));
}
return s11;
;
}
;
float3x3 _CameraLookAt(in float3 _ro, in float3 _ta, in float _cr)
{
float3 _cw = normalize((_ta - _ro));
float3 _cp = vec3(sin(_cr), cos(_cr), 0.0);
float3 _cu = normalize(cross(_cw, _cp));
float3 _cv = normalize(cross(_cu, _cw));
return mat3(_cu, _cv, _cw);
;
}
;
float3 _Sky(in float3 _rayDir)
{
float3 _skyPos = _rayDir;
float2 _skyAngle = vec2(webgl_atan_emu(_skyPos.z, _skyPos.x), acos(_skyPos.y));
float _sun = (1.0 - clamp(((6.0 * length((_skyAngle - float2(0.0, 1.5)))) - 1.0), 0.0, 1.0));
float _sky = clamp((1.0 - (1.5 * _skyPos.y)), 0.0, 1.0);
float _sunLines = (1.0 - clamp(sin(((_skyPos.y * _skyPos.y) * 500.0)), 0.0, 1.0));
float3 _sunColor = lerp(float3(1.0, 0.2, 0.5), float3(4.0, 0.80000001, 0.0), clamp((_skyPos.y * 6.0), 0.0, 1.0));
float s12 = {0};
if ((_gTime > 0.30000001))
{
(s12 = (3.0 - (2.0 * smoothstep(0.0, 1.0, ((_gTime - 0.30000001) * 0.5)))));
}
else
{
(s12 = 1.0);
}
(_sun *= s12);
float3 _color = (((float3(0.108, 0.083999999, 0.156) * _sky) * 4.0) + ((_sunColor * _sun) * _sunLines));
float2 _starTile = floor((_skyAngle.xy * 20.0));
float2 _starPos = ((frac((_skyAngle.xy * 20.0)) * 2.0) - 1.0);
float _starRand = _Rand((_starTile + float2(0.1, 0.30000001)));
float s13 = {0};
if ((_starRand > 0.89999998))
{
(s13 = _starRand);
}
else
{
(s13 = 0.0);
}
(_starRand = s13);
float s14 = {0};
if ((_sun > 0.0))
{
(s14 = 0.0);
}
else
{
(s14 = 1.0);
}
(_color += (((float3(2.0, 2.0, 2.0) * _starRand) * clamp((1.0 - ((6.0 + (3.0 * sin(((_gTime * 2.0) + (20.0 * _skyAngle.y))))) * length(_starPos))), 0.0, 1.0)) * s14));
return _color;
;
}
;
float _SceneRefl(in float3 _p)
{
(_p = abs(_p));
float _rx = {50.0};
(_p.x = (webgl_mod_emu(_p.x, _rx) - (0.5 * _rx)));
(_p.z -= 15.0);
float _a = _Box(_p, float3(0.30000001, 12.0, 0.30000001));
(_p += float3(0.0, -12.7, 3.5));
_Rotate(_p.yz, -1.2566371);
float _b = _Box(_p, float3(0.5, 4.0, 0.30000001));
float _bloom = _Box((_p + float3(0.0, -0.5, 0.60000002)), float3(0.5, 3.0, 0.1));
(_gReflStreetLampDist = min(_gReflStreetLampDist, _bloom));
return _Union(_a, _b);
;
}
;
float _CastReflectionRay(in float3 _ro, in float3 _rd)
{
float _h = {0.5};
float _t = {0.0};
{ for(int _i = {0}; (_i < 16); (++_i))
{
if (((_h < 0.0099999998) || (_t > 100.0)))
{
break;
;
}
(_h = _SceneRefl((_ro + (_rd * _t))));
(_t += _h);
}
}
;
if ((_t > 100.0))
{
(_t = -1.0);
}
return _t;
;
}
;
float3 _SceneReflection(in float3 _pos, in float3 _normal, in float3 _rayDir)
{
float3 _reflDir = reflect(_rayDir, _normal);
float _t = _CastReflectionRay((_pos + (0.5 * _reflDir)), _reflDir);
float s15 = {0};
if ((abs((_normal.x - 1.0)) < 0.5))
{
(s15 = 0.30000001);
}
else
{
(s15 = 1.0);
}
float _w = s15;
float3 _color = (_Sky(_reflDir) * lerp(1.0, 0.69999999, (_w * vec1((_t >= 0.0)))));
(_color += (((_w * float3(0.54000002, 0.41999999, 0.77999997)) * 2.0) * vec3(_Saturate(exp(((-_gReflStreetLampDist) * 0.60000002))))));
return _color;
;
}
;
float3 _SceneBloom(in float3 _rayOrigin, in float3 _rayDir)
{
float3 _color = {0.0, 0.0, 0.0};
float3 _center = {25.0, 14.0, 16.0};
float3 _left = {0.0, 0.0, 1.0};
(_center += (_left * clamp(dot((_rayOrigin - _center), _left), -7.0, 7.0)));
(_color += (float3(0.27000001, 0.20999999, 0.38999999) * vec3(_Saturate(exp(((-_gStreetLampDist) * 0.60000002))))));
(_color += (float3(0.36000001, 0.030000001, 0.060000002) * vec3(_Saturate(exp(((-_gCarLampDist) * 2.0))))));
return _color;
;
}
;
float _SmoothNoise(in float3 _v)
{
float3 _i = floor(_v);
float3 _f = frac(_v);
(_f = ((_f * _f) * ((-2.0 * _f) + 3.0)));
float2 _uv = ((_i.xy + (float2(7.0, 17.0) * _i.z)) + _f.xy);
float _lowz = gl_texture2DLod(_iChannel0, ((_uv.xy + 0.5) / 64.0), 0.0).x;
(_uv = ((_i.xy + (float2(7.0, 17.0) * (_i.z + 1.0))) + _f.xy));
float _highz = gl_texture2DLod(_iChannel0, ((_uv.xy + 0.5) / 64.0), 0.0).x;
float _r = lerp(_lowz, _highz, _f.z);
return ((2.0 * _r) - 1.0);
;
}
;
float _DensityNoise(in float3 _pos, in float3 _noisePosScale, in float3 _noisePosScaleBias, in float _noiseScale, in float _noiseBias)
{
(_pos = ((_pos * _noisePosScale) + _noisePosScaleBias));
float _noise = (_SmoothNoise(_pos) + (0.5 * _SmoothNoise((_pos * 3.0699999))));
(_noise = _Saturate(((_noise * _noiseScale) + _noiseBias)));
return _noise;
;
}
;
void _VolumetricFog(inout float3 _color, in float3 _rayOrigin, in float3 _rayDir, in float _sceneT, in float2 _fragCoord)
{
float s16 = {0};
if ((_sceneT <= 0.0))
{
(s16 = 200.0);
}
else
{
(s16 = _sceneT);
}
(_sceneT = s16);
float3 _seed = {0.067110561, 0.0058371499, 52.982918};
float _dither = frac((_seed.z * frac(dot(_fragCoord.xy, _seed.xy))));
float _fogAlpha = {0.0};
{ for(int _i = {0}; (_i < 32); (++_i))
{
float _t = (((vec1(_i) + 0.5) + _dither) * 5.0);
if ((_t <= _sceneT))
{
float3 _p = (_rayOrigin + (_t * _rayDir));
float _s = (_DensityNoise(_p, float3(0.30000001, 0.30000001, 0.30000001), float3(0.0, 0.0, 0.0), 1.0, 0.0) * exp(((-_p.y) * _gFogHeightFalloff)));
(_fogAlpha += (((_gFogDensity * _t) * exp(((-_gFogDensity) * _t))) * _s));
}
}
}
;
(_fogAlpha = (1.0 - _Saturate(_fogAlpha)));
(_color = ((_color * _fogAlpha) + (float3(1.0, 1.0, 1.0) * (1.0 - _fogAlpha))));
}
;
void _mainImage_float4(float3 ro, float3 rd, inout float4 _fragColor, in float2 _fragCoord)
{
(_gTime = (fmod(_Time.y, 100.)));
(_gCarOffset = (100.0 * _gTime));
float2 _screenUV = (1. / 1.);
float2 _p = (-1.0 + (2.0 * _screenUV));
(_p.x *= (1. / 1.));

float2 _mo = 1.;
float _mbStrength = {1.0};
float _fov = {1.2};
float _cameraOffset = _gCarOffset;
float _theta = clamp((10.0 * _mo.y), 0.0099999998, 1.7278761);
float _phi = (6.0 * _mo.x);
float3 _target = vec3((_gCarOffset + 1.0), 3.0, 3.0);
float _zoom = {15.0};
(_gFogDensity = 0.1);
(_gFogHeightFalloff = lerp(0.1, 0.30000001, _Saturate(((_gTime - 13.0) * 0.25))));
(_mbStrength = 1.0);
(_zoom = (10.0 + (1.2 * sin(_gTime))));
(_cameraOffset = _gCarOffset);
(_target = vec3((_gCarOffset + 2.0), 5.0, 3.0));
(_phi = 2.8);
(_theta = 1.267);
if ((_gTime > 18.799999))
{
(_gFogDensity = 0.1);
(_gFogHeightFalloff = 0.30000001);
(_mbStrength = 1.0);
float _camWeight = smoothstep(0.0, 1.0, _Saturate(((_gTime - 18.799999) * 0.25)));
(_zoom = lerp(_zoom, (8.0 + sin(_gTime)), _camWeight));
(_cameraOffset = _gCarOffset);
(_target = vec3((_gCarOffset + 2.0), 5.0, 3.0));
(_phi = lerp(_phi, 2.3499999, _camWeight));
(_theta = lerp(_theta, 1.27, _camWeight));
}
if ((_gTime > 33.0))
{
(_gFogDensity = 0.1);
(_gFogHeightFalloff = 0.0099999998);
(_mbStrength = 0.0);
(_zoom = 130.0);
(_cameraOffset = (_gCarOffset - ((_gTime - 38.0) * 80.0)));
(_target = vec3((_cameraOffset + 2.0), 5.0, 0.0));
(_phi = 2.3);
(_theta = 0.40000001);
}
if ((_gTime > 43.0))
{
(_gFogDensity = 0.1);
(_gFogHeightFalloff = 10.0);
(_mbStrength = 0.0);
(_fov = 2.0);
(_cameraOffset = (_gCarOffset - 10.0));
(_target = vec3((_gCarOffset + 2.0), 15.0, -16.0));
(_zoom = 1.0);
(_phi = 0.0);
(_theta = 0.0);
}
if ((_gTime > 53.5))
{
(_gFogDensity = 0.1);
(_gFogHeightFalloff = 0.30000001);
(_mbStrength = 1.0);
(_fov = min((1.2 + ((_gTime - 53.5) * 0.2)), 0.80000001));
(_zoom = (8.0 + (3.0 * cos(_gTime))));
(_cameraOffset = _gCarOffset);
(_target = vec3((_gCarOffset + 2.0), 5.0, -1.0));
(_phi = 3.1400001);
(_theta = 1.4);
}
if ((_gTime > 59.0))
{
(_mbStrength = 1.0);
(_fov = 2.0);
(_zoom = 7.0);
(_cameraOffset = _gCarOffset);
(_target = vec3((_gCarOffset + 1.0), 2.8, 5.5));
(_phi = 2.46);
(_theta = 1.17);
}
if ((_gTime > 67.0))
{
(_mbStrength = 1.0);
(_fov = 1.2);
float s17 = {0};
if ((_gTime < 95.0))
{
(s17 = smoothstep(0.0, 1.0, _Saturate(((_gTime - 80.0) * 0.25))));
}
else
{
(s17 = smoothstep(1.0, 0.0, _Saturate(((_gTime - 95.0) * 0.25))));
}
float _camWeight = s17;
(_zoom = (lerp(10.0, 6.0, _camWeight) + (1.3 * sin(_gTime))));
(_cameraOffset = _gCarOffset);
(_target = vec3((_gCarOffset + 2.0), 5.0, lerp(3.0, -1.0, _camWeight)));
(_phi = lerp(2.8, 3.5, _camWeight));
(_theta = lerp(1.267, 0.80000001, _camWeight));
}
if ((_gTime > 99.5))
{
(_fov = max((1.2 - ((_gTime - 99.5) * 0.5)), 0.5));
}
if ((_gTime > 100.0))
{
(_gCarOffset += ((_gTime - 100.0) * 10.0));
}
float3 _rayOrigin = {0, 0, 0};
(_rayOrigin.x = (((_zoom * sin(_theta)) * cos(_phi)) + _cameraOffset));
(_rayOrigin.y = (_zoom * cos(_theta)));
(_rayOrigin.z = ((_zoom * sin(_theta)) * sin(_phi)));
_rayOrigin += ro;
float3x3 _worldToCamera = _CameraLookAt(_rayOrigin, _target, 0.0);
float3 _rayDir = mul(transpose(_worldToCamera), normalize(vec3(_p.xy, _fov)));
//mul(transpose(_worldToCamera), normalize(vec3(_p.xy, _fov)));

_rayDir = rd;
//_rayDir += rd;

float3 _color = {0.0, 0.0, 0.0};
float _t = _CastRay(_rayOrigin, _rayDir);
if ((_t > 0.0))
{
float3 _pos = (_rayOrigin + (_t * _rayDir));
float3 _normal = _SceneNormal(_pos);
float3 _sunDir = {-0.83205032, -0.5547002, 0.0};
float3 _sunColor = {0.5, 0.1, 0.0};
float3 _posLS = (_pos * 0.1);
float3 _nrmLS = _normal;
float3 _absNrm = abs(_nrmLS);
float _maxAbsNrm = max(max(_absNrm.x, _absNrm.y), _absNrm.z);
float2 s18 = {0, 0};
if ((_absNrm.x >= _maxAbsNrm))
{
(s18 = _posLS.zy);
}
else
{
(s18 = _posLS.xy);
}
float2 _uvXZ = s18;
float2 s19 = {0, 0};
if ((_absNrm.y >= _maxAbsNrm))
{
(s19 = _posLS.xz);
}
else
{
(s19 = _uvXZ);
}
float2 _uvXYZ = s19;
float3 _diffuseColor = {1.0, 1.0, 1.0};
float3 _specularColor = {0.039999999, 0.039999999, 0.039999999};
float3 _emissive = {0.0, 0.0, 0.0};
float s20 = {0};
if ((_pos.y > 20.0))
{
(s20 = 0.30000001);
}
else
{
(s20 = 0.5);
}
(_diffuseColor = vec3(s20));
bool s21 = (_gMaterial == 1.0);
if (s21)
{
(s21 = (abs(_pos.z) < 14.0));
}
if (s21)
{
(_diffuseColor = float3(0.5, 0.5, 0.5));
if ((abs(_pos.z) < 0.2))
{
(_diffuseColor = float3(1.0, 1.0, 1.0));
}
bool s22 = (abs((_pos.z + 7.0)) < 0.2);
if ((!s22))
{
(s22 = (abs((_pos.z - 7.0)) < 0.2));
}
if (s22)
{
(_diffuseColor = vec3((0.5 + (0.5 * exp((-4.0 * abs(((2.0 * frac((_pos.x * 0.1))) - 1.0))))))));
}
float _trailX = (_pos.x - _gCarOffset);
(_emissive = (((float3(1.3200001, 0.0, 0.0) * _Saturate(exp((-0.40000001 * abs((_pos.z - 3.0)))))) * _Saturate((1.0 + (_trailX * 0.0020000001)))) * _Saturate((-0.5 - (_trailX * 0.5)))));
}
if ((_gMaterial == 4.0))
{
float3 s23 = {0, 0, 0};
bool s24 = (_pos.y > 11.5);
if (s24)
{
(s24 = (_normal.y > 0.5));
}
if (s24)
{
(s23 = float3(1.0, 1.0, 1.0));
}
else
{
(s23 = float3(0.0, 0.0, 0.0));
}
(_emissive = s23);
}
bool s25 = (_gMaterial == 2.0);
if (s25)
{
(s25 = (abs(_normal.y) < 0.1));
}
if (s25)
{
(_diffuseColor = float3(0.69999999, 0.69999999, 0.69999999));
float2 _tilePos = frac((_uvXZ * 4.0));
float2 _tileId = ((_uvXZ * 4.0) - _tilePos);
float2 _edge = min(clamp(((_tilePos - 0.2) * 5.0), 0.0, 1.0), clamp(((1.0 - _tilePos) * 5.0), 0.0, 1.0));
float _bump = (_edge.x * _edge.y);
float _tileRand = _Rand(_tileId);
float3 _tileColor = {0.30000001, 0.30000001, 0.30000001};
float3 s26 = {0, 0, 0};
if ((_tileRand > 0.5))
{
(s26 = float3(1.2, 0.36000001, 0.60000002));
}
else
{
(s26 = _tileColor);
}
(_tileColor = s26);
float3 s27 = {0, 0, 0};
if ((_tileRand > 0.69999999))
{
(s27 = float3(1.2, 0.60000002, 0.0));
}
else
{
(s27 = _tileColor);
}
(_tileColor = s27);
float3 s28 = {0, 0, 0};
if ((_tileRand > 0.89999998))
{
(s28 = float3(1.2, 0.60000002, 1.08));
}
else
{
(s28 = _tileColor);
}
(_tileColor = s28);
(_emissive = (((1.0 * _bump) * _tileRand) * _tileColor));
(_emissive *= clamp(((4.0 * abs((_tilePos.x - 0.5))) + 0.5), 0.0, 1.0));
(_emissive *= clamp(((4.0 * abs((_tilePos.y - 0.5))) + 0.5), 0.0, 1.0));
}
if ((_gMaterial == 2.0))
{
float _buildingLine = abs(((2.0 * frac(((_uvXZ.y * 2.0) - 0.050000001))) - 1.0));
(_emissive += (float3(1.08, 0.83999997, 1.5599999) * exp2(((-_buildingLine) * 4.0))));
if ((_pos.y < 5.0))
{
(_emissive = float3(0.0, 0.0, 0.0));
}
if ((abs(((-_normal.y) - 1.0)) < 0.1))
{
(_diffuseColor = float3(0.30000001, 0.30000001, 0.30000001));
(_emissive = float3(0.0, 0.0, 0.0));
}
}
if ((_gMaterial == 5.0))
{
(_diffuseColor = float3(0.80000001, 0.80000001, 0.80000001));
}
if ((_gMaterial == 3.0))
{
(_diffuseColor = float3(0.1, 0.1, 0.1));
(_specularColor = float3(0.60000002, 0.60000002, 0.60000002));
float2 _pl = _pos.zy;
(_pl.x = abs((_pl.x - 3.0)));
float _dl = _Rectangle((_pl + float2(-1.0, -1.3)), float2(0.40000001, 0.059999999));
float _es = _Saturate(exp(((-_dl) * 20.0)));
(_emissive = (float3(1.8000001, 0.15000001, 0.45000002) * _es));
(_specularColor *= (1.0 - _es));
}
if ((((_gMaterial == 3.0) && (_gTime > 59.0)) && (_gTime < 67.0)))
{
(_diffuseColor = float3(0.2, 0.2, 0.2));
(_specularColor = float3(0.039999999, 0.039999999, 0.039999999));
(_emissive = _Dashboard(_pos));
}
float _wrap = {0.5};
float3 _diffuse = ((_diffuseColor * _sunColor) * _Saturate(((dot(_normal, _sunDir) + _wrap) / (1.0 + _wrap))));
(_color = _diffuse);
float3 _halfVec2 = normalize((_sunDir + _rayDir));
float _NdotH2 = dot(_normal, _halfVec2);
(_color += (((_sunColor * _specularColor) * _Saturate(dot(_normal, _sunDir))) * pow(clamp(_NdotH2, 0.0, 1.0), 32.0)));
float3 _pos2 = _pos;
(_pos2.x = webgl_mod_emu(_pos2.x, 50.0));
float3 _tubeColor = {162.0, 125.99999, 233.99998};
float3 _tubePos = {25.0, -10.0, 0.0};
float3 _tubeLeft = {0.0, 0.0, 1.0};
(_tubePos += (_tubeLeft * clamp(dot((_pos2 - _tubePos), _tubeLeft), -7.0, 7.0)));
float3 _tubeDir = normalize((_tubePos - _pos2));
float _tubeAtt = (1.0 / pow(length((_tubePos - _pos2)), 2.0));
(_color += (((_diffuseColor * _tubeColor) * _tubeAtt) * _Saturate(dot(_normal, _tubeDir))));
float3 _spotColor = {162.0, 125.99999, 233.99998};
float3 _spotPos = vec3((3.0999999 + _gCarOffset), -1.5, 3.0);
float3 _spotDir = normalize((_spotPos - _pos));
float _spotAtt = (1.0 / pow(length((_spotPos - _pos)), 2.0));
(_spotAtt *= _Saturate((((-_spotDir.x) * 6.0) - 4.0)));
(_color += (((_diffuseColor * _spotColor) * _spotAtt) * _Saturate(dot(_normal, _spotDir))));
(_color += (float3(0.054000001, 0.041999999, 0.078000002) * clamp(((-_normal.y) + 0.5), 0.0, 1.0)));
float s29 = {0};
if ((_gMaterial == 1.0))
{
(s29 = _TerrainAO(_pos));
}
else
{
(s29 = 1.0);
}
(_color *= s29);
(_color += _emissive);
float _fresnel = _Saturate(pow((1.0 + dot(_rayDir, (-_normal))), 5.0));
(_specularColor = lerp(_specularColor, float3(1.0, 1.0, 1.0), _fresnel));
float3 s30 = {0, 0, 0};
if (((_gMaterial == 1.0) || (_gMaterial == 5.0)))
{
(s30 = (_specularColor * 0.050000001));
}
else
{
(s30 = _specularColor);
}
(_specularColor = s30);
(_color += ((_specularColor * 0.5) * _SceneReflection(_pos, _normal, _rayDir)));
(_color *= (1.0 - (clamp(((_t - 200.0) * 0.0099999998), 0.0, 1.0) * 0.80000001)));
float s31 = {0};
if ((_gMaterial == 2.0))
{
(s31 = 2.0);
}
else
{
(s31 = 0.5);
}
float2 _tilePos = webgl_mod_emu((_uvXYZ * vec2(s31, 2.0)), 1.0);
(_tilePos = abs(((2.0 * _tilePos) - 1.0)));
float _wireframe = (exp2(((-_tilePos.x) * 6.0)) + exp2(((-_tilePos.y) * 6.0)));
float s32 = {0};
if ((_gTime > 50.0))
{
(s32 = (_Saturate(((_pos.x - 7080.0) * 0.050000001)) * _Saturate(((8080.0 - _pos.x) * 0.050000001))));
}
else
{
(s32 = _Saturate((1.0 - ((_gTime - 13.5) / 4.0))));
}
float _wireframeAlpha = s32;
float s33 = {0};
if ((_gMaterial == 3.0))
{
(s33 = 0.0);
}
else
{
(s33 = _wireframeAlpha);
}
(_wireframeAlpha = s33);
(_color = lerp(_color, (_Sky(_rayDir) + ((_wireframe * float3(0.54000002, 0.41999999, 0.77999997)) * 1.2)), _wireframeAlpha));
(_mbStrength *= (1.0 - _wireframeAlpha));
}
else
{
(_color = _Sky(_rayDir));
(_mbStrength = 0.0);
}
_VolumetricFog(_color, _rayOrigin, _rayDir, _t, _fragCoord);
(_color += _SceneBloom(_rayOrigin, _rayDir));
(_color *= _Saturate(((107.0 - _gTime) / 5.0)));
(_fragColor = vec4(_color, _mbStrength));
}
;
;






		
		//--------------------------------------------------
 
            struct v2f {
                float4 position : SV_POSITION;
                float3 worldSpacePosition : TEXCOORD0;
                float3 worldSpaceView : TEXCOORD1;
            };
     
            v2f vert(appdata_full i) {				
                v2f o;
                o.position = UnityObjectToClipPos (i.vertex);         
                float4 vertexWorld = mul(unity_ObjectToWorld, i.vertex);         
                o.worldSpacePosition = vertexWorld.xyz;
                o.worldSpaceView = vertexWorld.xyz - _WorldSpaceCameraPos;
                return o;
            }
 
            fixed4 frag(v2f i) : SV_Target 
			{				
			float4 CameraDistance =  mul(unity_WorldToObject, float4(_WorldSpaceCameraPos, 1.0));
				
			if (length(CameraDistance) > _DistanceThreshold)
			return fixed4(1.,1.,1.,0.);
			
			
			float3 ro = _WorldSpaceCameraPos - mul(unity_ObjectToWorld, float4(0.,0.,0.,1.)) + float3(0.,_HeightOffset,0.);
			float3 rd = normalize(i.worldSpaceView);
			//float3 _dir = rd;				
			//float3 _from = (float3(-1.0, 0.69999999, 0.0) + _move(_dir) + float3(-ro.x,0.2,-ro.z));
			
			float4 _color = {0.0, 0.0, 0.0, 1.0};

			//gl_FragCoord = ((i.position.xy/i.position.w)*_ScreenParams.xy);
			_mainImage_float4(ro, rd, _color, float2(1.,1.));
					
			//float3 _color = _raymarch(_from, _dir);	

			
			float3 contrast = ((_color.rgb - 0.5f) * max(_Contrast, 0)) + 0.5f;         
			return float4(_color.r, _color.g, _color.b, 1.0);			
            }
 
            ENDCG
        }
//PASSHERE
    }
}