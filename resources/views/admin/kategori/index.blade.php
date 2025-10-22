@extends('admin.layouts.app')
@section('content')
    
<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Kategori</h2>
            <p>Data Kategori Laundry</p>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <form action="{{ route('admin.kategori.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-4">
                            <label for="product_name" class="form-label">Nama</label>
                            <input type="text" name="nama" placeholder="Masukkan Nama Kategori" class="form-control" id="product_name" value="{{ old('nama')}}" />
                            @error('nama')
                            <p class="text-danger">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label for="product_slug" class="form-label">Harga/Kg</label>
                            <input type="text" name="harga" placeholder="Masukkan Harga/Kg" class="form-control" id="product_slug" value="{{ old('nama')}}" />
                            @error('harga')
                            <p class="text-danger">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label for="product_estimation" class="form-label">Estimasi</label>
                            <input type="text" name="estimasi_hari" placeholder="Masukkan Estimasi" class="form-control" id="product_estimation" value="{{ old('nama')}}" />
                            @error('estimasi_hari')
                            <p class="text-danger">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Buat Kategori</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-9">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nama</th>
                                    <th>Harga/Kg</th>
                                    <th>Estimasi</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($kategori as $k)
                                <tr>
                                    <td>{{$k->id}}</td>
                                    <td><b>{{$k->nama}}</b></td>
                                    <td>{{$k->harga}}</td>
                                    <td>{{$k->estimasi_hari}} Hari</td>
                                    <td class="text-end">
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" class="btn btn-light rounded btn-sm font-sm"> <i class="material-icons md-more_horiz"></i> </a>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item text-warning" href="{{ route('admin.kategori.edit', $k->id) }}">Edit</a>
												<a data-confirm="Kategori" onclick="hapus(this, event)" class="dropdown-item text-danger" href="{{ route('admin.kategori.hapus', $k->id) }}">Hapus</a>
                                            </div>
                                        </div>
                                        <!-- dropdown //end -->
                                    </td>
                                    @endforeach
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- .col// -->
            </div>
            <!-- .row // -->
        </div>
        <!-- card body .// -->
    </div>
    <!-- card .// -->
</section>
@endsection