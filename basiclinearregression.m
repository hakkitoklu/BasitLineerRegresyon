clc,clear all,close all

idata=importdata('data.csv');
data=idata.data;
sat=data(:,1);
gpa=data(:,2);

%toplam sat ve gpa değerleri
total_sat=sum(sat);
total_gpa=sum(gpa);
%xy , x^2 ve eleman sayısını tanımlıyoruz
satxgpa=0; sat2=0; n=length(sat);
%toplam xy ve x^2 hesaplanması
for i=1:n
    satxgpa=satxgpa+(sat(i)*gpa(i));
    sat2=sat2+(sat(i)^2);
end

%Eğim(m)değerinin hesaplanması
m=((n*satxgpa)-(total_sat*total_gpa))/((n*sat2)-(total_sat^2));

%Kesişim(b) değerinin hesaplanması
b=(total_gpa-(m*total_sat))/n;

%tahmini gpa ve hata değerlerinin hesaplanması
for i=1:n
    pregpa(i,1)=m*sat(i)+b;
    fail_pre(i,1)=pregpa(i)-gpa(i);
end

%plot gösterimi
scatter(sat,gpa)
hold on
xlabel('SAT')
ylabel('GPA')
title('SAT ve GPA ile Lineer Regresyon')
y=b+m*sat;
plot(sat,y)

result=[sat,gpa,pregpa,fail_pre]


