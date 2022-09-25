%% Sample code function for image edge enhancement using convolution
%% @author: orukundo@gmail.com - Olivier Rukundo

function output_image = edge_enhance(input_image,kernel_image) 
output_image = zeros(size(input_image));
flipped_kernel_image = rot90(kernel_image,2);                   
zp_input_image = padarray(input_image,[1 1]);
zp_input_image = double(zp_input_image);                         
[row, col] = size(zp_input_image); 
for i = 1:row-2
    for j = 1:col-2
        kernel_multiplication = zp_input_image(i:i+2,j:j+2).*flipped_kernel_image;
        output_image(i,j) = sum(kernel_multiplication(:));
    end
end
output_image = uint8(output_image);
end