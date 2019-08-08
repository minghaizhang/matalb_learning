%GD
%INPUT
clear all;clc;
[attrib1,attrib2,attrib3,attrib4,class]=textread('C:\Users\zhang\Desktop\iris.data','%f%f%f%f%s','delimiter',',');
attrib=[attrib1,attrib2,attrib3,attrib4];%N*4

% a=zeros(length(class),1);%N*1
% a(strcmp(class,'Iris-setosa'))=1;
% a(strcmp(class,'Iris-versicolor'))=2;
% a(strcmp(class,'Iris-virginica'))=3;
y_xunlian=ones(80,1);y_xunlian(41:80)=-1;attrib_xunlian=ones(80,4);
attrib_xunlian(1:40,:)=attrib(1:40,:);attrib_xunlian(41:80,:)=attrib(51:90,:);%训练集
y_yuce=ones(20,1);y_yuce(11:20)=-1;attrib_yuce=zeros(20,4);
attrib_yuce(1:10,:)=attrib(41:50,:);attrib_yuce(11:20,:)=attrib(91:100,:);
attrib_xunlian=[attrib_xunlian';ones(1,80)];%5*80
attrib_yuce=[attrib_yuce';ones(1,20)];%5*20
[N1,N2]=size(attrib_xunlian);
w=zeros(5,1);
lamda=0.5;T=100000;

for t=1:T
    nn=floor(rand(1)*N2)+1;  %用向下取整
    u=1/lamda/t;
    if (y_xunlian(nn)*(w'*attrib_xunlian(:,nn))<1)
        w=(1-u*lamda)*w+u*y_xunlian(nn)*attrib_xunlian(:,nn);
    else
        w=(1-u*lamda)*w;
    end
end
h1=w'*[attrib(1:100,:),ones(100,1)]';
figure;plot(h1);
