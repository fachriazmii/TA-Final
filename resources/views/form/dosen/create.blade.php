@php
    $title ='Dosen';
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
            {{-- <h1 class="m-0">Tambah Data Dosen</h1> --}}
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item">Dashboard</li>
              <li class="breadcrumb-item">Dosen</li>
              <li class="breadcrumb-item active">Tambah Data</li>
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
                  <h4 class="m-0">Tambah Data Dosen</h4>
                <div class="col-sm-2">
                </div>
              </div>
              <div class="card-body">
                <form method="POST" action="{{ route('/dosen/store') }}">
                    {{ csrf_field() }}
                      <div class="form-group">
                        <label for="exampleInputEmail1">Nama Dosen</label>
                        <input name="nama_dosen" type="text" class="form-control" id="exampleInputEmail1" placeholder="Nama lengkap dosen dengan gelar" required>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Nomor Handphone</label>
                        <input name="no_hp" type="number" class="form-control" id="exampleInputEmail1" placeholder="Masukan nomor handphone" required>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Alamat email" required>
                      </div>
                    <div class="float-right">
                      <button type="submit" class="btn btn-primary"><i class="fas fa-save pr-2" aria-hidden="true"></i>Simpan</button>
                    </div>
                  </form>
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
  </script>
</body>
</html>
