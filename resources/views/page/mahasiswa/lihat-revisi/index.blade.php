@php
    $title ='Lihat Revisi';
@endphp
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  @include('template.head')
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  @include('template.navbar')
  <!-- /.navbar -->
  
  <!-- Main Sidebar Container -->
  @include('template.left-sidebar')
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Lihat Revisi</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">Dashboard</li>
                <li class="breadcrumb-item">Lihat Revisi</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- /.col-md-6 -->
          <div class="col-lg-12">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <div class="row">
                  <div class="col-sm-10">
                      <h4 class="m-0"> Lihat Revisi</h4>
                  </div>
                  <div class="col-sm-2">
                      {{-- <a href="{{route('status-judul/create')}}" class="btn btn-block btn-primary"><i class="fas fa-plus pr-2"></i>Tambah Data</a> --}}
                  </div>
                </div>
              </div>
              <div class="card-body">
                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <p>{{ session('success') }}</p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif
                <div class="table-responsive">
                    <table id="example1" class="table table-bordered table-striped" >
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>Judul Penelitian</th>
                            <th>Kuota</th>
                            <th>Dosen Pembimbing</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @php
                            $count = 1;
                        @endphp
                        @foreach ($data as $d)    
                            <tr>
                                <td>{{$count."."}}</td>
                                <td>{{ $d->judul}}</td>
                                <td>{{ $d->kuota}}</td>
                                <td>{{ $d->pbb1}}</td>
                                <td class="text-center">
                                  @if ($d->status == 'Pengajuan')
                                      <span class="badge badge-primary">Pengajuan</span> 
                                  @elseif ($d->status == 'Disetujui')
                                      <span class="badge badge-success">Disetujui</span> 
                                  @elseif ($d->status=='Revisi' && $d->status_revisi=='Belum')
                                      <a class="btn btn-block btn-outline-primary" href="{{url('status/revisi', auth()->user()->username)}}"><i class="fas fa-file"></i> Lihat Revisi</a>
                                  @elseif ($d->status=='Revisi' && $d->status_revisi=='Tinjau')
                                      <span class="badge badge-warning text-white">Peninjauan Revisi</span> 
                                  @elseif ($d->status == 'Selesai')
                                      <span class="badge badge-success">Selesai</span> 
                                  @endif
                                </td>
                            </tr>
                        @php
                            $count++;
                        @endphp
                        @endforeach
                        </tbody>
                        <tfoot>
                        <tr>
                          <th>No.</th>
                            <th>Judul Penelitian</th>
                            <th>Kuota</th>
                            <th>Dosen Pembimbing</th>
                            <th>Status</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
              </div>
            </div>
          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  @include('template.footer')
  <script>
   
    $(function () {
    });
  </script>
</body>
</html>
