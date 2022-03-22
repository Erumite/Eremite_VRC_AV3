// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Eremite/DroneCamViewer"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_MainTex("MainTex", 2D) = "white" {}
		_Float0("Float 0", Range( 0.001 , 1)) = 1
		_XOffset("XOffset", Range( -1 , 0)) = 0
		_YOffset("YOffset", Range( -1 , 0)) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+7549" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float4 screenPos;
			half ASEVFace : VFACE;
		};

		uniform sampler2D _MainTex;
		uniform float _XOffset;
		uniform float _Float0;
		uniform float _YOffset;
		uniform float _Cutoff = 0.5;


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 color48 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float2 appendResult17 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
			float2 break29 = ( appendResult17 / _Float0 );
			float4 appendResult32 = (float4(( _XOffset + break29.x ) , ( break29.y + _YOffset ) , 0.0 , 0.0));
			float4 switchResult47 = (((i.ASEVFace>0)?(color48):(tex2D( _MainTex, appendResult32.xy ))));
			o.Emission = switchResult47.rgb;
			o.Alpha = 1;
			float4 break38 = appendResult32;
			float switchResult49 = (((i.ASEVFace>0)?(1):(( step( break38.x , 1.0 ) * step( 0.0 , break38.x ) * step( 0.0 , break38.y ) * step( break38.y , 1.0 ) ))));
			clip( switchResult49 - _Cutoff );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
1920;0;1920;1029;634.6667;5.961853;1;True;False
Node;AmplifyShaderEditor.GrabScreenPosition;10;-1153.969,262.9138;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;17;-803.7791,291.4209;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-944.3945,385.2963;Inherit;False;Property;_Float0;Float 0;2;0;Create;True;0;0;0;False;0;False;1;0;0.001;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;33;-661.9268,300.0002;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-516.7791,383.4209;Inherit;False;Property;_YOffset;YOffset;4;0;Create;True;0;0;0;False;0;False;0;0;-1;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;29;-519.9268,292.0002;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;26;-520.7791,220.4209;Inherit;False;Property;_XOffset;XOffset;3;0;Create;True;0;0;0;False;0;False;0;0;-1;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-233.9268,232.0002;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;31;-236.9268,326.0002;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;32;-96.92676,252.0002;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;39;25.07324,391.0002;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;40;-328.9268,467.0002;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;38;-218.9268,496.0002;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.StepOpNode;43;-35.92676,744.0002;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;37;-37.92676,450.0002;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;42;-32.92676,648.0002;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;41;-38.92676,548.0002;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;151.0732,518.0002;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;9;73.4416,146.5362;Inherit;True;Property;_MainTex;MainTex;1;0;Create;True;0;0;0;False;0;False;-1;2c6536772776dd84f872779990273bfc;2c6536772776dd84f872779990273bfc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;48;118.3333,-41.96185;Inherit;False;Constant;_Color0;Color 0;5;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;50;242.3333,442.0381;Inherit;False;Constant;_Int0;Int 0;5;0;Create;True;0;0;0;False;0;False;1;0;False;0;1;INT;0
Node;AmplifyShaderEditor.ComputeScreenPosHlpNode;3;-899.2244,-383.6749;Inherit;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.UnityObjToClipPosHlpNode;2;-1086.224,-382.6749;Inherit;False;1;0;FLOAT3;0,0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;8;-697.2239,-283.6748;Inherit;False;False;False;False;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;4;-511.2238,-381.6749;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PosVertexDataNode;1;-1256.063,-381.9051;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwitchByFaceNode;47;373.3333,44.03815;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SwitchByFaceNode;49;401.3333,479.0381;Inherit;False;2;0;INT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;625.1,114.3;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;Eremite/DroneCamViewer;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Off;0;False;-1;7;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;False;7549;False;TransparentCutout;;AlphaTest;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;17;0;10;1
WireConnection;17;1;10;2
WireConnection;33;0;17;0
WireConnection;33;1;12;0
WireConnection;29;0;33;0
WireConnection;30;0;26;0
WireConnection;30;1;29;0
WireConnection;31;0;29;1
WireConnection;31;1;27;0
WireConnection;32;0;30;0
WireConnection;32;1;31;0
WireConnection;39;0;32;0
WireConnection;40;0;39;0
WireConnection;38;0;40;0
WireConnection;43;0;38;1
WireConnection;37;0;38;0
WireConnection;42;1;38;1
WireConnection;41;1;38;0
WireConnection;44;0;37;0
WireConnection;44;1;41;0
WireConnection;44;2;42;0
WireConnection;44;3;43;0
WireConnection;9;1;32;0
WireConnection;3;0;2;0
WireConnection;2;0;1;0
WireConnection;8;0;3;0
WireConnection;4;0;3;0
WireConnection;4;1;8;0
WireConnection;47;0;48;0
WireConnection;47;1;9;0
WireConnection;49;0;50;0
WireConnection;49;1;44;0
WireConnection;0;2;47;0
WireConnection;0;10;49;0
ASEEND*/
//CHKSM=770819EB3E2F3C18CDD37CB71476063EFEC4D467