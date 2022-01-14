%Yichen Lu 400247938 luy191
%The magnetic field around an indefinitely long wire is uniformly distributed. 
%Because we're utilising the image approach in this experiment, this should be the same. 
%The flux lines must be projected onto a plane that is orthogonal to the current in this lab. 
%I defined the current in this example to be in the Z direction, and only an intersection at Z=0 is examined,
%therefore Z values aren't used in this section. In the handwritten section, I went over the Z coordinates in further detail.

clc;
clear;
miu0 = 4*pi*10e-7;
lowerbound = -2;
upperbound = 2;
x_steplength = 0.2;
y_steplength = 0.2;
Xsteps = (upperbound-lowerbound)/x_steplength+1;
Ysteps = (upperbound-lowerbound)/y_steplength+1;
x = lowerbound:x_steplength:upperbound;
y = lowerbound:y_steplength:upperbound;
[X,Y] = meshgrid(x,y);
I = 1;
p_wire = [0,1,0];
p_image = [0,-1,0]; 
I_real = [0 0 I];
I_image = [0 0 -I];
Bx=zeros(Xsteps,Ysteps); %initialize the x component values
By=zeros(Xsteps,Ysteps); %initialize the y component values
for i = 1:Xsteps
    for j=1:Ysteps
        x_plot=X(i,j); %import the B data in x component
        y_plot=Y(i,j); %import the B data in y component
        p = [x_plot y_plot 0];
        r1 = p-p_wire;
        r2 = p-p_image;
        r1_norm = norm(r1);
        r2_norm = norm(r2);
        r1_hat = r1/r1_norm;
        r2_hat = r2/r2_norm;
        B = (miu0/(2*pi*r1_norm*r1_norm))*cross(I_real,r1_hat)+(miu0/(2*pi*r2_norm*r2_norm))*cross(I_image,r2_hat);
        Bx(i,j)=Bx(i,j)+B(1,1); %increment the x component at the current observation point
        By(i,j)=By(i,j)+B(1,2); %increment the y component at the current observation point
    end
end
hold on
streamslice(X,Y,Bx,By);
title("Magnetic Flux Lines On Orthogonal Intersection --- By Yichen Lu");
xlabel("x axis");
ylabel("y axis");
plot(0,1,'ro',0,1,'r.');
plot(0,-1,'ro',0,-1,'r+');
hold off