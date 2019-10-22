    module write_fv3regional_restarts
!clt modified from write_fv3_restarts.f90

! ifort -I${NETCDF}/include -O2 -traceback write_fv3_restarts.f90 kinds.o
! netcdf_mod.o -L/${NETCDF}/lib -lnetcdf -lnetcdff

! read data from FV3 restart files.


    use kinds, only: i_kind,r_single,r_kind
    use netcdf, only: nf90_open,nf90_close,nf90_put_var,nf90_noerr
    use netcdf, only: nf90_inq_dimid,nf90_inq_varid
    use netcdf, only: nf90_nowrite,nf90_inquire,nf90_inquire_dimension
    use netcdf_mod, only: nc_check
    public write_fv3_restart_data1d,write_fv3_restart_data2d
    public write_fv3_restart_data3d,write_fv3_restart_data4d

    contains

    subroutine write_fv3_restart_data1d(varname,filename,file_id,data_arr)
       real(r_single), intent(inout), dimension(:) :: data_arr
       character(len=24),parameter :: myname_ = 'write_fv3_restart_data1d'
       include "write_fv3_restart_data.f90"
       data_arr=data_arr(ubound(data_arr,1):lbound(data_arr,1):-1)
    end subroutine write_fv3_restart_data1d

    subroutine write_fv3_restart_data2d(varname,filename,file_id,data_arr)
       real(r_single), intent(inout), dimension(:,:) :: data_arr
       character(len=24),parameter :: myname_ = 'write_fv3_restart_data2d'
       include "write_fv3_restart_data.f90"
       data_arr=data_arr(ubound(data_arr,1):lbound(data_arr,1):-1,ubound(data_arr,2):lbound(data_arr,2):-1)
    end subroutine write_fv3_restart_data2d

    subroutine write_fv3_restart_data3d(varname,filename,file_id,data_arr)
       real(r_single), intent(inout), dimension(:,:,:) :: data_arr
       character(len=24),parameter :: myname_ = 'write_fv3_restart_data3d'
       include "write_fv3_restart_data.f90"
       data_arr=data_arr(ubound(data_arr,1):lbound(data_arr,1):-1,ubound(data_arr,2):lbound(data_arr,2):-1, &
                          ubound(data_arr,3):lbound(data_arr,3):-1)
    end subroutine write_fv3_restart_data3d

    subroutine write_fv3_restart_data4d(varname,filename,file_id,data_arr)
       real(r_single), intent(inout), dimension(:,:,:,:) :: data_arr
       character(len=24),parameter :: myname_ = 'write_fv3_restart_data4d'
       include "write_fv3_restart_data.f90"
       data_arr=data_arr(ubound(data_arr,1):lbound(data_arr,1):-1,ubound(data_arr,2):lbound(data_arr,2):-1, &
                          ubound(data_arr,3):lbound(data_arr,3):-1,ubound(data_arr,4):lbound(data_arr,4):-1)
    end subroutine write_fv3_restart_data4d

    end module write_fv3regional_restarts