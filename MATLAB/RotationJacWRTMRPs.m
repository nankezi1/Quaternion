%           George Terzakis, 2017
%
%         University of Portsmouth
%
%      Matlab Code based on the contents of:
%
% "Modified Rodrigues Parameters: An Efficient Reprepsentation of
% Orientation in 3D Vision and Graphics"
% G. Terzakis, M. Lourakis and D. Ait-Boudoud

% Returns the derivative of a rotation matrix WRT the i-th MRP
function [D1, D2, D3] = RotationJacWRTMRPs(s, v)
% s : The quaternion scalar part
% v : The quaternion vector part

v1 = v(1); v2 = v(2); v3 = v(3);

% [dR / dψ1]
D1(1, 1) = 2 * v1 * ( -v1*v1 + v2*v2 + v3*v3 + 1 - s*s );
D1(1, 2) = 2 * ( v2 * ( -2*v1*v1 + s + 1 ) + v1*v3 * ( 2*s + 1 ) );
D1(1, 3) = 2 * ( v3 * ( -2*v1*v1 + s + 1 ) - v1*v2 * ( 2*s + 1 ) );    
	
% Row #2
D1(2, 1) = 2 * ( v2 * ( -2*v1*v1 + s + 1 ) - v1*v3 * ( 2*s + 1 ) ); 
D1(2, 2) = 2 * v1 * ( -v2*v2 +v1*v1 + v3*v3 - (s + 1)*(s + 1) ); 
D1(2, 3) = 2 * ( -s * ( -2*v1*v1 + s + 1 ) + v1 * ( v1 - 2*v2*v3 ) );    
	
% Row #3
D1(3, 1) = 2 * ( v3 * ( -2*v1*v1 + s + 1) + v1*v2*(2*s + 1) );
D1(3, 2) = 2 * ( s * ( -2*v1*v1 + s + 1 ) - v1*(v1 + 2*v2*v3) );
D1(3, 3) = 2 * v1 * ( -v3*v3 + v1*v1 + v2*v2 -(1 + s)*(1 + s) );
	
% [dR / dψ2]

% Row #1
D2(1,1) = 2 * v2 * ( -v1*v1 + v2*v2 + v3*v3 - (1+s)*(1+s) );
D2(1, 2) = 2 * ( v1 * ( -2*v2*v2 + s + 1 ) + v2*v3*( 2*s + 1 ) );
D2(1, 3) = 2 * ( s * ( -2*v2*v2 + s + 1 ) - v2*( v2 + 2*v1*v3 ) );
	
% Row #2
D2(2, 1) = 2 * ( v1 * ( -2*v2*v2 + s + 1 ) - v2*v3*(2*s + 1) );
D2(2, 2) = 2 * v2 * ( -v2*v2 + v1*v1 + v3*v3 + 1 - s*s );
D2(2, 3) = 2 * ( v3 * ( -2*v2*v2 + s + 1 ) + v1*v2*(2*s + 1) );
	
% Row #3
D2(3, 1) = 2 * ( -s * ( -2*v2*v2 + s + 1 ) + v2*(v2 - 2*v1*v3) );
D2(3, 2) = 2 * ( v3 * ( -2*v2*v2 + s + 1 ) - v1*v2*(2*s + 1) );
D2(3, 3) = 2 * v2 * ( -v3*v3 + v1*v1 + v2*v2 - (s + 1)*(s + 1) );
	
	
% [dR / dψ3]    

% Row #1
D3(1, 1) = 2 * v3 * ( -v1*v1 + v2*v2 + v3*v3 - (1 + s)*(1 + s) );
D3(1, 2) = 2 * ( -s * ( -2*v3*v3 + s + 1 ) + v3 * (v3 - 2*v1*v2) );
D3(1, 3) = 2 * ( v1 * ( -2*v3*v3 + s + 1 ) - v2*v3*(2*s + 1) );

% Row #2
D3(2, 1) = 2 * ( s * ( -2*v3*v3 + s + 1 ) -v3*(v3 + 2*v1*v2) );
D3(2, 2) = 2 * v3 * ( -v2*v2 + v1*v1 + v3*v3 - (1 + s)*(1 + s) );
D3(2, 3) = 2 * ( v2 * ( -2*v3*v3 + s + 1 ) + v1*v3*(2*s + 1) );
	
% Row #3
D3(3, 1) = 2 * ( v1 * ( -2*v3*v3 + s + 1 ) + v2*v3*(2*s + 1) );
D3(3, 2) = 2 * ( v2 * ( -2*v3*v3 + s + 1 ) - v1*v3*(2*s + 1) );
D3(3, 3) = 2 * ( v3 * ( -v3*v3 + v1*v1 + v2*v2 + 1 - s*s ) );

% function dRdpi = RotationJacWRTMRPs(i, s, v)
% % i : index of MRP (0, 1, 2)
% % s: Quaternion scalar part
% % v: Quaternion vector part
% 
% % Get the derivatives of the Rotation matrix WRT quaternion scalar and
% % vcector
% dRds = RotationJacWRTQuatScalar(s, v);
% dRdv1 = RotationJacWRTQuatVector1(s, v);
% dRdv2 = RotationJacWRTQuatVector2(s, v);
% dRdv3 = RotationJacWRTQuatVector3(s, v);
% 
% % Get the quaternion Jacobian WRT MRPs
% dsdp = QuatScalarJacWRTMRPs(s, v);
% dvdp = QuatVectorJacWRTMRPs(s, v);
% 
% % The chain rule now...
% dRdpi = dRds * dsdp(i) + dRdv1 * dvdp(1, i) + dRdv2 * dvdp(2, i) + dRdv3 * dvdp(3, i);