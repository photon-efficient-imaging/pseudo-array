function Dsf = get_thres(Ts,Is,scale_image)

thres_val = 200;
[nr,nc] = size(Ts);
Dsf = zeros(nr,nc);
D_rom = Is;
for ii=1:1:nr
    for jj=1:1:nc
        data_vec = Ts{ii,jj};
        if( (D_rom(ii,jj) ~= 0) && ~isempty(data_vec) )
            censored_vec = data_vec(  abs(D_rom(ii,jj)-data_vec) < thres_val./(scale_image(ii,jj)+0.5));
        else
            censored_vec = 0;
        end        
        Dsf(ii,jj) = mean(censored_vec);
    end
end
disp('end');



end

