data = read("pendigits.tra",1500,17);       //each row of this data matrix contains a vector
class_label = data(:,17);

p1 = data(16,:);
p2 = data(994,:);                     //choosing random prototype initially. 
p3 = data(135,:);
p4 = data(550,:);
p5 = data(690,:);
p6 = data(560,:);
p7 = data(499,:);
p8 = data(380,:);
p9 = data(321,:);
p10 = data(489,:);

p = [p1;p2;p3;p4;p5;p6;p7;p8;p9;p10];

count=0;
flag = 0;
while flag==0

c1=0;
c2=0;
c3=0;
c4=0;
c5=0;
c6=0;
c7=0;
c8=0;
c9=0;
c10=0;
count = count+1;
    for i = 1:1500
        for j = 1:10
           dif(j,1:16) = abs(p(j,1:16) - data(i,1:16));
           sqr(j) = dif(j,1:16)*dif(j,1:16)';
           euclidean_distance(j) = sqrt(sqr(j));
    end
    
    [euc_dist,key] = gsort(euclidean_distance,"g","i");
    if(key(1) == 1) c1=c1+1; cluster1(c1,:) = data(i,:); 
    elseif(key(1) == 2) c2=c2+1; cluster2(c2,:) = data(i,:); 
    elseif(key(1) == 3) c3=c3+1; cluster3(c3,:) = data(i,:); 
    elseif(key(1) == 4) c4=c4+1; cluster4(c4,:) = data(i,:); 
    elseif(key(1) == 5) c5=c5+1; cluster5(c5,:) = data(i,:); 
    elseif(key(1) == 6) c6=c6+1; cluster6(c6,:) = data(i,:); 
    elseif(key(1) == 7) c7=c7+1; cluster7(c7,:) = data(i,:);
    elseif(key(1) == 8) c8=c8+1; cluster8(c8,:) = data(i,:); 
    elseif(key(1) == 9)  c9=c9+1; cluster9(c9,:) = data(i,:); 
        elseif(key(1) == 10)  c10=c10+1; cluster10(c10,:) = data(i,:); 
   end
end
index = 0; 

for j = 1:c1
    cluster_matrix(j,:) = cluster1(j,:);
end
 index = index+c1;
 
for j = 1:c2
    cluster_matrix(j+index,:) = cluster2(j,:);
end
 index = index+c2; 
 
for j = 1:c3
    cluster_matrix(j+index,:) = cluster3(j,:);
end
 index = index+c3;

for j = 1:c4
    cluster_matrix(j+index,:) = cluster4(j,:);
end
 index = index+c4;
 
for j = 1:c5
    cluster_matrix(j+index,:) = cluster5(j,:);
end
 index = index+c5;
 
for j = 1:c6
    cluster_matrix(j+index,:) = cluster6(j,:);
end
 index = index+c6;
 
for j = 1:c7
    cluster_matrix(j+index,:) = cluster7(j,:);
end
 index = index+c7;
 
for j = 1:c8
    cluster_matrix(j+index,:) = cluster8(j,:);
end
 index = index+c8; 
 
for j = 1:c9
    cluster_matrix(j+index,:) = cluster9(j,:);
end
 index = index+c9;
 
for j = 1:c10
    cluster_matrix(j+index,:) = cluster10(j,:);
end
 
cluster_no_label1 = cluster1(:,1:16);
cluster_no_label2 = cluster2(:,1:16);
cluster_no_label3 = cluster3(:,1:16);
cluster_no_label4 = cluster4(:,1:16);
cluster_no_label5 = cluster5(:,1:16);
cluster_no_label6 = cluster6(:,1:16);
cluster_no_label7 = cluster7(:,1:16);
cluster_no_label8 = cluster8(:,1:16);
cluster_no_label9 = cluster9(:,1:16);
cluster_no_label10 = cluster10(:,1:16);

m1 = mean(cluster_no_label1,'r');
m2 = mean(cluster_no_label2,'r');
m3 = mean(cluster_no_label3,'r');
m4 = mean(cluster_no_label4,'r');
m5 = mean(cluster_no_label5,'r');
m6 = mean(cluster_no_label6,'r');
m7 = mean(cluster_no_label7,'r');
m8 = mean(cluster_no_label8,'r');
m9 = mean(cluster_no_label9,'r');
m10 = mean(cluster_no_label10,'r');

m = [m1;m2;m3;m4;m5;m6;m7;m8;m9;m10];

for i=1:10
    mean_sums(i) = sqrt(m(i,:)*m(i,:)');
    prototype_sums(i) = sqrt(p(i,1:16)*p(i,1:16)');
end

for i=1:10
    if(abs(mean_sums(i)-prototype_sums(i)) < 1)
      flag = flag+1;
      else p = m; flag=0; 
 end
end
end

e=0;
//ENTROPY AND PURITY CALCULATION

cluster_no = 0;
function [e,max_p] = entropy_calc(cluster)

class0=0;
class1=0;
class2=0;
class3=0;
class4=0;
class5=0;
class6=0;
class7=0;
class8=0;
class9=0;

cluster_size = size(cluster,'r');                                  //find a scilab function that calculates mode 
c_l = cluster(:,17);
for i = 1:cluster_size
    if(c_l(i) == 0)  class0=class0+1;
    elseif(c_l(i) == 1) class1=class1+1;
    elseif(c_l(i) == 2) class2=class2+1;
    elseif(c_l(i) == 3) class3=class3+1;
    elseif(c_l(i) == 4) class4=class4+1;
    elseif(c_l(i) == 5) class5=class5+1;
    elseif(c_l(i) == 6) class6=class6+1;
    elseif(c_l(i) == 7) class7=class7+1;
    elseif(c_l(i) == 8) class8=class8+1;
    elseif(c_l(i) == 9) class9=class9+1;
end
end

class = [class0;class1;class2;class3;class4;class5;class6;class7;class8;class9];

for i=1:10
    p(i) = class(i)/cluster_size;
end

for i=1:10
    if(p(i) ~= 0) 
        e = e + p(i)*log(p(i));
end
 max_p = max(p);     //for purity
end

endfunction

[e1,max_p1] = entropy_calc(cluster1);
[e2,max_p2] = entropy_calc(cluster2);
[e3,max_p3] = entropy_calc(cluster3);
[e4,max_p4] = entropy_calc(cluster4);
[e5,max_p5] = entropy_calc(cluster5);
[e6,max_p6] = entropy_calc(cluster6);
[e7,max_p7] = entropy_calc(cluster7);
[e8,max_p8] = entropy_calc(cluster8);
[e9,max_p9] = entropy_calc(cluster9);
[e10,max_p10] = entropy_calc(cluster10);

s1 = size(cluster1,'r');
s2 = size(cluster2,'r');
s3 = size(cluster3,'r');
s4 = size(cluster4,'r');
s5 = size(cluster5,'r');
s6 = size(cluster6,'r');
s7 = size(cluster7,'r');
s8 = size(cluster8,'r');
s9 = size(cluster9,'r');
s10 = size(cluster10,'r');

s = [s1;s2;s3;s4;s5;s6;s7;s8;s9;s10];
e = [e1;e2;e3;e4;e5;e6;e7;e8;e9;e10];
max_p = [max_p1;max_p2;max_p3;max_p4;max_p5;max_p6;max_p7;max_p8;max_p9;max_p10];
final_entropy = 0;
final_purity = 0;
for i = 1:10
    final_entropy = final_entropy + s(i)*e(i)/1500; 
    final_purity = final_purity + s(i)*max_p(i)/1500;
end








