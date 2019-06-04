//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/XsBXWt
//Fractal Land
//by Kali


Shader "Clawbird/FractalLand" {
    Properties {

			_DistanceThreshold ("_DistanceThreshold", float) = 1.8
			
			_TestColor ("test color", Color) = (0.8,0.9,0.6, 1.0)
			_Contrast ("Contrast", float) = 1.0
			
			_HeightOffset ("HeightOffset", float) = 0.0
			_MainTex("Albedo", 2D) = "white" {}
			
			
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
 
			uniform sampler2D _MainTex;
     
			float _DistanceThreshold;
			float _HeightOffset;
			float _SC;
			
			fixed4 _TestColor;
			
			float _Contrast;
			
			
			static const uint _iChannel0 = 0;
			static const uint _iChannel1 = 1;
     
            // Quality metric between 0 and 1 that is computed at the start of frag shader based on the angle
            // between the world look direction and the world ray for that pixel
            float fovQuality = 1.0;
     
            static const int NUM_STEPS = 5;
            static const float PI         = 3.1415;
            static const float EPSILON    = 1e-3;
            float EPSILON_NRM    = 0.01 / 1024;
 
            
            static const float2x2 octave_m = float2x2(1.6,1.2,-1.2,1.6);
 
            float fract(float x) {
                return x - floor(x);
            }
     
            float2 fract(float2 x) {
                return x - floor(x);
            }
     
            float hash( float2 p ) {
                float h = dot(p,float2(127.1,311.7));
                return fract(sin(h)*43758.5453123);
            }
     
            // TESTED
            float noise( in float2 p ) {
                float2 i = floor( p );
                float2 f = fract( p );
                float2 u = f*f*(3.0-2.0*f);
         
 
                //return fract(p).x;
         
                return -1.0+2.0*lerp( lerp( hash( i + float2(0.0,0.0) ),
                                 hash( i + float2(1.0,0.0) ), u.x),
                            lerp( hash( i + float2(0.0,1.0) ),
                                 hash( i + float2(1.0,1.0) ), u.x), u.y);
            }
			
			//-----------------------------------------------------------------
			//#define GL_USES_FRAG_COORD
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
			


			#define GL_USES_FRAG_COORD
			float webgl_mod_emu(float x, float y)
			{
				return x - y * floor(x / y);
			}



			float webgl_atan_emu(float y, float x)
			{
				if(x == 0 && y == 0) x = 1;
				return atan2(y, x);
			}

void _mainImage_float4(inout float4 _c, in float2 _f);
;
static float _det = {0.0};
float2x2 _rot(in float _a)
{
return mat2(cos(_a), sin(_a), (-sin(_a)), cos(_a));
;
}
;
float4 _formula_float4(in float4 _p)
{
(_p.xz = ((abs((_p.xz + 1.0)) - abs((_p.xz - 1.0))) - _p.xz));
(_p.y -= 0.25);
(_p.xy = mul(_p.xy, transpose(_rot(0.61086524))));
(_p = ((_p * 2.0) / clamp(dot(_p.xyz, _p.xyz), 0.2, 1.0)));
return _p;
;
}
;
float _de(in float3 _pos)
{
(_pos.y += (sin((_pos.z - ((_Time[1] * 0.5) * 6.0))) * 0.15000001));
float _hid = {0.0};
float3 _tpos = _pos;
(_tpos.z = abs((3.0 - webgl_mod_emu(_tpos.z, 6.0))));
float4 _p = vec4(_tpos, 1.0);
{ for(int _i = {0}; (_i < 4); (_i++))
{
(_p = _formula_float4(_p));
}
}
;
float _fr = ((length(max(float2(0.0, 0.0), (_p.yz - 1.5))) - 1.0) / _p.w);
float _ro = max((abs((_pos.x + 1.0)) - 0.30000001), (_pos.y - 0.34999999));
(_ro = max(_ro, (-max((abs((_pos.x + 1.0)) - 0.1), (_pos.y - 0.5)))));
(_pos.z = abs((0.25 - webgl_mod_emu(_pos.z, 0.5))));
(_ro = max(_ro, (-max((abs(_pos.z) - 0.2), (_pos.y - 0.30000001)))));
(_ro = max(_ro, (-max((abs(_pos.z) - 0.0099999998), ((-_pos.y) + 0.31999999)))));
float _d = min(_fr, _ro);
return _d;
;
}
;
float3 _path(in float _ti)
{
(_ti *= 1.5);
float3 _p = (vec3(sin(_ti), ((1.0 - sin((_ti * 2.0))) * 0.5), ((-_ti) * 5.0)) * 0.5);
return _p;
;
}
;
static float _edge = {0.0};
float3 _normal(in float3 _p)
{
float3 _e = vec3(0.0, (_det * 5.0), 0.0);
float _d1 = _de((_p - _e.yxx));
float _d2 = _de((_p + _e.yxx));
float _d3 = _de((_p - _e.xyx));
float _d4 = _de((_p + _e.xyx));
float _d5 = _de((_p - _e.xxy));
float _d6 = _de((_p + _e.xxy));
float _d = _de(_p);
(_edge = ((abs((_d - (0.5 * (_d2 + _d1)))) + abs((_d - (0.5 * (_d4 + _d3))))) + abs((_d - (0.5 * (_d6 + _d5))))));
(_edge = min(1.0, (pow(_edge, 0.55000001) * 15.0)));
return normalize(vec3((_d1 - _d2), (_d3 - _d4), (_d5 - _d6)));
;
}
;
float4 _rainbow(in float2 _p)
{
float _q = max(_p.x, -0.1);
float _s = (sin(((_p.x * 7.0) + ((_Time[1] * 0.5) * 70.0))) * 0.079999998);
(_p.y += _s);
(_p.y *= 1.1);
float4 _c = {0, 0, 0, 0};
if ((_p.x > 0.0))
{
(_c = float4(0.0, 0.0, 0.0, 0.0));
}
else
{
bool s1 = (0.0 < _p.y);
if (s1)
{
(s1 = (_p.y < 0.16666667));
}
if (s1)
{
(_c = float4(1.0, 0.16862746, 0.054901961, 1.0));
}
else
{
bool s2 = (0.16666667 < _p.y);
if (s2)
{
(s2 = (_p.y < 0.33333334));
}
if (s2)
{
(_c = float4(1.0, 0.65882355, 0.023529412, 1.0));
}
else
{
bool s3 = (0.33333334 < _p.y);
if (s3)
{
(s3 = (_p.y < 0.5));
}
if (s3)
{
(_c = float4(1.0, 0.95686275, 0.0, 1.0));
}
else
{
bool s4 = (0.5 < _p.y);
if (s4)
{
(s4 = (_p.y < 0.66666669));
}
if (s4)
{
(_c = float4(0.2, 0.91764706, 0.019607844, 1.0));
}
else
{
bool s5 = (0.66666669 < _p.y);
if (s5)
{
(s5 = (_p.y < 0.83333331));
}
if (s5)
{
(_c = float4(0.031372551, 0.63921571, 1.0, 1.0));
}
else
{
bool s6 = (0.83333331 < _p.y);
if (s6)
{
(s6 = (_p.y < 1.0));
}
if (s6)
{
(_c = float4(0.47843137, 0.33333334, 1.0, 1.0));
}
else
{
if (((abs(_p.y) - 0.050000001) < 9.9999997e-05))
{
(_c = float4(0.0, 0.0, 0.0, 1.0));
}
else
{
if (((abs((_p.y - 1.0)) - 0.050000001) < 9.9999997e-05))
{
(_c = float4(0.0, 0.0, 0.0, 1.0));
}
else
{
(_c = float4(0.0, 0.0, 0.0, 0.0));
}
}
}
}
}
}
}
}
}
(_c.w *= (0.80000001 - min(0.80000001, abs((_p.x * 0.079999998)))));
(_c.xyz = lerp(_c.xyz, vec3(length(_c.xyz)), 0.15000001));
return _c;
;
}
;

;
float3 _raymarch(in float3 _from, in float3 _dir)
{
(_edge = 0.0);
float3 _p = {0, 0, 0};
float3 _norm = {0, 0, 0};
float _d = {100.0};
float _totdist = {0.0};
{ for(int _i = {0}; (_i < 150); (_i++))
{
if (((_d > _det) && (_totdist < 25.0)))
{
(_p = (_from + (_totdist * _dir)));
(_d = _de(_p));
(_det = (0.001 * exp((0.13 * _totdist))));
(_totdist += _d);
}
}
}
;
float3 _col = {0.0, 0.0, 0.0};
(_p -= ((_det - _d) * _dir));
(_norm = _normal(_p));
(_col = ((1.0 - abs(_norm)) * max(0.0, (1.0 - (_edge * 0.80000001)))));
(_totdist = clamp(_totdist, 0.0, 26.0));
(_dir.y -= 0.02);
//float _sunsize = (7.0 - (max(0.0, gl_texture2D(_iChannel0, float2(0.60000002, 0.2)).x) * 5.0));
float _sunsize = 0.3;
float _an = (webgl_atan_emu(_dir.x, _dir.y) + (_Time[1] * 1.5));
float _s = pow(clamp(((1.0 - (length(_dir.xy) * _sunsize)) - abs((0.2 - webgl_mod_emu(_an, 0.40000001)))), 0.0, 1.0), 0.1);
float _sb = pow(clamp(((1.0 - (length(_dir.xy) * (_sunsize - 0.2))) - abs((0.2 - webgl_mod_emu(_an, 0.40000001)))), 0.0, 1.0), 0.1);
float _sg = pow(clamp(((1.0 - (length(_dir.xy) * (_sunsize - 4.5))) - (0.5 * abs((0.2 - webgl_mod_emu(_an, 0.40000001))))), 0.0, 1.0), 3.0);
float _y = (lerp(0.44999999, 1.2, pow(smoothstep(0.0, 1.0, (0.75 - _dir.y)), 2.0)) * (1.0 - (_sb * 0.5)));
float3 _backg = (float3(0.5, 0.0, 1.0) * ((((1.0 - _s) * (1.0 - _sg)) * _y) + ((((1.0 - _sb) * _sg) * float3(1.0, 0.80000001, 0.15000001)) * 3.0)));
(_backg += (float3(1.0, 0.89999998, 0.1) * _s));
(_backg = max(_backg, (_sg * float3(1.0, 0.89999998, 0.5))));
(_col = lerp(float3(1.0, 0.89999998, 0.30000001), _col, exp(((-0.0040000002 * _totdist) * _totdist))));
if ((_totdist > 25.0))
{
(_col = _backg);
}
(_col = (pow(_col, float3(1.4, 1.4, 1.4)) * 1.2));
(_col = lerp(vec3(length(_col)), _col, 0.64999998));
(_col *= float3(1.0, 0.89999998, 0.85000002));
(_dir.yx = mul(_dir.yx, transpose(_rot(_dir.x))));
float2 _ncatpos = (_dir.xy + vec2((-3.0 + webgl_mod_emu(((-_Time[1]) * 0.5), 6.0)), -0.27000001));
//float4 _ncat = _nyan((_ncatpos * 5.0));
float4 _rain = _rainbow(((_ncatpos * 10.0) + float2(0.80000001, 0.5)));
if ((_totdist > 8.0))
{
(_col = lerp(_col, max(float3(0.2, 0.2, 0.2), _rain.xyz), (_rain.w * 0.89999998)));
}
if ((_totdist > 8.0))
{
//(_col = lerp(_col, max(float3(0.2, 0.2, 0.2), _ncat.xyz), (_ncat.w * 0.89999998)));
}
return _col;
;
}
;
float3 _move(inout float3 _dir)
{
float3 _go = _path((_Time[1] * 0.5));
float3 _adv = _path(((_Time[1] * 0.5) + 0.69999999));
float _hd = _de(_adv);
float3 _advec = normalize((_adv - _go));
float _an = (_adv.x - _go.x);
(_an *= ((min(1.0, abs((_adv.z - _go.z))) * sign((_adv.z - _go.z))) * 0.69999999));
(_dir.xy = mul(_dir.xy, transpose(mat2(cos(_an), sin(_an), (-sin(_an)), cos(_an)))));
(_an = (_advec.y * 1.7));
(_dir.yz = mul(_dir.yz, transpose(mat2(cos(_an), sin(_an), (-sin(_an)), cos(_an)))));
(_an = webgl_atan_emu(_advec.x, _advec.z));
(_dir.xz = mul(_dir.xz, transpose(mat2(cos(_an), sin(_an), (-sin(_an)), cos(_an)))));
return _go;
;
}
;

;
;
//--------------------------------------------------
 
       
 
     
            struct v2f {
                float4 position : SV_POSITION;
                //float2 uv : TEXCOORD0; // stores uv
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

			float3 _dir = rd;
				
			float3 _from = (float3(-1.0, 0.69999999, 0.0) + _move(_dir) + float3(-ro.x,0.2,-ro.z));
				
			float3 _color = _raymarch(_from, _dir);
				
			float3 contrast = ((_color.rgb - 0.5f) * max(_Contrast, 0)) + 0.5f;
         
			return float4(contrast.x, contrast.y, contrast.z, 1.0);
			
			//return fixed4(1.,1.,1.,1.);
            }
 
            ENDCG
        }
    }
}