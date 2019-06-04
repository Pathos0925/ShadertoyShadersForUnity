//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/4sjSW1
//Remnant X 
//by Dave_Hoskins

Shader "Clawbird/Remnant" {
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
float3x3 mat3(float x0, float x1, float x2, float x3, float x4, float x5, float x6, float x7, float x8)
{
    return float3x3(x0, x1, x2, x3, x4, x5, x6, x7, x8);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
float4 vec4(float3 x0, int x1)
{
    return float4(x0, x1);
}
// Uniforms

uniform float3 _iChannelResolution[4] : register(c0);
uniform float4 _iMouse : register(c4);
uniform float3 _iResolution : register(c5);

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
float webgl_mod_emu(float x, float y)
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
static float3 _sunDir = {0.74199849, 0.21199958, 0.63599873};
static float _minRad2 = {0.25};
static float _absScalem1 = {1.8};
static float _AbsScaleRaisedTo1mIters = {9.4531766e-05};
static float3 _surfaceColour1 = {0.80000001, 0.0, 0.0};
static float3 _surfaceColour2 = {0.40000001, 0.40000001, 0.5};
static float3 _surfaceColour3 = {0.5, 0.30000001, 0.0};
static float3 _fogCol = {0.40000001, 0.40000001, 0.40000001};
static float _gTime = {0};
float _Noise(in float3 _x)
{
float3 _p = floor(_x);
float3 _f = frac(_x);
(_f = ((_f * _f) * (3.0 - (2.0 * _f))));
float2 _uv = ((_p.xy + (float2(37.0, 17.0) * _p.z)) + _f.xy);
float2 _rg = gl_texture2DLod(1, ((_uv + 0.5) / 256.0), 0.0 ).yx;
return lerp(_rg.x, _rg.y, _f.z);
;
}
;
float _Map(in float3 _pos)
{
float4 _p = vec4(_pos, 1);
float4 _p0 = _p;
{ for(int _i = {0}; (_i < 9); (_i++))
{
(_p.xyz = ((clamp(_p.xyz, -1.0, 1.0) * 2.0) - _p.xyz));
float _r2 = dot(_p.xyz, _p.xyz);
(_p *= clamp(max((_minRad2 / _r2), _minRad2), 0.0, 1.0));
(_p = ((_p * (float4(2.8, 2.8, 2.8, 2.8) / _minRad2)) + _p0));
}
}
;
return (((length(_p.xyz) - _absScalem1) / _p.w) - _AbsScaleRaisedTo1mIters);
;
}
;
float3 _Colour(in float3 _pos, in float _sphereR)
{
float3 _p = _pos;
float3 _p0 = _p;
float _trap = {1.0};
{ for(int _i = {0}; (_i < 6); (_i++))
{
(_p.xyz = ((clamp(_p.xyz, -1.0, 1.0) * 2.0) - _p.xyz));
float _r2 = dot(_p.xyz, _p.xyz);
(_p *= clamp(max((_minRad2 / _r2), _minRad2), 0.0, 1.0));
(_p = ((_p * (float4(2.8, 2.8, 2.8, 2.8) / _minRad2).xyz) + _p0.xyz));
(_trap = min(_trap, _r2));
}
}
;
float2 _c = clamp(vec2(((0.33329999 * log(dot(_p, _p))) - 1.0), sqrt(_trap)), 0.0, 1.0);
float _t = webgl_mod_emu((length(_pos) - (_gTime * 150.0)), 16.0);
(_surfaceColour1 = lerp(_surfaceColour1, float3(0.40000001, 3.0, 5.0), pow((smoothstep(0.0, 0.30000001, _t) * smoothstep(0.60000002, 0.30000001, _t)), 10.0)));
return lerp(lerp(_surfaceColour1, _surfaceColour2, _c.y), _surfaceColour3, _c.x);
;
}
;
float3 _GetNormal(in float3 _pos, in float _distance)
{
(_distance *= 0.0011);
float2 _eps = vec2(_distance, 0.0);
float3 _nor = vec3((_Map((_pos + _eps.xyy)) - _Map((_pos - _eps.xyy))), (_Map((_pos + _eps.yxy)) - _Map((_pos - _eps.yxy))), (_Map((_pos + _eps.yyx)) - _Map((_pos - _eps.yyx))));
return normalize(_nor);
;
}
;
float _GetSky(in float3 _pos)
{
(_pos *= 2.3);
float _t = _Noise(_pos);
(_t += (_Noise((_pos * 2.0999999)) * 0.5));
(_t += (_Noise((_pos * 4.3000002)) * 0.25));
(_t += (_Noise((_pos * 7.9000001)) * 0.125));
return _t;
;
}
;
float _BinarySubdivision(in float3 _rO, in float3 _rD, in float2 _t)
{
float _halfwayT = {0};
{ for(int _i = {0}; (_i < 6); (_i++))
{
(_halfwayT = dot(_t, float2(0.5, 0.5)));
float _d = _Map((_rO + (_halfwayT * _rD)));
(_t = lerp(vec2(_t.x, _halfwayT), vec2(_halfwayT, _t.y), step(0.00050000002, _d)));
}
}
;
return _halfwayT;
;
}
;
float2 _Scene(in float3 _rO, in float3 _rD, in float2 _fragCoord)
{
float _t = (0.050000001 + (0.050000001 * gl_texture2D(0, (_fragCoord.xy / 1.)).y));
float3 _p = {0.0, 0.0, 0.0};
float _oldT = {0.0};
bool _hit = {false};
float _glow = {0.0};
float2 _dist = {0, 0};
{ for(int _j = {0}; (_j < 100); (_j++))
{
if ((_t > 12.0))
{
break;
;
}
(_p = (_rO + (_t * _rD)));
float _h = _Map(_p);
if ((_h < 0.00050000002))
{
(_dist = vec2(_oldT, _t));
(_hit = true);
break;
;
}
(_glow += clamp((0.050000001 - _h), 0.0, 0.40000001));
(_oldT = _t);
(_t += (_h + (_t * 0.001)));
}
}
;
if ((!_hit))
{
(_t = 1000.0);
}
else
{
(_t = _BinarySubdivision(_rO, _rD, _dist));
}
return vec2(_t, clamp((_glow * 0.25), 0.0, 1.0));
;
}
;
float3 _PostEffects(in float3 _rgb, in float2 _xy)
{
(_rgb = pow(_rgb, float3(0.47, 0.47, 0.47)));
(_rgb = lerp(float3(0.5, 0.5, 0.5), lerp(vec3(dot(float3(0.21250001, 0.71539998, 0.072099999), (_rgb * 1.2))), (_rgb * 1.2), 1.4), 1.4));
(_rgb *= (0.5 + (0.5 * pow(((((20.0 * _xy.x) * _xy.y) * (1.0 - _xy.x)) * (1.0 - _xy.y)), 0.2))));
return _rgb;
;
}
;
float _Shadow(in float3 _ro, in float3 _rd)
{
float _res = {1.0};
float _t = {0.050000001};
float _h = {0};
{ for(int _i = {0}; (_i < 8); (_i++))
{
(_h = _Map((_ro + (_rd * _t))));
(_res = min(((6.0 * _h) / _t), _res));
(_t += _h);
}
}
;
return max(_res, 0.0);
;
}
;
float3x3 _RotationMatrix(in float3 _axis, in float _angle)
{
(_axis = normalize(_axis));
float _s = sin(_angle);
float _c = cos(_angle);
float _oc = (1.0 - _c);
return mat3((((_oc * _axis.x) * _axis.x) + _c), (((_oc * _axis.x) * _axis.y) - (_axis.z * _s)), (((_oc * _axis.z) * _axis.x) + (_axis.y * _s)), (((_oc * _axis.x) * _axis.y) + (_axis.z * _s)), (((_oc * _axis.y) * _axis.y) + _c), (((_oc * _axis.y) * _axis.z) - (_axis.x * _s)), (((_oc * _axis.z) * _axis.x) - (_axis.y * _s)), (((_oc * _axis.y) * _axis.z) + (_axis.x * _s)), (((_oc * _axis.z) * _axis.z) + _c));
;
}
;
float3 _LightSource(in float3 _spotLight, in float3 _dir, in float _dis)
{
float _g = {0.0};
if ((length(_spotLight) < _dis))
{
(_g = pow(max(dot(normalize(_spotLight), _dir), 0.0), 500.0));
}
return (float3(0.60000002, 0.60000002, 0.60000002) * _g);
;
}
;
float3 _CameraPath(in float _t)
{
float3 _p = vec3((-0.77999997 + (3.0 * sin((2.1400001 * _t)))), (0.050000001 + (2.5 * sin(((0.94199997 * _t) + 1.3)))), (0.050000001 + (3.5 * cos((3.5940001 * _t)))));
return _p;
;
}
;
void _mainImage_float4(float3 ro, float3 rd, inout float4 _fragColor, in float2 _fragCoord)
{
float _m = ((1. / 1.) * 300.0);
(_gTime = (((_Time.y + _m) * 0.0099999998) + 15.0));
float2 _xy = (_fragCoord.xy / 1.);
float2 _uv = ((-1.0 + (2.0 * _xy)) * vec2((1. / 1.), 1.0));
float3 _cameraPos = _CameraPath(_gTime);
_cameraPos += ro * 0.2;
float3 _camTar = _CameraPath((_gTime + 0.0099999998));
float _roll = (13.0 * sin(((_gTime * 0.5) + 0.40000001)));
float3 _cw = normalize((_camTar - _cameraPos));
float3 _cp = vec3(sin(_roll), cos(_roll), 0.0);
float3 _cu = normalize(cross(_cw, _cp));
float3 _cv = normalize(cross(_cu, _cw));
(_cw = mul(transpose(_RotationMatrix(_cv, (sin(((-_gTime) * 20.0)) * 0.69999999))), _cw));
float3 _dir = normalize((((_uv.x * _cu) + (_uv.y * _cv)) + (1.3 * _cw)));
_dir = rd;
float3 _spotLight = (_CameraPath((_gTime + 0.029999999)) + (vec3(sin((_gTime * 18.4)), cos((_gTime * 17.98)), sin((_gTime * 22.530001))) * 0.2));
float3 _col = {0.0, 0.0, 0.0};
float3 _sky = (float3(0.029999999, 0.039999999, 0.050000001) * _GetSky(_dir));
float2 _ret = _Scene(_cameraPos, _dir, _fragCoord);
if ((_ret.x < 900.0))
{
float3 _p = (_cameraPos + (_ret.x * _dir));
float3 _nor = _GetNormal(_p, _ret.x);
float3 _spot = (_spotLight - _p);
float _atten = length(_spot);
(_spot /= _atten);
float _shaSpot = _Shadow(_p, _spot);
float _shaSun = _Shadow(_p, _sunDir);
float _bri = ((max(dot(_spot, _nor), 0.0) / pow(_atten, 1.5)) * 0.15000001);
float _briSun = (max(dot(_sunDir, _nor), 0.0) * 0.30000001);
(_col = _Colour(_p, _ret.x));
(_col = (((_col * _bri) * _shaSpot) + ((_col * _briSun) * _shaSun)));
float3 _ref = reflect(_dir, _nor);
(_col += (((pow(max(dot(_spot, _ref), 0.0), 10.0) * 2.0) * _shaSpot) * _bri));
(_col += (((pow(max(dot(_sunDir, _ref), 0.0), 10.0) * 2.0) * _shaSun) * _bri));
}
(_col = lerp(_sky, _col, min(exp(((-_ret.x) + 1.5)), 1.0)));
(_col += (vec3(pow(abs(_ret.y), 2.0)) * float3(0.02, 0.039999999, 0.1)));
(_col += _LightSource((_spotLight - _cameraPos), _dir, _ret.x));
(_col = _PostEffects(_col, _xy));
(_fragColor = vec4(_col, 1.0));
}
;
;






		
		//--------------------------------------------------
 
            struct v2f {
                float4 position : SV_POSITION;
                float3 worldSpacePosition : TEXCOORD0;
                float3 worldSpaceView : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
     
            v2f vert(appdata_full i) {				
                v2f o;
                o.position = UnityObjectToClipPos (i.vertex);            
                o.projPos = ComputeScreenPos (o.position);    
                float4 vertexWorld = mul(unity_ObjectToWorld, i.vertex);         
                o.worldSpacePosition = vertexWorld.xyz;
                o.worldSpaceView = vertexWorld.xyz - _WorldSpaceCameraPos;
                return o;
            }
 
            fixed4 frag(v2f i) : SV_Target 
			{				
				float4 CameraDistance =  mul(unity_WorldToObject, float4(_WorldSpaceCameraPos, 1.0));
				
				if (length(CameraDistance) > _DistanceThreshold)
				return fixed4(0., 0., 0., 0.);
			
			
			float3 ro = _WorldSpaceCameraPos - mul(unity_ObjectToWorld, float4(0.,0.,0.,1.)) + float3(0.,_HeightOffset,0.);
			float3 rd = normalize(i.worldSpaceView);
			//float3 _dir = rd;				
			//float3 _from = (float3(-1.0, 0.69999999, 0.0) + _move(_dir) + float3(-ro.x,0.2,-ro.z));
			
			float4 _color = {0.0, 0.0, 0.0, 1.0};
			
            float2 sceneUVs = (i.projPos.xy / i.projPos.w);//add

			_mainImage_float4(ro, rd, _color, sceneUVs);
					
			//float3 _color = _raymarch(_from, _dir);	

			
			float3 contrast = ((_color.rgb - 0.5f) * max(_Contrast, 0)) + 0.5f;         
			return float4(contrast.x, contrast.y, contrast.z, 1.0);			
            }
 
            ENDCG
        }
//PASSHERE
    }
}