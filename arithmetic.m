%Arithmetic encoding

clear;
prob = [0.2,0.4,0.8,1]; %Cumulative probability of each of the symbols - a,b,c,d.
val = [1,2,3,3,4];  %Word - "abccd". a:1 b:2 c:3 d:4.
prob = vpa(prob);
M = length(val);

low = vpa(0.0)
high = vpa(1.0)

%Printing each range.
for i=1:M
  disp("Next range");
  if val(i) == 1
     high = low + ((high - low)*prob(val(i)));
     disp(low);
     disp(high);
  elseif val(i) == 2
     h = low + ((high - low)*prob(val(i)));
     l = low + ((high - low)*prob(val(i)- 1));
     high = h;
     low = l;
     disp(low);
     disp(high);
  elseif val(i) == 3
     h = low + ((high - low)*prob(val(i)));
     l = low + ((high - low)*prob(val(i)-1));
     high = h;
     low = l;
     disp(low);
     disp(high);
  else
     l = low + ((high - low)*prob(val(i)-1));
     low = l;
     disp(low);
     disp(high);
  end
end

disp("Final range");
disp(low);
disp(high);


%Arithmetic decoding
n = vpa(0.0688);
low = vpa(0.0);
high = vpa(1.0);
ls = [];

%5 means number of symbols in the word to be decoded
for i=1:5
  disp("Next range");
  if n < low + ((high - low)*prob(1))
     high = low + ((high - low)*prob(1));
     disp(low);
     disp(high);
     ls(end+1) = 'a';
  elseif n < low + ((high - low)*prob(2))
     h = low + ((high - low)*prob(2));
     l = low + ((high - low)*prob(1));
     high = h;
     low = l;
     disp(low);
     disp(high);
     ls(end+1) = 'b';
  elseif n < low + ((high - low)*prob(3))
     h = low + ((high - low)*prob(3));
     l = low + ((high - low)*prob(2));
     high = h;
     low = l;
     disp(low);
     disp(high);
     ls(end+1) = 'c';
  else
     l = low + ((high - low)*prob(3));
     low = l;
     disp(low);
     disp(high);
     ls(end+1) = 'd';
     %break;
  end
end

disp("Decoded word");
word = char(ls);
disp(word);
