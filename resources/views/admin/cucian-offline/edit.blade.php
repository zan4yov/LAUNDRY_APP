@extends('admin.layouts.app')
@section('content')

@if ($errors->any())
    <div class="w-50 mx-auto mt-3">
		<div class="alert alert-danger">
			 <ul>
				  @foreach ($errors->all() as $error)
						<li>{{ $error }}</li>
				  @endforeach
			 </ul>
		</div>
	 </div>
@endif

<form action="{{ route('admin.cucian-offline.edit.confirmation') }}" method="GET">
	<section class="content-main">
		<div class="row">
			 <div class="col-12">
				  <div class="content-header">
						<div>
							<h2 class="content-title">Edit Order Cucian Offline</h2>
							<p>No. Order : {{ $cucian->no_order }}</p>
						</div>
						<div>
							 <button class="btn btn-md rounded font-sm hover-up">Edit</button>
						</div>
				  </div>
			 </div>
			 <div class="col-lg-6">
				  <div class="card mb-4">
					  <input type="hidden" id="atas_nama" name="no_order" value="{{ $cucian->no_order }}"/>
						<div class="card-body">
							 <div class="mb-4">
								  <label for="product_title" class="form-label">Atas Nama</label>
								  <input type="text" placeholder="Masukkan Nama Pelanggan" class="form-control" id="atas_nama" name="atas_nama" value="{{ $cucian->atas_nama }}"/>
							 </div>
							 <div class="mb-4">
								  <label for="product_title" class="form-label">Alamat Antar</label>
								  <input type="text" placeholder="Masukkan Alamat Pengantaran" class="form-control" id="alamat_antar" name="alamat_antar" value="{{ $cucian->alamat_antar }}"/>
							 </div>
							 <div class="mb-4">
								  <label for="product_title" class="form-label">No. Telp</label>
								  <input type="text" placeholder="Masukkan No. Telp" class="form-control" id="no_telp" name="no_telp" value="{{ $cucian->no_telp }}" />
							 </div>
							 <div class="mb-4">
								  <label for="product_title" class="form-label">No. Wa</label>
								  <input type="text" placeholder="Masukkan No. Wa" class="form-control" id="no_wa" name="no_wa" value="{{ $cucian->no_wa }}" />
							 </div>
						</div>
				  </div>
			 </div>
			 <div class="col-lg-6">
				  <div class="card mb-4">
						<div class="card-body">
							<div class="mb-4">
								<label for="product_brand" class="form-label">Jenis Pengambilan</label>
								<select class="form-select" id="jenis_ambil" name="jenis_ambil">
									 <option {{ $cucian->jenis_ambil == 'ambil sendiri' ? 'selected' : '' }} value="ambil sendiri">Ambil Sendiri</option>
									 <option {{ $cucian->jenis_ambil == 'diantar' ? 'selected' : '' }} value="diantar">Diantar</option>
								</select>
						  </div>
							 <div class="mb-4">
								  <label class="form-label">Berat</label>
								  <input id="berat" name="berat" type="text" placeholder="Masukkan Berat Pakaian" class="form-control" value="{{ $cucian->berat }}"/>
							 </div>
							 <div class="mb-4">
								  <label class="form-label">Kategori</label>
								  <select class="form-select" name="kategori_id" id="kategori_id">
										@foreach ($kategori as $k)
										<option {{ $cucian->kategori_id == $k->id ? 'selected' : '' }} value="{{ $k->id }}">{{ $k->nama}}-----IDR {{ $k->harga}}</option>
										@endforeach
								  </select>
							 </div>
						</div>
				  </div>
				  <!-- card end// -->
			 </div>
		</div>
  </section>
</form>

<script>
</script>

@endsection
