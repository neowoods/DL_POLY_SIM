%% Read a xyz file
filename = 'AU_D60';
fid = fopen(filename, 'r') ;              % Open source file.
number_of_atom = fgetl(fid) ;             % Read/discard line.
comment_line = fgetl(fid) ;               % Read/discard line.
rawxyz = textscan(fid, '%s %f %f %f');
%%buffer = fread(fid, [str2num(number_of_atom),3]);                % Read rest of the file.
fclose(fid);

%% Process
xyz_old = rawxyz(:, 2:4);
xyz_mat = cell2mat(xyz_old);
xyz_new = xyz_mat - mean(xyz_mat, 'all');


%% Write a new xyz file
path = 'F:\DL_POLY_SIM\XYZ_CONFIG_BANK\';
newfilename = strcat(path,filename,'_New');
fileid = fopen(newfilename, 'w');
fprintf(fid, number_of_atom);
fprintf(fid, '\n');
fprintf(fid, comment_line,'\n');
fprintf(fid, '\n');
for ii = 1:size(xyz_new,1)
    fprintf(fileid, 'Au\t');
    fprintf(fileid, '%f\t',xyz_new(ii,:));
    fprintf(fileid, '\n');
end
fclose(fileid);



%fid = fopen('myFile_truncated.txt', 'w')  ;   % Open destination file.
%fwrite(fid, buffer) ;                         % Save to file.
%fclose(fid) ;

