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
c1=1;
c2=1;
c3=1;
c4=1;
c5=1;
c6=1;
c7=1;
c8=1;
c9=1;
c10=1;
count = count+1;
    for i = 1:1500
        for j = 1:10
           dif(j,1:16) = p(j,1:16) - data(i,1:16);
           sqr(j) = dif(j,1:16)*dif(j,1:16)';
           euclidean_distance(j) = sqrt(sqr(j));
    end
    [euc_dist,key] = gsort(euclidean_distance,"g","i");
    if(key(1) == 1) cluster1(c1,:) = data(i,:); c1=c1+1;
    elseif(key(1) == 2) cluster2(c2,:) = data(i,:); c2=c2+1;
    elseif(key(1) == 3) cluster3(c3,:) = data(i,:); c3=c3+1;
    elseif(key(1) == 4) cluster4(c4,:) = data(i,:); c4=c4+1;
    elseif(key(1) == 5) cluster5(c5,:) = data(i,:); c5=c5+1;
    elseif(key(1) == 6) cluster6(c6,:) = data(i,:); c6=c6+1;
    elseif(key(1) == 7) cluster7(c7,:) = data(i,:); c7=c7+1;
    elseif(key(1) == 8) cluster8(c8,:) = data(i,:); c8=c8+1;
    elseif(key(1) == 9) cluster9(c9,:) = data(i,:); c9=c9+1;
        elseif(key(1) == 10) cluster10(c10,:) = data(i,:); c10=c10+1;
        
    end
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
        flag=1;
    else flag=0; p = m;
 end
end
end

//ENTROPY CALCULATION 

class1=0;
class2=0;
class3=0;
class4=0;
class5=0;
class6=0;
class7=0;
class8=0;
class9=0;
class10=0;

cluster1_size = size(cluster1,'r');                                  //find a scilab function that calculates mode 
c_l = cluster1(:,17);
for i = 1:cluster1_size
    if(c_l(i) == 0)  class1=class1+1;
    elseif(c_l(i) == 1) class2=class2+1;
    elseif(c_l(i) == 2) class3=class3+1;
    elseif(c_l(i) == 3) class4=class4+1;
    elseif(c_l(i) == 4) class5=class5+1;
    elseif(c_l(i) == 5) class6=class6+1;
    elseif(c_l(i) == 6) class7=class7+1;
    elseif(c_l(i) == 7) class8=class8+1;
    elseif(c_l(i) == 8) class9=class9+1;
    elseif(c_l(i) == 9) class10=class10+1;
end
end

class = [class1;class2;class3;class4;class5;class6;class7;class8;class9;class10];
[c,k] = gsort(class);
size_c = c(1);

p1 = size_c/cluster_size;


