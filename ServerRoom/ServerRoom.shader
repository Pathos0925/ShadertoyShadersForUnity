//Translated by Clawbird (on discord at Pathos#0925)

//From Shadertoy.com
//https://www.shadertoy.com/view/MdySzc
//Server Room
//by zackpudil

Shader "Clawbird/ServerRoom" {
    Properties {

			_DistanceThreshold ("_DistanceThreshold", float) = 1.8
			
			_TestColor ("test color", Color) = (0.8,0.9,0.6, 1.0)
			_Contrast ("Contrast", float) = 1.0
			_Speed ("Speed", float) = 1.0
			_HeightOffset ("HeightOffset", float) = 0.
			_OffsetPosition ("OffsetPosition", float) = 0
			
			_MainTex("Albedo", 2D) = "white" {}
			
			
    }
    SubShader {
		Tags{ "Queue" = "Transparent" "RenderType" = "Transparent" }
	LOD 100

	//ZWrite Off
	//ZTest Always
	Blend SrcAlpha OneMinusSrcAlpha

        Pass {
            CGPROGRAM
     
            #include "UnityCG.cginc"
            #pragma vertex vert
            #pragma fragment frag
     
            #pragma target 3.0
 
			uniform sampler2D _MainTex;
     
           
			float _DistanceThreshold;
			
			fixed4 _TestColor;
			
			float _Contrast;
			float _Speed;
			float _HeightOffset;
			float _OffsetPosition;
			
			
			static const uint _iChannel0 = 0;
			static const uint _iChannel1 = 1;
     

            static const int NUM_STEPS = 5;
            static const float PI         = 3.1415;
            static const float EPSILON    = 1e-3;
            float EPSILON_NRM    = 0.01 / 1024;
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
 
           
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
			
//-------------Shadertoy variables
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
float vec1(int x0)
{
    return float(x0);
}
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
float3x3 mat3(float3 x0, float3 x1, float3 x2)
{
    return float3x3(x0, x1, x2);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
float4 vec4(float3 x0, int x1)
{
    return float4(x0, x1);
}

//-------------------------------------------end shadertoy variables

void _mainImage_float4(inout float4 _c, in float2 _f);
;
float _hash(in float _n)
{
return frac((sin(_n) * 43758.547));
;
}
;
float3 _hash(in float3 _p)
{
float _n = sin(dot(_p, float3(7.0, 157.0, 113.0)));
return frac((float3(2097152.0, 262144.0, 32768.0) * _n));
;
}
;
float _noise(in float _g)
{
float _p = floor(_g);
float _f = frac(_g);
return lerp(_hash(_p), _hash((_p + 1.0)), _f);
;
}
;
float _voronoi(in float3 _x)
{
float3 _p = floor(_x);
float3 _f = frac(_x);
float2 _res = {8.0, 8.0};
{ for(int _i = {-1}; (_i <= 1); (_i++))
{
{ for(int _j = {-1}; (_j <= 1); (_j++))
{
{ for(int _k = {-1}; (_k <= 1); (_k++))
{
float3 _g = vec3(vec1(_i), vec1(_j), vec1(_k));
float3 _r = ((_g + _hash((_p + _g))) - _f);
float _d = max(abs(_r.x), max(abs(_r.y), abs(_r.z)));
if ((_d < _res.x))
{
(_res.y = _res.x);
(_res.x = _d);
}
else
{
if ((_d < _res.y))
{
(_res.y = _d);
}
}
}
}
;
}
}
;
}
}
;
return (_res.y - _res.x);
;
}
;
float2 _path(in float _z)
{
return vec2(((cos((_z / 8.0)) * sin((_z / 12.0))) * 12.0), 0.0);
;
}
;
float _map(in float3 _p)
{
float4 _q = vec4(_p, 1.0);
(_q.x += 1.0);
{ for(int _i = {0}; (_i < 6); (_i++))
{
(_q.xyz = (-1.0 + (2.0 * frac((0.5 + (0.5 * _q.xyz))))));
(_q = ((1.2 * _q) / max(dot(_q.xyz, _q.xyz), 0.1)));
}
}
;
float2 _tun = (abs((_p.xy - _path(_p.z))) * float2(0.60000002, 0.5));
return min(((0.25 * abs(_q.y)) / _q.w), (1.0 - max(_tun.x, _tun.y)));
;
}
;
float _march(in float3 _ro, in float3 _rd, in float _mx)
{
float _t = {0.0};
{ for(int _i = {0}; (_i < 200); (_i++))
{
float _d = _map((_ro + (_rd * _t)));
if (((_d < 0.001) || (_t >= _mx)))
{
break;
;
}
(_t += (_d * 0.75));
}
}
;
return _t;
;
}
;
float3 _normal(in float3 _p)
{
float2 _h = {0.001, 0.0};
float3 _n = vec3((_map((_p + _h.xyy)) - _map((_p - _h.xyy))), (_map((_p + _h.yxy)) - _map((_p - _h.yxy))), (_map((_p + _h.yyx)) - _map((_p - _h.yyx))));
return normalize(_n);
;
}
;
float _ao(in float3 _p, in float3 _n)
{
float _o = {0.0};
float _s = {0.0049999999};
{ for(int _i = {0}; (_i < 15); (_i++))
{
float _d = _map((_p + (_n * _s)));
(_o += (_s - _d));
(_s += (_s / vec1((_i + 1))));
}
}
;
return (1.0 - clamp(_o, 0.0, 1.0));
;
}
;
float3 _material(in float3 _p)
{
float _v = {0.0};
float _a = {0.69999999};
float _f = {1.0};
{ for(int _i = {0}; (_i < 4); (_i++))
{
float _v1 = _voronoi(((_p * _f) + 5.0));
float _v2 = {0.0};
if ((_i > 0))
{
(_v2 = _voronoi(((((_p * _f) * 0.1) + 50.0) + (0.15000001 * _Time[1]))));
float _va = {0.0};
float _vb = {0.0};
(_va = (1.0 - smoothstep(0.0, 0.1, _v1)));
(_vb = (1.0 - smoothstep(0.0, 0.079999998, _v2)));
(_v += (_a * pow((_va * (0.5 + _vb)), 4.0)));
}
(_v1 = (1.0 - smoothstep(0.0, 0.30000001, _v1)));
(_v2 = (_a * _noise(((_v1 * 5.5) + 0.1))));
(_v += _v2);
(_f *= 3.0);
(_a *= 0.5);
}
}
;
return (vec3(pow(_v, 6.0), pow(_v, 4.0), pow(_v, 2.0)) * 2.0);
;
}
;
float3x3 _camera(in float3 _eye, in float3 _lat)
{
float3 _ww = normalize((_lat - _eye));
float3 _uu = normalize(cross(float3(0.0, 1.0, 0.0), _ww));
float3 _vv = normalize(cross(_ww, _uu));
return mat3(_uu, _vv, _ww);
;
}
;
void _mainImage_float4(inout float4 _fragColor, in float2 _fragCoord)
{
float2 _uv = (-1.0 + (2.0 * (1 / 1)));
(_uv.x *= (1 / 1));
float3 _col = {0.0, 0.0, 0.0};
float3 _ro = vec3((0.63 * cos((_Time[1] * 0.1))), 0.67000002, (_Time[1] * 0.5));
float3 _la = (_ro + float3(0.0, 0.0, 0.30000001));
(_ro.xy += _path(_ro.z));
(_la.xy += _path(_la.z));
float3 _rd = normalize(mul(transpose(_camera(_ro, _la)), vec3(_uv, 1.97)));
float _i = _march(_ro, _rd, 20.0);
if ((_i < 20.0))
{
float3 _pos = (_ro + (_rd * _i));
float3 _nor = _normal(_pos);
float3 _ref = normalize(reflect(_rd, _nor));
float _occ = _ao(_pos, _nor);
(_col = (_material(_pos) * _occ));
(_col += ((2.0 * pow(clamp(dot((-_rd), _ref), 0.0, 1.0), 16.0)) * _occ));
}
(_col = lerp(_col, float3(0.0, 0.0, 0.0), (1.0 - exp((-0.5 * _i)))));
(_col = (1.0 - exp((-0.5 * _col))));
(_col = pow(abs(_col), float3(0.45454544, 0.45454544, 0.45454544)));
(_fragColor = vec4(_col, 1));
}
;
;

;
;//----------------------------------------------------------------------------------------------------------------------------------------------
 
       
 
     
            struct v2f {
                float4 position : SV_POSITION;
                //float2 uv : TEXCOORD0; // stores uv
                float3 worldSpacePosition : TEXCOORD0;
                float3 worldSpaceView : TEXCOORD1;
            };
     
            v2f vert(appdata_full i) {
                //SEA_TIME = 0; // TODO: swap above
     
                v2f o;
                o.position = UnityObjectToClipPos (i.vertex);
         
                float4 vertexWorld = mul(unity_ObjectToWorld, i.vertex);
         
                o.worldSpacePosition = vertexWorld.xyz;
                o.worldSpaceView = vertexWorld.xyz - _WorldSpaceCameraPos;
                return o;
            }
 
            fixed4 frag(v2f i) : SV_Target {
				float3 CameraDistance =  mul(unity_WorldToObject, float4(_WorldSpaceCameraPos, 1.0));
				if (length(CameraDistance) > _DistanceThreshold)
				return fixed4(1.,1.,1.,0.);
		
			    //EPSILON_NRM    = 0.35 / _ScreenParams.x;
     
                float3 ro = _WorldSpaceCameraPos;
         
                float3 rd = normalize(i.worldSpaceView);				
				float3 ro2 = normalize(_WorldSpaceCameraPos);
				
				float3 test = mul(unity_WorldToObject, i.position);
				
				ro2 = _WorldSpaceCameraPos - mul(unity_ObjectToWorld, float4(0.,0.,0.,1.)) + float3(0.,_HeightOffset,0.);			
				
				
				
				//float3 _dir = normalize(vec3((_uv * _fov), 1.0));
				float3 _dir = rd;
				//--------------------------------------
				
				float3 _col = {0.0, 0.0, 0.0};
				float3 AdjSpeed = mul(_Time[1], _Speed);
				float3 _ro = vec3((0.63 * cos((AdjSpeed * 0.1))), 0.67000002, (AdjSpeed * 0.5));
				
				_ro = ro2 + _ro;
				
				
				float3 _la = (_ro + float3(0.0, 0.0, 0.30000001));
				(_ro.xy += _path(_ro.z));
				(_la.xy += _path(_la.z));
				//float3 _rd = normalize(mul(transpose(_camera(_ro, _la)), vec3(_uv, 1.97)));
				float3 _rd = rd;
				
				float _i = _march(_ro, _rd, 20.0);//-----------
				if ((_i < 200.0))
				{
				float3 _pos = (_ro + (_rd * _i));
				float3 _nor = _normal(_pos);
				float3 _ref = normalize(reflect(_rd, _nor));
				float _occ = _ao(_pos, _nor);
				(_col = (_material(_pos) * _occ));
				(_col += ((2.0 * pow(clamp(dot((-_rd), _ref), 0.0, 1.0), 16.0)) * _occ));
				}
				(_col = lerp(_col, float3(0.0, 0.0, 0.0), (1.0 - exp((-0.5 * _i)))));
				(_col = (1.0 - exp((-0.5 * _col))));
				(_col = pow(abs(_col), float3(0.45454544, 0.45454544, 0.45454544)));
				
				float4 _color = vec4(_col, 1);
				//--------------------------------------


				//float3 _color = _mainImage_float4(_color, 1.);
				
				float3 contrast = ((_color.rgb - 0.5f) * max(_Contrast, 0)) + 0.5f;
				//_color = lerp(float3(0.0, 0.0, 0.0), _color, pow(max(0.0, (0.94999999 - length((((_oriuv * _oriuv) * 1.) * float2(1.05, 1.1))))), 0.30000001));
					
                 
 
             
         
                return float4(contrast.x, contrast.y, contrast.z, 1.0);
 
            }
 
            ENDCG
        }
    }
}