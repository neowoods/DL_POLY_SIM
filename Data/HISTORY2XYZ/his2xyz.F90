!**********************************************************************
!  history file from DL_POLY_4 to xyz 
!
! © Daresbury Laboratory
! author: Alin M Elena <alin-marin.elena@stfc.ac.uk>
!
!**********************************************************************
program his2xyz
  use iso_fortran_env 
  implicit none
  character(len=100) :: line, title,dummy
  character(len=6) :: el
  integer :: stat
  integer :: i,j,timestep
  integer :: itrj,icon,natms,nframes,nrec
  real(kind=8) ::  x, y, z
  real(kind=8) :: vx,vy,vz
  real(kind=8) :: fx,fy,fz

  open(101,file="HISTORY",action="read")
  open(102,file="HIS.xyz",action="write",status="unknown")
  read(101,'(a100)') line
  title = line
  read(101,'(a100)') line
  read(line,*)itrj,icon,natms,nframes,nrec
  write(*,*)"frames: ",nFrames," atoms ", natms
  do i=1,nframes
    read(101,'(a100)') line
    read(line,*)dummy,timestep
    read(101,'(a100)') line
    read(101,'(a100)') line
    read(101,'(a100)') line
    write(102,*)natms
    write(102,*)"timestep ",timestep
    do j=1,natms
      read(101,'(a100)') line
      read(line,*) el
      read(101,'(a100)') line
      read(line,*) x,y,z 
      write(102,*) el,x,y,z
      if (itrj == 1) then
        read(101,'(a100)') line
        read(line,*) vx,vy,vz 
      endif
      if (itrj == 2) then
        read(101,'(a100)') line
        read(line,*) vx,vy,vz 
        read(101,'(a100)') line
        read(line,*) fx,fy,fz 
      endif
    enddo
  enddo
  close(101) 
  close(102) 
end program his2xyz
