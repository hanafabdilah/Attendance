@extends('layouts.app')

@section('title', 'Absensi Siswa | My Account')

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">My Account</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active">My Account</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<section class="content">
    <div class="container-fluid">
        <!-- Main row -->
        <div class="row">
            <!-- Left col -->
            <section class="col-lg-12">

                @if (session('status'))
                <div class="alert alert-success" role="alert">
                    {{ session('status') }}
                </div>
                @endif

                <!-- Attendance Chart -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-user mr-1"></i>
                                    My Account
                                </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <form action="/myaccount/update/{{ Auth::user()->id }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                        <tr>
                                            <th>Name</th>
                                            <td colspan="2"><input type="text" name="name" class="form-control" value="{{ Auth::user()->name }}"></td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td colspan="2"><input type="email" name="email" class="form-control" value="{{ Auth::user()->email }}"></td>
                                        </tr>
                                        <tr>
                                            <th>Photo</th>
                                            <td><input type="file" name="image" class="form-control-file" accept=".jpg, .jpeg, .png"></td>
                                            <td><img src="{{ asset('/storage/profile') }}/{{ Auth::user()->photo }}" style="width: 300px"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><input type="submit" class="btn btn-rounded btn-warning btn-block" value="Update"></td>
                                        </tr>
                                    </form>
                                </table>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-user mr-1"></i>
                                    Change Password
                                </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <form action="/myaccount/change_password/{{ Auth::user()->id }}" method="post">
                                    @csrf
                                        <tr>
                                            <th>Old Password</th>
                                            <td><input type="password" name="old_password" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>New Password</th>
                                            <td><input type="password" name="password" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>Confirm Password</th>
                                            <td><input type="password" name="confirm" class="form-control"></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><input type="submit" class="btn btn-rounded btn-warning btn-block" value="Update"></td>
                                        </tr>
                                    </form>
                                </table>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </section>
            <!-- /.Left col -->
        </div>
        <!-- /.row (main row) -->
    </div><!-- /.container-fluid -->
</section>

@endsection
