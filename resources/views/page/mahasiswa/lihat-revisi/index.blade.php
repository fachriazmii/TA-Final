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
                          <th>NIM - Mahasiswa</th>
                          <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @php
                            $count = 1;
                        @endphp
                        @foreach ($data_belum_setuju as $d)    
                            <tr>
                                <td>{{$count."."}}</td>
                                {{-- <td><a href="{{url('/input-judul/edit', $d->id)}}">{{ $d->judul}}</a></td> --}}
                                <td>{{ $d->judul}}</a></td>
                                <td>{{ $d->nim." - ".$d->nama}}</td>
                                <td class="text-center">
                                  <button type="button" class="btn btn-block btn-outline-primary" onclick="terimajudul({{$d->id_judul}},{{$d->nim}})">
                                    <i class="fas fa-check-square"></i> Terima
                                  </button>
                                  <button type="button" class="btn btn-block btn-outline-danger" onclick="tolakjudul({{$d->nim}})">
                                    <i class="fas fa-check-square"></i> Tidak
                                  </button>
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
                          <th>NIM - Mahasiswa</th>
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
      $("#example1").DataTable({
            "buttons": ["csv", "excel", "pdf", "print"],
            "dom":
                "<'row'<'col-sm-4'l><'col-sm-6'B><'col-sm-2'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-10'i><'col-sm-2'p>>",
        });
      $("#example2").DataTable({
            "buttons": ["csv", "excel", "pdf", "print"],
            "dom":
                "<'row'<'col-sm-4'l><'col-sm-6'B><'col-sm-2'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-10'i><'col-sm-2'p>>",
        });
    });
  </script>
</body>
</html>
