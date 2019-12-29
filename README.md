# Estimation
It is a very interesting project to learn the estimation concepts.
Y=a1x1+a2x2+···anxn,error=E((Y−ˆY)2) 
As we need to minimize the error with respect to the coefficients and find them.  
we differentiate with respect toaiwherei∈(1,n) and equating to zero. if we need ai then the differentiation with respect to ai is done as follows.
d/(dai)(error) =E(2(Y−ˆY×(xi)) ,
similarly we get the equations as follows,
E(x1.Y) =E(a1(x1)^2+a2x2.x1+···anxn.x1) , 
⇒Ro=R.A ,
⇒A=R−1Ro.
Where Ro is a cross correlation matrix between input and output,R is an auto correlation between inputs.
