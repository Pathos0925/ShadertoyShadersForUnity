//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/Mtl3R2
//kalizulmodul
//by bergi

Shader "Clawbird/kalizmodul" {
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
float _Tanh(in float _x)
{
return clamp(((_x * (27.0 + (_x * _x))) / (27.0 + ((9.0 * _x) * _x))), -1.0, 1.0);
;
}
;
float3 _kali_sky(in float3 _pos, in float3 _dir)
{
float _time = _Time.y;
float4 _col = {0.0, 0.0, 0.0, 1.0};
float _t = {0.0};
float _pln = {0};
{ for(int _k = {0}; (_k < 50); (++_k))
{
float4 _p = vec4((_pos + (_t * _dir)), 1.0);
float3 _param = lerp(vec3((1.2 + ((0.40000001 * sin(((_time / 6.1300001) - 0.40000001))) * min(1.0, ((_time - 70.0) / 10.0)))), 0.5, (0.090000004 + (0.079999998 * sin((_time / 4.0))))), vec3(0.50999999, 0.5, (1.0 + (0.5 * sin((_Time.y / 40.0))))), (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))));
float _d = {10.0};
(_pln = 16.0);
float3 _av = {0.0, 0.0, 0.0};
{ for(int _i = {0}; (_i < 11); (++_i))
{
(_p = (abs(_p) / dot(_p.xyz, _p.xyz)));
(_d = min(_d, (lerp(((_p.x + _p.y) + _p.z), length(_p.xy), (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0))))) / _p.w)));
if ((_i == 1))
{
(_pln = min(_pln, (dot(_p.xyz, float3(0.0, 0.0, 1.0)) / _p.w)));
}
(_av += (_p.xyz / (4.0 + _p.w)));
(_p.xyz -= (_param - (((100.0 * _col.x) * (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0))))) * (1.0 - (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0))))))));
}
}
;
(_d += ((0.029999999 * (1.0 - (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))))) * smoothstep(0.1, 0.0, _t)));
if ((_d <= 0.0))
{
break;
;
}
(_col.w = min(_col.w, _d));
{ for(int _i = {0}; (_i < 5); (++_i))
{
(_p = (abs(_p) / dot(_p.xyz, _p.xyz)));
(_av += (_p.xyz / (4.0 + _p.w)));
(_p.xyz -= (float3(0.82999998, 0.82999998, 0.82999998) - (0.1 * _p.xyz)));
}
}
;
(_col.xyz += max((_av / 9000.0), (_p.xyz / 8200.0)));
(_t += min(0.1, lerp((_d * _d), _d, (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))))));
}
}
;
return lerp((((_col.xyz / _col.w) * (2.0999999 - (2.0 * (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0))))))) / (1.0 + (0.2 * _t))), (((0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))) - ((0.00030000001 * length(_pos)) / _col.www)) - (((1.0 - ((0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))) * 0.40000001)) * float3(0.60000002, 0.40000001, 0.1)) / (1.0 + _pln))), (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))));
;
}
;
float2 _rotate(in float2 _v, in float _r)
{
float _s = sin(_r);
float _c = cos(_r);
return vec2(((_v.x * _c) - (_v.y * _s)), ((_v.x * _s) + (_v.y * _c)));
;
}
;
void _mainImage_float4(float3 ro, float3 rd, inout float4 _fragColor, in float2 _fragCoord)
{
float2 _uv = (((_fragCoord.xy - (1. * 0.5)) / 1.) * 2.0);
float3 _dir = normalize(vec3(_uv, ((0.89999998 + (0.2 * (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))))) - (0.40000001 * length(_uv)))));
_dir = rd;
float _t = (_Time.y / 2.0);
float3 _pos = vec3(((1.0 - ((0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))) * 0.5)) * sin((_t / 2.0))), ((0.30000001 - (0.2 * (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))))) * cos((_t / 2.0))), ((0.30000001 + (2.0 * (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))))) * (-1.5 + sin((_t / 4.1300001)))));
(_pos.xy /= ((1.001 - (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0))))) + (0.2 * (-_pos.z))));
_pos += ro * 0.2;
(_dir.yz = _rotate(_dir.yz, ((-1.4 + (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0))))) + ((1.0 - (0.60000002 * (0.5 + (0.5 * _Tanh((sin(((_Time.y / 17.122999) + 1.2)) * 4.0)))))) * (-0.5 + (0.5 * sin((((_t / 4.1300001) + 2.0) + (1.0 * sin((_t / 1.75)))))))))));
(_dir.xy = _rotate(_dir.xy, (sin((_t / 2.0)) + (0.2 * sin((_t + sin((_t / 3.0))))))));
(_fragColor = vec4(_kali_sky(_pos, _dir), 1.0));
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
			
				if (_SC != 0.9197)
					return fixed4(1.,1.,1.,0.);
			
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