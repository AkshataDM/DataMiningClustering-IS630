data = read("pendigits.tra",1500,17);       //each row of this data matrix contains a vector
class_label = data(:,17);

p1 = data(16,:);
p2 = data(994,:);                     //choosing random prototype initially. 

p = [p1;p2];
count=0;
flag = 0;
while flag==0
c1=1;
c2=1;
count = count+1;
    for i = 1:1500
        for j = 1:2
           dif(j,1:16) = p(j,1:16) - data(i,1:16);
           sqr(j) = dif(j,1:16)*dif(j,1:16)';
           euclidean_distance(j,1:16) = sqrt(sqr(j));
    end
    [euc_dist,key] = gsort(euclidean_distance,"g","i");
    if(key(1) == 1) cluster1(c1,:) = data(i,:); c1=c1+1;
    elseif(key(1) == 2) cluster2(c2,:) = data(i,:); c2=c2+1;
    end
end
cluster_no_label1 = cluster1(:,1:16);
cluster_no_label2 = cluster2(:,1:16);
m1 = mean(cluster_no_label1,'r');
m2 = mean(cluster_no_label2,'r');

m = [m1;m2];

for i=1:2
    mean_sums(i) = sqrt(m(i,:)*m(i,:)');
    prototype_sums(i) = sqrt(p(i,:)*p(i,:)');
end

for i=1:2
    if(abs(mean_sums(i)-prototype_sums(i)) < 1)
        flag=1;
    else flag=0; p = m;
 end
end
end

//ENTROPY CALCULATION 



