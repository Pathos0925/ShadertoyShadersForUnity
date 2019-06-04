//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/Xtf3Rn
//Generators 
//by Kali

Shader "Clawbird/Genrators" {
    Properties {

			_DistanceThreshold ("_DistanceThreshold", float) = 1.8
			
			_Contrast ("Contrast", float) = 1.0
			
			_HeightOffset ("HeightOffset", float) = 0.0
			_SC ("SC", float) = 0.0
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
     
            #pragma target 3.0
 
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
float vec1(int x0)
{
    return float(x0);
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
float3 vec3(float2 x0, float x1)
{
    return float3(x0, x1);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Uniforms

uniform float4 _iMouse : register(c0);
uniform float3 _iResolution : register(c1);
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
    SamplerMetadata samplerMetadata[1] : packoffset(c4);
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
float2 webgl_mod_emu(float2 x, float y)
{
    return x - y * floor(x / y);
}



float webgl_mod_emu(float x, float y)
{
    return x - y * floor(x / y);
}



float webgl_atan_emu(float y, float x)
{
    if(x == 0 && y == 0) x = 1;
    return atan2(y, x);
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
static float3 _lightdir = {0.43193421, -0.25916052, -0.86386842};
static float3 _ambdir = {0.0, 0.0, 1.0};
static float3 _energy = {0.0099999998, 0.0099999998, 0.0099999998};
static float _vibration = {0.0};
static float _det = {0.0};
static float3 _pth1 = {0, 0, 0};
float2x2 _rot(in float _a)
{
return mat2(cos(_a), sin(_a), (-sin(_a)), cos(_a));
;
}
;
float3 _path(in float _ti)
{
return (vec3(sin(_ti), (0.30000001 - (sin((_ti * 0.63200003)) * 0.30000001)), cos((_ti * 0.5))) * 0.5);
;
}
;
float _Sphere(in float3 _p, in float3 _rd, in float _r)
{
float _b = dot((-_p), _rd);
float _inner = (((_b * _b) - dot(_p, _p)) + (_r * _r));
if ((_inner < 0.0))
{
return -1.0;
;
}
return (_b - sqrt(_inner));
;
}
;
float2 _de(in float3 _pos)
{
float _hid = {0.0};
float3 _tpos = _pos;
(_tpos.xz = abs((0.5 - webgl_mod_emu(_tpos.xz, 1.0))));
float4 _p = vec4(_tpos, 1.0);
float _y = (max(0.0, (0.34999999 - abs((_pos.y - 3.3499999)))) / 0.34999999);
{ for(int _i = {0}; (_i < 7); (_i++))
{
(_p.xyz = (abs(_p.xyz) - float3(-0.02, 1.98, -0.02)));
(_p = (((_p * (2.0 + (_vibration * _y))) / clamp(dot(_p.xyz, _p.xyz), 0.40000001, 1.0)) - float4(0.5, 1.0, 0.40000001, 0.0)));
(_p.xz = mul(_p.xz, transpose(float2x2(-0.41600001, -0.91000003, 0.91000003, -0.41600001))));
}
}
;
float _fl = (_pos.y - 3.013);
float _fr = ((length(max((abs(_p.xyz) - float3(0.1, 5.0, 0.1)), float3(0.0, 0.0, 0.0))) - 0.050000001) / _p.w);
float _d = min(_fl, _fr);
(_d = min(_d, ((-_pos.y) + 3.95)));
if ((abs((_d - _fl)) < 0.001))
{
(_hid = 1.0);
}
return vec2(_d, _hid);
;
}
;
float3 _normal(in float3 _p)
{
float3 _e = vec3(0.0, _det, 0.0);
return normalize(vec3((_de((_p + _e.yxx)).x - _de((_p - _e.yxx)).x), (_de((_p + _e.xyx)).x - _de((_p - _e.xyx)).x), (_de((_p + _e.xxy)).x - _de((_p - _e.xxy)).x)));
;
}
;
float _shadow(in float3 _pos, in float3 _sdir)
{
float _sh = {1.0};
float _totdist = (2.0 * _det);
float _dist = {10.0};
float _t1 = _Sphere(((_pos - (0.0049999999 * _sdir)) - _pth1), (-_sdir), 0.015);
if (((_t1 > 0.0) && (_t1 < 0.5)))
{
float3 _sphglowNorm = normalize(((_pos - (_t1 * _sdir)) - _pth1));
(_sh = (1.0 - pow((max(0.0, dot(_sphglowNorm, _sdir)) * 1.2), 3.0)));
}
{ for(int _steps = {0}; (_steps < 50); (_steps++))
{
if (((_totdist < 0.60000002) && (_dist > 4.9999999e-05)))
{
float3 _p = (_pos - (_totdist * _sdir));
(_dist = _de(_p).x);
(_sh = min(_sh, max(((50.0 * _dist) / _totdist), 0.0)));
(_totdist += max(0.0099999998, _dist));
}
}
}
;
return clamp(_sh, 0.1, 1.0);
;
}
;
float _calcAO(const float3 _pos, const float3 _nor)
{
float _aodet = {0.0019999999};
float _totao = {0.0};
float _sca = {14.0};
{ for(int _aoi = {0}; (_aoi < 5); (_aoi++))
{
float _hr = (_aodet * vec1((_aoi * _aoi)));
float3 _aopos = ((_nor * _hr) + _pos);
float _dd = _de(_aopos).x;
(_totao += ((-(_dd - _hr)) * _sca));
(_sca *= 0.69999999);
}
}
;
return clamp((1.0 - (5.0 * _totao)), 0.0, 1.0);
;
}
;
float __texture(in float3 _p)
{
(_p = abs((0.5 - frac((_p * 10.0)))));
float3 _c = {3.0, 3.0, 3.0};
float _es = {0};
float _l = (_es = 0.0);
{ for(int _i = {0}; (_i < 10); (_i++))
{
(_p = ((abs((_p + _c)) - abs((_p - _c))) - _p));
(_p /= clamp(dot(_p, _p), 0.0, 1.0));
(_p = ((_p * -1.5) + _c));
if ((webgl_mod_emu(vec1(_i), 2.0) < 1.0))
{
float _pl = _l;
(_l = length(_p));
(_es += exp((-1.0 / abs((_l - _pl)))));
}
}
}
;
return _es;
;
}
;
float3 _light(in float3 _p, in float3 _dir, in float3 _n, in float _hid)
{
float _sh = _shadow(_p, _lightdir);
float _ao = _calcAO(_p, _n);
float _diff = (max(0.0, dot(_lightdir, (-_n))) * _sh);
float _y = (3.3499999 - _p.y);
float3 _amb = ((max(0.5, dot(_dir, (-_n))) * 0.5) * float3(0.80000001, 0.82999998, 1.0));
if ((_hid < 0.5))
{
(_amb += (((max(0.2, dot(float3(0.0, 1.0, 0.0), (-_n))) * float3(1.0, 0.69999999, 0.89999998)) * pow((max(0.0, (0.2 - abs((3.0 - _p.y)))) / 0.2), 1.5)) * 2.0));
(_amb += (((_energy * pow((max(0.0, (0.40000001 - abs(_y))) / 0.40000001), 2.0)) * max(0.2, dot(vec3(0.0, (-sign(_y)), 0.0), (-_n)))) * 2.0));
}
float3 _r = reflect(_lightdir, _n);
float _spec = pow((max(0.0, dot(_dir, (-_r))) * _sh), 10.0);
float3 _col = {0, 0, 0};
float _energysource = (pow((max(0.0, (0.039999999 - abs(_y))) / 0.039999999), 4.0) * 2.0);
if ((_hid > 1.5))
{
(_col = float3(1.0, 1.0, 1.0));
(_spec = (_spec * _spec));
}
else
{
float _k = ((__texture(_p) * 0.23) + 0.2);
(_k = min(_k, (1.5 - _energysource)));
(_col = lerp(vec3(_k, (_k * _k), ((_k * _k) * _k)), vec3(_k), 0.30000001));
if ((abs((_hid - 1.0)) < 0.001))
{
(_col *= float3(1.3, 0.90999997, 1.17));
}
}
(_col = ((_col * (_amb + (_diff * float3(0.85000002, 0.89999998, 1.0)))) + (_spec * float3(0.85000002, 0.89999998, 1.0))));
if ((_hid < 0.5))
{
(_col = max(_col, ((_energy * 2.0) * _energysource)));
}
(_col *= min(1.0, (_ao + (((length(_energy) * 0.5) * max(0.0, (0.1 - abs(_y)))) / 0.1))));
return _col;
;
}
;
float3 _raymarch(in float3 _from, in float3 _dir)
{
float _ey = webgl_mod_emu(((_Time.y * 0.25) * 0.5), 1.0);
float _glow = {0};
float _eglow = {0};
float _ref = {0};
float _sphdist = {0};
float _totdist = (_glow = (_eglow = (_ref = (_sphdist = 0.0))));
float2 _d = {1.0, 0.0};
float3 _p = {0, 0, 0};
float3 _col = {0.0, 0.0, 0.0};
float3 _origdir = _dir;
float3 _origfrom = _from;
float3 _sphNorm = {0, 0, 0};
float3 _wob = (cos(((((_dir * 500.0) * length((_from - _pth1))) + ((_from - _pth1) * 250.0)) + (_Time.y * 10.0))) * 0.00050000002);
float _t1 = _Sphere(((_from - _pth1) + _wob), _dir, 0.015);
float _tg = _Sphere(((_from - _pth1) + _wob), _dir, 0.02);
if ((_t1 > 0.0))
{
(_ref = 1.0);
(_from += (_t1 * _dir));
(_sphdist = _t1);
(_sphNorm = normalize(((_from - _pth1) + _wob)));
(_dir = reflect(_dir, _sphNorm));
}
else
{
if ((_tg > 0.0))
{
float3 _sphglowNorm = normalize((((_from + (_tg * _dir)) - _pth1) + _wob));
(_glow += pow(max(0.0, dot(_sphglowNorm, (-_dir))), 5.0));
}
}
{ for(int _i = {0}; (_i < 70); (_i++))
{
if (((_d.x > _det) && (_totdist < 3.0)))
{
(_p = (_from + (_totdist * _dir)));
(_d = _de(_p));
(_det = ((4.9999999e-05 * (1.0 + (_totdist * 60.0))) * (1.0 + (_ref * 5.0))));
(_totdist += _d.x);
(_energy = ((float3(1.0, 0.69999999, 0.40000001) * (1.5 + sin(((_Time.y * 20.0) + (_p.z * 10.0))))) * 0.25));
if ((_d.x < 0.015))
{
(_glow += (max(0.0, (0.015 - _d.x)) * exp((-_totdist))));
}
bool s1 = (_d.y < 0.5);
if (s1)
{
(s1 = (_d.x < 0.029999999));
}
if (s1)
{
float _glw = min(abs(((3.3499999 - _p.y) - _ey)), abs(((3.3499999 - _p.y) + _ey)));
(_eglow += (((max(0.0, (0.029999999 - _d.x)) / 0.029999999) * (pow((max(0.0, (0.050000001 - _glw)) / 0.050000001), 5.0) + pow((max(0.0, (0.15000001 - abs((3.3499999 - _p.y)))) / 0.15000001), 8.0))) * 1.5));
}
}
}
}
;
float _l = pow(max(0.0, dot(normalize((-_dir.xz)), normalize(_lightdir.xz))), 2.0);
(_l *= max(0.2, dot((-_dir), _lightdir)));
float3 _backg = ((0.5 * (1.2 - _l)) + ((float3(0.85000002, 0.89999998, 1.0) * _l) * 0.69999999));
(_backg *= float3(0.80000001, 0.82999998, 1.0));
if ((_d.x <= _det))
{
float3 _norm = _normal((_p - (abs((_d.x - _det)) * _dir)));
(_col = (_light((_p - (abs((_d.x - _det)) * _dir)), _dir, _norm, _d.y) * exp(((-0.2 * _totdist) * _totdist))));
(_col = lerp(_col, _backg, (1.0 - exp((-1.0 * pow(_totdist, 1.5))))));
}
else
{
(_col = _backg);
}
float3 _lglow = ((float3(0.85000002, 0.89999998, 1.0) * pow(_l, 30.0)) * 0.5);
(_col += ((_glow * (_backg + _lglow)) * 1.3));
(_col += ((pow(_eglow, 2.0) * _energy) * 0.015));
(_col += (_lglow * min(1.0, ((_totdist * _totdist) * 0.30000001))));
if ((_ref > 0.5))
{
float3 _sphlight = _light((_origfrom + (_sphdist * _origdir)), _origdir, _sphNorm, 2.0);
(_col = lerp(((_col * 0.30000001) + (_sphlight * 0.69999999)), _backg, (1.0 - exp((-1.0 * pow(_sphdist, 1.5))))));
}
return _col;
;
}
;
float3 _move_float2x2_float2x2(inout float2x2 _rotview1, inout float2x2 _rotview2)
{
float3 _go = _path((_Time.y * 0.25));
float3 _adv = _path(((_Time.y * 0.25) + 0.69999999));
float3 _advec = normalize((_adv - _go));
float _an = webgl_atan_emu(_advec.x, _advec.z);
(_rotview1 = mat2(cos(_an), sin(_an), (-sin(_an)), cos(_an)));
(_an = (_advec.y * 1.7));
(_rotview2 = mat2(cos(_an), sin(_an), (-sin(_an)), cos(_an)));
return _go;
;
}
;
void _mainImage_float4(float3 ro, float3 rd, inout float4 _fragColor, in float2 _fragCoord)
{
(_pth1 = ((_path(((_Time.y * 0.25) + 0.30000001)) + float3(0.0, 3.1099999, 0.0)) + float3(0.0, 0.0099999998, 0.0)));
float2 _uv = (((0.5 / 1.0) * 2.0) - 1.0);
//_uv = float2(1.,1.);
float2 _uv2 = _uv;
(_uv *= (1.0 + (pow(length((((_uv2 * _uv2) * _uv2) * _uv2)), 4.0) * 0.07)));
(_uv.y *= (1. / 1.));
float2 _mouse = (((1. / 1.) - 0.5) * 3.0);
if ((_iMouse.z < 1.0))
{
(_mouse = float2(0.0, 0.0));
}
float2x2 _rotview1 = {0, 0, 0, 0};
float2x2 _rotview2 = {0, 0, 0, 0};
float3 _from = (float3(0.0, 3.1099999, 0.0) + _move_float2x2_float2x2(_rotview1, _rotview2));

float3 _dir = normalize(vec3((_uv * 0.80000001), 1.0));

(_dir.yz = mul(_dir.yz, transpose(_rot(_mouse.y))));
(_dir.xz = mul(_dir.xz, transpose(_rot(_mouse.x))));
(_dir.yz = mul(_dir.yz, transpose(_rotview2)));
(_dir.xz = mul(_dir.xz, transpose(_rotview1)));

_from += ro * 0.05;
_dir = rd;
float3 _color = _raymarch(_from, _dir);
(_color = clamp(_color, float3(0.0, 0.0, 0.0), float3(1.0, 1.0, 1.0)));
(_color = (pow(_color, float3(1.3, 1.3, 1.3)) * 0.89999998));
(_color = lerp(vec3(length(_color)), _color, 0.85000002));
float3 _rain = pow(gl_texture2D(0, (_uv2 + (_Time.y * 7.2546802))).xyz, float3(1.5, 1.5, 1.5));
(_color = lerp(_rain, _color, clamp(((_Time.y * 0.5) - 0.5), 0.0, 1.0)));
(_color *= (1.0 - pow((length((((_uv2 * _uv2) * _uv2) * _uv2)) * 1.1), 6.0)));
(_uv2.y *= (1. / 360.0));
(_color.x *= ((0.5 + (abs((0.5 - (webgl_mod_emu(_uv2.y, 0.021) / 0.021))) * 0.5)) * 1.5));
(_color.y *= ((0.5 + (abs((0.5 - (webgl_mod_emu((_uv2.y + 0.0070000002), 0.021) / 0.021))) * 0.5)) * 1.5));
(_color.z *= ((0.5 + (abs((0.5 - (webgl_mod_emu((_uv2.y + 0.014), 0.021) / 0.021))) * 0.5)) * 1.5));
(_color *= (0.89999998 + (_rain * 0.34999999)));
(_fragColor = vec4(_color, 1.0));
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

			_mainImage_float4(ro, rd, _color, float2(1.,1.));
					
			//float3 _color = _raymarch(_from, _dir);	

			
			float3 contrast = ((_color.rgb - 0.5f) * max(_Contrast, 0)) + 0.5f;         
			return float4(_color.x, _color.y, _color.z, 1.0);			
            }
 
            ENDCG
        }
//PASSHERE
    }
}