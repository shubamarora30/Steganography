clear all
main=imread('main.jpg');
hide=imread('hide.jpg');
main=rgb2gray(main);
hide=rgb2gray(hide);
[r c d] = size(main);
hide = imresize(hide,[r,c]);
figure,imshow(main);
figure,imshow(hide);

main = double(main);
hide=double(hide);

for p=1:8
    bitmain(:,:,p) = mod(main,2);
    main = floor(main/2);
end

for p=1:8
    bithide(:,:,p) = mod(hide,2);
    hide = floor(hide/2);
end

bitmain(:,:,1)=bithide(:,:,6);
bitmain(:,:,2)=bithide(:,:,7);
bitmain(:,:,3)=bithide(:,:,8);


final=zeros(r,c,d);

   
for p=1:8
    final=final+(bitmain(:,:,p)*2^(p-1));
   
end

figure,imshow(uint8(final));

final=double(final);

for p=1:8
    bitfinal(:,:,p) = mod(final,2);
    final = floor(final/2);
end

newhide=zeros(r,c,d);
for p=1:3
  newhide=(bitfinal(:,:,p)*(2^(p+4)))+newhide;
end

   newmain=zeros(r,c,d);
for p=4:8
   newmain=(bitfinal(:,:,p)*(2^(p-1)))+newmain;
end
figure,imshow(uint8(newhide));
figure,imshow(uint8(newmain));
figure,imshow(uint8(newhide1));
