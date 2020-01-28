clc;
clear all;

data = csvread("abaloneCorrected.csv");

count = 0;
count2 = 0;

D = data;
std_D = std(D); %std deviation
mean_D = mean(D);

f1 = D(:,1); %attributes/features 
f2 = D(:,2);
[count1 count2 Amatrix2] = MeanS(2, D, mean_D(:,2));
f3 = D(:,3);
[count1 count2 Amatrix3] = MeanS(3, D, mean_D(:,3));
f4 = D(:,4);
[count1 count2 Amatrix4] = MeanS(4, D, mean_D(:,4));
f5 = D(:,5);
[count1 count2 Amatrix5] = MeanS(5, D, mean_D(:,5));
f6 = D(:,6);
[count1 count2 Amatrix6] = MeanS(6, D, mean_D(:,6));
f7 = D(:,7);
[count1 count2 Amatrix7] = MeanS(7, D, mean_D(:,7));
f8 = D(:,8);
[count1 count2 Amatrix8] = MeanS(8, D, mean_D(:,8));
f9 = D(:,9);
[count1 count2 Amatrix9] = MeanS(9, D, mean_D(:,9));

onehotData = [f1';Amatrix2;Amatrix3;Amatrix4;Amatrix5;Amatrix6;Amatrix7;Amatrix8;Amatrix9]';


sizeofOneHD = size(onehotData,1)
%Parent
[Parent1 Parent2] = parent(2,onehotData) 
CoffParent = -(Parent1/sizeofOneHD* log2(Parent1/sizeofOneHD)) - (Parent2/sizeofOneHD * log2(Parent2/sizeofOneHD)) #getsvthe total entropy for perent

%length child
[hc1 hc2] = child1(2,onehotData)
lengthtchild1 = -(hc1/hc1+hc2  * log2(hc1/hc1+hc2)) - (hc2/hc1+hc2  * log2(hc2/hc1+hc2))

[hc3 hc4] = child2(2,onehotData)
lengthchild2 = -(hc3/hc3+hc4 * log2(hc3/hc3+hc4)) - (hc4/hc3+hc4 * log2(hc4/hc3+hc4))

avglengthEntropy = (1185/2835*lengthtchild1)+(1650/2835*lengthchild2)
InforGainHeight = CoffParent - avglengthEntropy

%Diameter Child
[dc1 dc2] = child1(3,onehotData)
Diameterchild1 = -(dc1/dc1+dc2 * log2(dc1/dc1+dc2)) - (dc2/dc1+dc2 * log2(dc2/dc1+dc2))

[dc3 dc4] = child2(3,onehotData)
Diameterchild2 = -(dc3/1630 * log2(dc3/1630)) - (dc4/1630 * log2(dc4/1630))

avgDiametertEntropy = (1207/2835*Diameterchild1)+(1630/2835*Diameterchild2)
InforGainHeight = CoffParent - avgDiametertEntropy

%Height Child
[wc1 wc2] = child1(4,onehotData)
Heightchild1 = -(wc1/1307* log2(wc1/1307)) - (wc2/1307 * log2(wc2/1307))

[wc3 wc4] = child2(4,onehotData)
Heightchild2 = -(wc3/1528* log2(wc3/1528)) - (wc4/1528 * log2(wc4/1528))

avgHeightEntropy = (1307/2835*Heightchild1)+(1528/2835*Heightchild2)
InforGainWeight = CoffParent - avgHeightEntropy

%W_weight Child
[Wwc1 Wwc2] = child1(5,onehotData)
W_weightChild1 = -(Wwc1/1458* log2(Wwc1/1458)) - (Wwc2/1458 * log2(Wwc2/1458))

[Wwc3 Wwc4] = child2(5,onehotData)
W_weightChild2 = -(Wwc3/1377* log2(Wwc3/1377)) - (Wwc4/1377 * log2(Wwc4/1377))

avgW_weightEntropy = (1458/2835 * W_weightChild1)+(1377/2835 * W_weightChild2)
InforGainShoe = CoffParent - avgW_weightEntropy

%S_weight Child
[Ssc1 Ssc2] = child1(6,onehotData)
S_weightChild1 = -(Ssc1/1469* log2(Ssc1/1469)) - (Ssc2/1469 * log2(Ssc2/1469))

[Ssc3 Ssc4] = child2(6,onehotData)
S_weightChild2 = -(Ssc3/1366* log2(Ssc3/1366)) - (Ssc4/1366 * log2(Ssc4/1366))

avgS_weightEntropy = (1469/2835*S_weightChild1)+(1366/2835*S_weightChild2)
InforGainShoe = CoffParent - avgS_weightEntropy

%V_weight Child
[Vsc1 Vsc2] = child1(7,onehotData)
V_weightChild1 = -(Vsc1/1496* log2(Vsc1/1496)) - (Vsc2/1496 * log2(Vsc2/1496))

[Vsc3 Vsc4] = child2(7,onehotData)
V_weightChild2 = -(Vsc3/1339* log2(Vsc3/1339)) - (Vsc4/1339 * log2(Vsc4/1339))

avgV_weightEntropy = (1496/2835*V_weightChild1)+(1339/2835*V_weightChild2)
InforGainShoe = CoffParent - avgV_weightEntropy

%Shell_weight Child
[Shellsc1 Shellsc2] = child1(8,onehotData)
Shell_weightChild1 = -(Shellsc1/1485* log2(Shellsc1/1485)) - (Shellsc2/1485 * log2(Shellsc2/1485))

[Shellsc3 Shellsc4] = child2(8,onehotData)
Shell_weightChild2 = -(Shellsc3/1350* log2(Shellsc3/1350)) - (Shellsc4/1350 * log2(Shellsc4/1350))

avgShell_weightEntropy = (1485/2835*Shell_weightChild1)+(1350/2835*Shell_weightChild2)
InforGainShoe = CoffParent - avgShell_weightEntropy

%Ring Child
[Rsc1 Rsc2] = child1(9,onehotData)
RingChild1 = -(Rsc1/1543* log2(Rsc1/1543)) - (Rsc2/1543* log2(Rsc2/1543))

[Rsc3 Rsc4] = child2(9,onehotData)
RingChild2 = -(Rsc3/1292* log2(Rsc3/1292)) - (Rsc4/1292 * log2(Rsc4/1292))

avgRingEntropy = (1543/2835*RingChild1)+(1292/2835*RingChild2)
InforGainShoe = CoffParent - avgRingEntropy














