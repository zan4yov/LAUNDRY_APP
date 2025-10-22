@extends('admin.layouts.app')
@section('content')

<form action="{{ route('admin.cucian-online.edit.confirmation') }}" method="GET">
	<section class="content-main">
		<div class="row">
			 <div class="col-12">
				  <div class="content-header">
						<div>
							<h2 class="content-title">Edit Order Cucian Online</h2>
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
								  @error('atas_nama')
									<p class="text-danger">{{ $message }}</p>
								  @enderror
							 </div>
							 <div class="mb-4">
								  <label for="product_title" class="form-label">Alamat Antar</label>
								  <input type="text" placeholder="Masukkan Alamat Pengantaran" class="form-control" id="alamat_antar" name="alamat_antar" value="{{ $cucian->alamat_antar }}"/>
								  @error('alamat_antar')
									<p class="text-danger">{{ $message }}</p>
								  @enderror
							 </div>
							 <div class="mb-4">
								  <label for="product_title" class="form-label">No. Telp</label>
								  <input type="text" placeholder="Masukkan No. Telp" class="form-control" id="no_telp" name="no_telp" value="{{ $cucian->no_telp }}" />
								  @error('no_telp')
									<p class="text-danger">{{ $message }}</p>
								  @enderror
							 </div>
							 <div class="mb-4">
								  <label for="product_title" class="form-label">No. Wa</label>
								  <input type="text" placeholder="Masukkan No. Wa" class="form-control" id="no_wa" name="no_wa" value="{{ $cucian->no_wa }}" />
								  @error('no_wa')
									<p class="text-danger">{{ $message }}</p>
								  @enderror
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
									 <option value="" hidden>-- PILIH JENIS PENGAMBILAN --</option>
									 <option {{ $cucian->jenis_ambil == 'ambil sendiri' ? 'selected' : '' }} value="ambil sendiri">Ambil Sendiri</option>
									 <option {{ $cucian->jenis_ambil == 'diantar' ? 'selected' : '' }} value="diantar">Diantar</option>
								</select>
								@error('jenis_ambil')
									<p class="text-danger">{{ $message }}</p>
								@enderror
						  </div>
							 <div class="mb-4">
								  <label class="form-label">Berat</label>
								  <input id="berat" name="berat" type="text" placeholder="Masukkan Berat Pakaian" class="form-control" value="{{ $cucian->berat }}"/>
								  @error('berat')
									<p class="text-danger">{{ $message }}</p>
								  @enderror
							 </div>
							 <div class="mb-4">
								  <label class="form-label">Kategori</label>
								  <select class="form-select" name="kategori_id" id="kategori_id">
										<option value="" hidden>-- PILIH KATEGORI --</option>
										@foreach ($kategori as $k)
										<option {{ $cucian->kategori_id == $k->id ? 'selected' : '' }} value="{{ $k->id }}">{{ $k->nama}}-----IDR {{ $k->harga}}</option>
										@endforeach
								  </select>
								  @error('kategori_id')
									<p class="text-danger">{{ $message }}</p>
								  @enderror
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
