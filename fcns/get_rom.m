function img_out = get_rom(cell_in)


[s_r s_c] = size(cell_in);

cell_large = [cell(s_r,1) cell_in cell(s_r,1)];
cell_large = [cell(1,s_c+2*1) ; cell_large ; cell(1,s_c+2*1)];

img_out = zeros(s_r,s_c);

for i=(1+1):(s_r+1)    
    for j=(1+1):(s_c+1)
        
        dats = cell_large((i-1:i+1),(j-1:j+1));
        dats_vector = dats(:);        
        raw_time = cell2mat(dats_vector(~cellfun('isempty',dats_vector)));        
        filt_val = median(raw_time);
        if(isnan(filt_val))
            img_out(i-1,j-1) = 0;
        else
            img_out(i-1,j-1) = filt_val;
        end
        
    end
end



end

