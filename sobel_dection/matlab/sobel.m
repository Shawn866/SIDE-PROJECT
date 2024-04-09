clc;                            %���������д���
clear all;                      %��������
image = imread('logo.png');     %ʹ��imread������ȡͼƬ����
figure;                         %����һ������
imshow(image);                  %������ʾͼƬ
R = image(:,:,1);               %��ȡͼƬ�еĺ�ɫ�����ɻҶ�ͼ��
figure;                         %����һ������
imshow(R);                      %������ʾ��ɫͼ��
[ROW,COL] = size(R);            %��ɫͼ���С����
data = zeros(1,ROW*COL);        %����һ����ֵΪ0������,�洢ת�����ͼƬ����
for r = 1:ROW
    for c = 1 : COL
        data((r-1)*COL+c) = bitshift(R(r,c),-5);    %��ɫ����������5λ
    end
end
fid = fopen('logo.txt','w+');                       %�򿪻��½�һ��txt�ļ�
for i = 1:ROW*COL;
    fprintf(fid,'%02x ',data(i));                   %д��ͼƬ����
end
fclose(fid);