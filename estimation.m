ds=dataset('xlsfile','ds.xlsx');
ds1= dataset('xlsfile','ds1.xlsx');
((ds.viii)'*(ds.area))/400
% CORRELATION MATRIX
% COMBINATION 1: ALL FEATURES INCLUDED
Ro=[1060.022893;1403.445813;7201.83105;	97.7765075;	235.961675;437.07255;44.41123;11.5913];
% AUTOCORRELATION MATRIX
R=[((ds.i)'*(ds.i))/400 ((ds.i)'*(ds.ii))/400 ((ds.i)'*(ds.iii))/400 ((ds.i)'*(ds.iv))/400 ((ds.i)'*(ds.v))/400 ((ds.i)'*(ds.vi))/400 ((ds.i)'*(ds.vii))/400 ((ds.i)'*(ds.viii))/400;
   ((ds.ii)'*(ds.i))/400 ((ds.ii)'*(ds.ii))/400 ((ds.ii)'*(ds.iii))/400 ((ds.ii)'*(ds.iv))/400 ((ds.ii)'*(ds.v))/400 ((ds.ii)'*(ds.vi))/400 ((ds.ii)'*(ds.vii))/400 ((ds.ii)'*(ds.viii))/400;
   ((ds.iii)'*(ds.i))/400 ((ds.iii)'*(ds.ii))/400 ((ds.iii)'*(ds.iii))/400 ((ds.iii)'*(ds.iv))/400 ((ds.iii)'*(ds.v))/400 ((ds.iii)'*(ds.vi))/400 ((ds.iii)'*(ds.vii))/400 ((ds.iii)'*(ds.viii))/400;
   ((ds.iv)'*(ds.i))/400 ((ds.iv)'*(ds.ii))/400 ((ds.iv)'*(ds.iii))/400 ((ds.iv)'*(ds.iv))/400 ((ds.iv)'*(ds.v))/400 ((ds.iv)'*(ds.vi))/400 ((ds.iv)'*(ds.vii))/400 ((ds.iv)'*(ds.viii))/400;
   ((ds.v)'*(ds.i))/400 ((ds.v)'*(ds.ii))/400 ((ds.v)'*(ds.iii))/400 ((ds.v)'*(ds.iv))/400 ((ds.v)'*(ds.v))/400 ((ds.v)'*(ds.vi))/400 ((ds.v)'*(ds.vii))/400 ((ds.v)'*(ds.viii))/400;
   ((ds.vi)'*(ds.i))/400 ((ds.vi)'*(ds.ii))/400 ((ds.vi)'*(ds.iii))/400 ((ds.vi)'*(ds.iv))/400 ((ds.vi)'*(ds.v))/400 ((ds.vi)'*(ds.vi))/400 ((ds.vi)'*(ds.vii))/400 ((ds.vi)'*(ds.viii))/400;
   ((ds.vii)'*(ds.i))/400 ((ds.vii)'*(ds.ii))/400 ((ds.vii)'*(ds.iii))/400 ((ds.vii)'*(ds.iv))/400 ((ds.vii)'*(ds.v))/400 ((ds.vii)'*(ds.vi))/400 ((ds.vii)'*(ds.vii))/400 ((ds.vii)'*(ds.viii))/400;
   ((ds.viii)'*(ds.i))/400 ((ds.viii)'*(ds.ii))/400 ((ds.viii)'*(ds.iii))/400 ((ds.viii)'*(ds.iv))/400 ((ds.viii)'*(ds.v))/400 ((ds.viii)'*(ds.vi))/400 ((ds.viii)'*(ds.vii))/400 ((ds.viii)'*(ds.viii))/400 ;]

%INVERSE OF AUTO CORRELATION MATRIX (7x7)
B= pinv(R)%7x7
A=B*Ro %7x1
%EXPECTATION OF AREA COVERED IN FIRE
S=double(ds1(:,5:12))*A
%ERROR
E=S-double(ds(1:117,13))
%COMBINATION 2: feature RH and wind
% CORRELATION MATRIX
Ro1=[437.07255;44.41123];
% AUTOCORRELATION MATRIX
R1=[((ds.vi)'*(ds.vi))/400 ((ds.vi)'*(ds.vii))/400 ;
    ((ds.vii)'*(ds.vi))/400 ((ds.vii)'*(ds.vii))/400 ;
    ]
% INVERSE OF AUTOCORRELATION
B1= pinv(R1)%7x7
A1=B1*Ro1 %3x1
%EXPECTED AREA COVERED IN FOREST FIRE
S1=double(ds1(:,10:11))*A1
E1=S1-double(ds(1:117,13))

% COMBINATION 3: feature DC and RH
% CORRELATION MATRIX
Ro2= [7201.83105;437.07255;11.5913]
%AUTO CORRELATION MATRIX
R2=[((ds.iii)'*(ds.iii))/400 ((ds.iii)'*(ds.vi))/400 ((ds.iii)'*(ds.viii))/400;
    ((ds.vi)'*(ds.iii))/400 ((ds.vi)'*(ds.vi))/400 ((ds.vi)'*(ds.viii))/400;
    ((ds.viii)'*(ds.iii))/400 ((ds.viii)'*(ds.vi))/400 ((ds.viii)'*(ds.viii))/400;]
%INVERSE OF AUTO CORRELATION MATRIX
B2= pinv(R2)%7x7
A2=B2*Ro2 %2x1
% EXPECTED VALUE OF AREA COVERED IN FOREST FIRE
S2=double (ds1(:,[7 10 12]))*A2
%ERROR FROM TRUE VALUE
E2=S2-double(ds(1:117,13))
(E(:,1)'*E(:,1))/117
(E1(:,1)'*E1(:,1))/117
(E2(:,1)'*E2(:,1))/117

%COMBINATION 4: DMC and RH
%CORRELATION MATRIX
Ro3= [1403.445813;437.07255;11.5913]
%AUTOCORRELATION MATRIX
R3=[((ds.ii)'*(ds.ii))/400 ((ds.ii)'*(ds.vi))/400 ((ds.ii)'*(ds.viii))/400;
    ((ds.vi)'*(ds.ii))/400 ((ds.vi)'*(ds.vi))/400 ((ds.vi)'*(ds.viii))/400;
    ((ds.viii)'*(ds.ii))/400 ((ds.viii)'*(ds.vi))/400 ((ds.viii)'*(ds.viii))/400;]
%INVERSE OF AUTOCORRELATION MATRIX
B3= pinv(R3)%7x7
A3=B3*Ro3 %2x1
%EXPECTED VALUE AREA SPREAD BY FOREST FIRE
S3=double (ds1(:,[6 10 12]))*A2
E3=S3-double(ds(1:117,13))


% CONDITION 5: temp and RH
%CORRELATION MATRIX
Ro4=[235.961675;437.07255;11.5913];
%AUTOCORRELATION MATRIX
R4=[((ds.v)'*(ds.v))/400 ((ds.v)'*(ds.vi))/400 ((ds.v)'*(ds.viii))/400;
    ((ds.vi)'*(ds.v))/400 ((ds.vi)'*(ds.vi))/400 ((ds.vi)'*(ds.viii))/400;
    ((ds.viii)'*(ds.v))/400 ((ds.viii)'*(ds.vi))/400 ((ds.viii)'*(ds.viii))/400;]
%INVERSE OF AUTOCORRELATION MATRIX
B4= pinv(R4)%7x7
A4=B4*Ro4 %3x1
%EXPECTED VALUE OF AREA COVERED BY FOREST FIRE
S4=double(ds1(:,[9 10 12]))*A4
%ERROR
E4=S4-double(ds(1:117,13))

%MEAN SQUARE ERRORS
a=(E(:,1)'*E(:,1))/117
b=(E1(:,1)'*E1(:,1))/117
c=(E2(:,1)'*E2(:,1))/117
d=(E3(:,1)'*E3(:,1))/117
e=(E4(:,1)'*E4(:,1))/117
x=[1,2,3,4,5]
y=[c,b,e,d,a]

%DISCRETE PLOT
stem(x,y)






