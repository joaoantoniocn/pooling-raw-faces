function xp = fea_pooling(x, rfSize, eigvector, Pyramid)
    
% x: an n-by-n image
% rfSize: the patch size
% eigvector: the pre-computed PCA projection matrix on training data
% Pyramid: e.g., Pyramid = [1 1; 2 2; 4 4; 6 6; 8 8; 10 10; 12 12; 15 15];

% xp: pooled feature
% a = imread('C:/Users/Belleaf/Documents/Machine Learning/lfw/Aaron_Eckhart');
% imshow(a)

	patches =  im2col(x, [rfSize rfSize])';

	prows = size(x, 1) - rfSize+1;
	pcols = size(x, 2) - rfSize+1;

	%contrast normalization
	patches = bsxfun(@rdivide, bsxfun(@minus, patches, mean(patches, 2)), ...
					  sqrt(var(patches, [], 2)+10));

	%applying PCA
   
	patches = patches * eigvector;
	%fliping
	patches = [ max(patches, 0), -min(patches, 0) ];

	%pooling
	patches = reshape(patches, prows, pcols, size(eigvector, 2)  * 2);
	xp = [];

	for lev = 1 : size(Pyramid, 1);
		nRow = Pyramid(lev, 1); 
		nCol = Pyramid(lev, 2);
		r_bin = round(prows/nRow); 
        c_bin = round(pcols/nCol);
		
		for i_row = 1 : nRow
			for i_col = 1 : nCol
				
				r_bound = i_row * r_bin; 
                c_bound = i_col * c_bin;
				
				if i_row == nRow, r_bound = prows; end
				if i_col == nCol, c_bound = pcols; end
				
				tem = max(max(patches(((i_row-1) * r_bin+1) : r_bound,...
										((i_col-1) * c_bin +1) : c_bound, :), [],1) , [], 2);
                                    
				xp = [xp, tem(:)'];						
			end
		end
end	
