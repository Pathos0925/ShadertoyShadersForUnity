//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/4lSXR3
//Hot Rocks
//by dr2

Shader "Clawbird/HotRocks" {
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
	//ZTest Always
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
float2 vec2(float x0)
{
    return float2(x0, x0);
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
float3x3 mat3(float x0, float x1, float x2, float x3, float x4, float x5, float x6, float x7, float x8)
{
    return float3x3(x0, x1, x2, x3, x4, x5, x6, x7, x8);
}
float4 vec4(float x0, float x1, float x2, float x3)
{
    return float4(x0, x1, x2, x3);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Uniforms

uniform float3 _iResolution : register(c0);
//uniform float _Time.y : register(c1);
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
};

#define GL_USES_FRAG_COORD
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
float4 _Hashv4f(in float _p)
{
return frac((sin((_p + float4(0.0, 1.0, 57.0, 58.0))) * 43758.539));
;
}
;
float _Noisefv2(in float2 _p)
{
float2 _ip = floor(_p);
float2 _fp = frac(_p);
(_fp = ((_fp * _fp) * (3.0 - (2.0 * _fp))));
float4 _t = _Hashv4f(dot(_ip, float2(1.0, 57.0)));
return lerp(lerp(_t.x, _t.y, _fp.x), lerp(_t.z, _t.w, _fp.x), _fp.y);
;
}
;
float _Fbmn(in float3 _p, in float3 _n)
{
float3 _s = {0, 0, 0};
float _a = {0};
(_s = float3(0.0, 0.0, 0.0));
(_a = 1.0);
{ for(int _i = {0}; (_i < 5); (_i++))
{
(_s += (_a * vec3(_Noisefv2(_p.yz), _Noisefv2(_p.zx), _Noisefv2(_p.xy))));
(_a *= 0.5);
(_p *= 2.0);
}
}
;
return dot(_s, abs(_n));
;
}
;
float3 _VaryNf(in float3 _p, in float3 _n, in float _f)
{
float3 _g = {0, 0, 0};
float _s = {0};
float3 _e = {0.1, 0.0, 0.0};
(_s = _Fbmn(_p, _n));
(_g = vec3((_Fbmn((_p + _e.xyy), _n) - _s), (_Fbmn((_p + _e.yxy), _n) - _s), (_Fbmn((_p + _e.yyx), _n) - _s)));
return normalize((_n + (_f * (_g - (_n * dot(_n, _g))))));
;
}
;
float3 _HsvToRgb(in float3 _c)
{
float3 _p = abs(((frac((_c.xxx + float3(1.0, 0.66666669, 0.33333334))) * 6.0) - 3.0));
return (_c.z * lerp(float3(1.0, 1.0, 1.0), clamp((_p - 1.0), 0.0, 1.0), _c.y));
;
}
;
float2 _Rot2D(in float2 _q, in float _a)
{
return (((_q * cos(_a)) * float2(1.0, 1.0)) + ((_q.yx * sin(_a)) * float2(-1.0, 1.0)));
;
}
;
static float3x3 _flMat = {0, 0, 0, 0, 0, 0, 0, 0, 0};
static float3 _flPos = {0, 0, 0};
static float3 _ltPos = {0, 0, 0};
static float3 _ltAx = {0, 0, 0};
static float _tCur = {0};
static float _dstFar = {200.0};
float3 _TrackPath(in float _t)
{
return vec3(((((10.0 * sin((0.1 * _t))) * sin((0.059999999 * _t))) * cos((0.033 * _t))) + (3.0 * cos((0.025 * _t)))), 6.0, _t);
;
}
;
float _GrndDf(in float3 _p)
{
float2 _q = {0, 0};
float2 _t = {0, 0};
float2 _ta = {0, 0};
float2 _v = {0, 0};
float _wAmp = {0};
float _pRough = {0};
float _ht = {0};
(_wAmp = 1.0);
(_pRough = 0.5);
(_q = (0.40000001 * _p.xz));
(_ht = 0.0);
{ for(int _j = {0}; (_j < 3); (_j++))
{
(_t = ((_q + (2.0 * _Noisefv2(_q))) - 1.0));
(_ta = abs(sin(_t)));
(_v = ((1.0 - _ta) * (_ta + abs(cos(_t)))));
(_v = pow((1.0 - _v), vec2(_pRough)));
(_ht += ((_v.x + _v.y) * _wAmp));
(_q = mul(_q, transpose(float2x2(2.4000001, -1.8000001, 1.8000001, 2.4000001))));
(_wAmp *= 0.25);
(_pRough = ((0.60000002 * _pRough) + 0.2));
}
}
;
return (_p.y - _ht);
;
}
;
float _GrndRay(in float3 _ro, in float3 _rd)
{
float3 _p = {0, 0, 0};
float _dHit = {0};
float _h = {0};
float _s = {0};
float _sLo = {0};
float _sHi = {0};
(_s = 0.0);
(_sLo = 0.0);
(_dHit = _dstFar);
{ for(int _j = {0}; (_j < 100); (_j++))
{
(_p = (_ro + (_s * _rd)));
(_h = _GrndDf(_p));
if ((_h < 0.0))
{
break;
;
}
(_sLo = _s);
(_s += ((0.80000001 * _h) + (0.0049999999 * _s)));
if ((_s > _dstFar))
{
break;
;
}
}
}
;
if ((_h < 0.0))
{
(_sHi = _s);
{ for(int _j = {0}; (_j < 8); (_j++))
{
(_s = (0.5 * (_sLo + _sHi)));
(_p = (_ro + (_s * _rd)));
(_h = step(0.0, _GrndDf(_p)));
(_sLo += (_h * (_s - _sLo)));
(_sHi += ((1.0 - _h) * (_s - _sHi)));
}
}
;
(_dHit = _sHi);
}
return _dHit;
;
}
;
float3 _GrndNf(in float3 _p)
{
float4 _v = {0, 0, 0, 0};
(_v = vec4(_GrndDf((_p + float3(9.9999997e-05, 9.9999997e-05, 9.9999997e-05))), _GrndDf((_p + float3(9.9999997e-05, -9.9999997e-05, -9.9999997e-05))), _GrndDf((_p + float3(-9.9999997e-05, 9.9999997e-05, -9.9999997e-05))), _GrndDf((_p + float3(-9.9999997e-05, -9.9999997e-05, 9.9999997e-05)))));
return normalize((vec3((((_v.x - _v.y) - _v.z) - _v.w)) + (2.0 * _v.yzw)));
;
}
;
float _GrndGlow(in float3 _ro, in float3 _rd)
{
float _gl = {0};
float _f = {0};
float _d = {0};
(_gl = 0.0);
(_f = 1.0);
(_d = 0.0);
{ for(int _j = {0}; (_j < 5); (_j++))
{
(_d += 0.40000001);
(_gl += (_f * max((_d - _GrndDf((_ro + (_rd * _d)))), 0.0)));
(_f *= 0.5);
}
}
;
return clamp(_gl, 0.0, 1.0);
;
}
;
float3 _ShowScene(in float3 _ro, in float3 _rd)
{
float3 _vn = {0, 0, 0};
float3 _ltDir = {0, 0, 0};
float _dstGrnd = {0};
float _di = {0};
float _atten = {0};
float _glw = {0};
float _dk = {0};
(_dstGrnd = _GrndRay(_ro, _rd));
float3 _bgCol = {0.0, 0.0, 0.029999999};
float3 _col = _bgCol;
if ((_dstGrnd < _dstFar))
{
(_ro += (_rd * _dstGrnd));
(_ltDir = (_ro - _ltPos));
(_di = (1.0 / max(length(_ltDir), 0.0099999998)));
(_ltDir *= _di);
(_atten = ((30.0 * pow(min(_di, 1.0), 1.3)) * pow(max(dot(_ltAx, _ltDir), 0.0), 64.0)));
(_vn = _GrndNf(_ro));
(_vn = _VaryNf((5.0 * _ro), _vn, max(2.0, (6.0 - (0.30000001 * _dstGrnd)))));
(_glw = _GrndGlow(_ro, _vn));
(_col += (((1.0 - _glw) * _atten) * ((min((0.5 * _Fbmn((31.0 * _ro), _vn)), 1.0) * (0.1 + (0.5 * max(dot(_vn, (-_ltDir)), 0.0)))) + pow(max(dot(reflect((-_ltDir), _vn), _rd), 0.0), 64.0))));
(_col = lerp(_col, (2.0 * _HsvToRgb(clamp(vec3(((0.059999999 * _glw) * _glw), 1.0, (5.0 * _glw)), 0.0, 1.0))), ((1.2 * _glw) * _glw)));
(_dk = clamp((2.0 * ((_dstGrnd / _dstFar) - 0.1)), 0.0, 1.0));
(_col = lerp(_col, _bgCol, (_dk * _dk)));
}
return clamp(_col, 0.0, 1.0);
;
}
;
void _FlyerPM(in float _t)
{
float3 _fpF = {0, 0, 0};
float3 _fpB = {0, 0, 0};
float3 _vel = {0, 0, 0};
float3 _acc = {0, 0, 0};
float3 _va = {0, 0, 0};
float3 _ort = {0, 0, 0};
float3 _cr = {0, 0, 0};
float3 _sr = {0, 0, 0};
float _dt = {0};
(_dt = 0.2);
(_flPos = _TrackPath(_t));
(_fpF = _TrackPath((_t + _dt)));
(_fpB = _TrackPath((_t - _dt)));
(_vel = ((_fpF - _fpB) / (2.0 * _dt)));
(_vel.y = 0.0);
(_acc = (((_fpF - (2.0 * _flPos)) + _fpB) / (_dt * _dt)));
(_acc.y = 0.0);
(_va = (cross(_acc, _vel) / length(_vel)));
(_ort = vec3(0.2, (webgl_atan_emu(_vel.z, _vel.x) - 1.5707951), (length(_va) * sign(_va.y))));
(_cr = cos(_ort));
(_sr = sin(_ort));
(_flMat = transpose(mul(transpose(transpose(mul(transpose(mat3(_cr.z, (-_sr.z), 0.0, _sr.z, _cr.z, 0.0, 0.0, 0.0, 1.0)), transpose(mat3(1.0, 0.0, 0.0, 0.0, _cr.x, (-_sr.x), 0.0, _sr.x, _cr.x))))), transpose(mat3(_cr.y, 0.0, (-_sr.y), 0.0, 1.0, 0.0, _sr.y, 0.0, _cr.y)))));
}
;
void _mainImage_float4(float3 ro, float3 rd, inout float4 _fragColor, in float2 _fragCoord)
{
float2 _canvas = 1.;
float2 _uv = (((2.0 * _fragCoord.xy) / _canvas) - 1.0);
(_uv.x *= (_canvas.x / _canvas.y));
(_tCur = _Time.y *0.1);
float3 _rd = {0, 0, 0};
float3 _ro = {0, 0, 0};
_FlyerPM(_tCur);
(_ro = _flPos);
(_rd = mul(normalize(vec3(_uv, 3.0)), transpose(_flMat)));
_ro += ro;
_rd = rd;
(_ltPos = _flPos);
(_ltPos.y += 1.0);
(_ltAx = float3(0.0, 0.0, 1.0));
(_ltAx.yz = _Rot2D(_ltAx.yz, (0.30000001 + (0.30000001 * sin(_tCur)))));
(_ltAx = mul(_ltAx, transpose(_flMat)));
(_fragColor = vec4(_ShowScene(_ro, _rd), 1.0));
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
				return fixed4(1.,1.,1.,0.);
			
			
			//float3 ro = _WorldSpaceCameraPos - mul(unity_ObjectToWorld, float4(0.,0.,0.,1.)) + float3(0.,_HeightOffset,0.);
			float3 ro = _WorldSpaceCameraPos + float3(0.,_HeightOffset,0.);
			
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