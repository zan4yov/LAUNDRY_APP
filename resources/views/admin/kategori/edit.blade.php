@extends('admin.layouts.app')
@section('content')

<form data-confirm="Kategori" onsubmit="submitUpdateForm(this, event)" action="{{ route('admin.kategori.update', $kategori->id) }}" method="POST" enctype="multipart/form-data" id="form-kategori">
	@csrf
	<section class="content-main">
		<div class="row">
			 <div class="col-12">
				  <div class="content-header">
						<div>
							<h2 class="content-title">Edit Kategori</h2>
							<p>ID Kategori : {{ $kategori->id }}</p>
						</div>
						<div>
							 <button class="btn btn-md rounded font-sm hover-up">Update</button>
						</div>
				  </div>
			 </div>
			 <div class="col-lg-6">
				  <div class="card mb-4">
						<div class="card-header">
							 <h4>Rincian Kategori</h4>
						</div>
						<div class="card-body">
							 <form>
								  <div class="mb-4">
										<label class="form-label">Nama</label>
										<input type="text" placeholder="Masukkan Nama" class="form-control" id="nama" name="nama" value="{{ $kategori->nama }}"/>
										@error('nama')
											<p class="text-danger">{{ $message }}</p>
										@enderror
								  </div>
								  <div class="mb-4">
										<label class="form-label">Harga/Kg</label>
										<input type="text" placeholder="Masukkan Harga/Kg" class="form-control" id="harga" name="harga" value="{{ $kategori->harga }}" />
										@error('harga')
											<p class="text-danger">{{ $message }}</p>
										@enderror
								  </div>
								  <div class="mb-4">
										<label class="form-label">Estimasi</label>
										<input type="text" placeholder="Masukkan Estimasi" class="form-control" id="estimasi_hari" name="estimasi_hari" value="{{ $kategori->estimasi_hari }}" />
										@error('estimasi_hari')
											<p class="text-danger">{{ $message }}</p>
								  		@enderror
								  </div>
							 </form>
						</div>
				  </div>
			 </div>
		</div>
  </section>
</form>

@endsection