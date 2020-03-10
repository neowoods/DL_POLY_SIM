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
path = 'E:\DL_POLY_SIM-master\DL_POLY_SIM\XYZ_CONFIG_BANK\';
newfilename = strcat(path,filename,'_New');
fid = fopen(newfilename, 'w');
fprintf(fid, number_of_atom);
fprintf(fid, '\n');
fprintf(fid, comment_line);
fprintf(fid, '\n');
for ii = 1:size(xyz_new,1)
    fprintf(fid, 'Au\t');
    fprintf(fid, '%f\t',xyz_new(ii,:));
    fprintf(fid, '\n');
end
fclose(fid);

%% Write a new CONFIG file
path = 'E:\DL_POLY_SIM-master\DL_POLY_SIM\XYZ_CONFIG_BANK\CONFIG\';
newfilename1 = strcat(path,filename,'_CONFIG');
fid = fopen(newfilename1, 'w');
fprintf(fid, comment_line);
fprintf(fid, '\n');
fprintf(fid, '         0\t1\t');
fprintf(fid, number_of_atom);
fprintf(fid, '\n');
fprintf(fid, '         30\t0\t0\t\n');
fprintf(fid, '         0\t30\t0\t\n');
fprintf(fid, '         0\t0\t30\t\n');
for ii = 1:size(xyz_new,1)
    fprintf(fid, 'Au               ');
    fprintf(fid, num2str(ii));
    fprintf(fid, '\n');
    fprintf(fid, '  %f\t',xyz_new(ii,:));
    fprintf(fid, '\n');
end
fclose(fid);


%fid = fopen('myFile, 'w')  ;   % Open destination file.
%fwrite(fid, buffer) ;                         % Save to file.
%fclose(fid) ;

