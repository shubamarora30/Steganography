clear all
main=imread('ironman.jpg');
hide=imread('spiderman.jpg');
[r c d] = size(main);
hide = imresize(hide,[r,c]);
figure,imshow(main);
figure,imshow(hide);

main = double(main);
hide=double(hide);
final=zeros(r,c,d);
for a=1:d
    
    for p=1:8
        bitmain(:,:,p) = mod(main(:,:,a),2);
        main(:,:,a) = floor(main(:,:,a)/2);
    end

    for p=1:8
        bithide(:,:,p) = mod(hide(:,:,a),2);
        hide(:,:,a) = floor(hide(:,:,a)/2);
    end

    bitmain(:,:,1)=bithide(:,:,5);
    bitmain(:,:,2)=bithide(:,:,6);
    bitmain(:,:,3)=bithide(:,:,7);
    bitmain(:,:,4)=bithide(:,:,8);

     for p=1:8
        final(:,:,a)=final(:,:,a)+(bitmain(:,:,p)*2^(p-1));

     end
    
end
figure,imshow(uint8(final));
final=double(final);
newhide=zeros(r,c,d);
newmain=zeros(r,c,d);
for a=1:d

    for p=1:8
        bitfinal(:,:,p) = mod(final(:,:,a),2);
        final(:,:,a) = floor(final(:,:,a)/2);
    end

    
    for p=1:4
      newhide(:,:,a)=(bitfinal(:,:,p)*(2^(p+4)))+newhide(:,:,a);
    end

      
    for p=5:8
       newmain(:,:,a)=(bitfinal(:,:,p)*(2^(p-1)))+newmain(:,:,a);
    end
end
figure,imshow(uint8(newmain));
figure,imshow(uint8(newhide));