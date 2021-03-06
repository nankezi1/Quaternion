%           George Terzakis, 2017
%
%         University of Portsmouth
%
%      Matlab Code based on the contents of:
%
% "Modified Rodrigues Parameters: An Efficient Reprepsentation of
% Orientation in 3D Vision and Graphics"
% G. Terzakis, M. Lourakis and D. Ait-Boudaoud

% derivative of a rotation matrix wrt v2 
function dRdv2 = RotationJacWRTQuatVector2(s, v)
% INPUT
% s: The quaternion scalar part
% v: the quaternion vector part

v1=v(1); v2 = v(2); v3 = v(3);

dRdv2 = 2*[-v2 v1 s; ...
           v1 v2 v3; ... 
           -s v3 -v2];