@extends('admin.layouts.app')
@section('content')

<section class="content-main">
	<div class="content-header">
		 <a href="{{ route('admin.pembelian') }}"><i class="material-icons md-arrow_back"></i> Go back </a>
			<div>
				 <h3 class="content-title card-title">Detail Pembelian Bahan</h3>
			</div>
	</div>
	<div class="card mb-4">
		 <div class="card-header bg-primary" style="height: 150px"></div>
		 <div class="card-body">
			  <div class="row">
					<div class="col-xl col-lg flex-grow-0" style="flex-basis: 230px">
						 <div class="img-thumbnail shadow w-100 bg-white position-relative text-center" style="height: 190px; width: 200px; margin-top: -120px">
							  @if ($detail->bukti)
							 	 <img src="{{ $detail->bukti }}" style="max-height: 190px; max-width: 200px; }}" class="center-xy img-fluid" alt="Logo Brand" />
								 @else
								 <img src="{{ asset('admins/imgs/theme/washwes.png') }}" style="max-height: 190px; max-width: 200px; }}" class="center-xy img-fluid" alt="Logo Brand" />
							  @endif
						 </div>
					</div>
					<!--  col.// -->
					<div class="col-xl col-lg">
						 <h3>{{ $detail->kode_beli }}</h3>
						 <p>{{ $detail->jenis_bahan }}</p>
					</div>
					<!--  col.// -->
					<div class="col-xl-6 text-md-end">
						 <a href="{{ route('admin.pembelian.edit', $detail->kode_beli) }}" class="btn btn-warning text-white me-2">Edit</a>
						 <a data-confirm="Pembelian" onclick="hapus(this, event)" href="{{ route('admin.pembelian.hapus', $detail->kode_beli) }}" class="btn btn-danger">Hapus</a>
					</div>
					<!--  col.// -->
			  </div>
			  <!-- card-body.// -->
			  <hr class="my-4" />
			  <div class="row g-4">
					<div class="col-md-12 col-lg-3 col-xl-2 justify-content-center">
						 <article class="box">
							  <p class="mb-0 text-muted">Jumlah:</p>
							  <h5 class="text-bold">{{ $detail->jumlah_beli }}</h5>
							  <br>
							  <p class="mb-0 text-muted">Total Harga:</p>
							  <h5 class="text-bold">{{ $detail->total_harga }}</h5>
						 </article>
					</div>
					<div class="col-md-12 col-lg-3 col-xl-2 justify-content-center">
						 <article class="box">
							<p class="mb-0 text-muted">Jenis Bahan:</p>
							<h5 class="text-bold">{{ $detail->jenis_bahan }}</h5>
						 </article>
					</div>
					<div class="col-md-12 col-lg-3 col-xl-3 justify-content-center">
						 <article class="box">
							<p class="mb-0 text-muted">Merk:</p>
							<h5 class="text-bold">{{ $detail->merk }}</h5>
						 </article>
					</div>
					<div class="col-md-12 col-lg-3 col-xl-2 justify-content-center">
						 <article class="box">
							<p class="mb-0 text-muted">Tanggal Beli:</p>
							<h5 class="text-bold">{{ $detail->tanggal_beli }}</h5>
						 </article>
					</div>
					<div class="col-md-12 col-lg-3 col-xl-2 justify-content-center">
						<article class="box">
						  <p class="mb-0 text-muted">Jam Beli:</p>
						  <h5 class="text-bold">{{ $detail->jam_beli }}</h5>
						</article>
				  </div>
					<!--  col.// -->
			  </div>
			  <!--  row.// -->
		 </div>
		 <!--  card-body.// -->
	</div>
</section>

@endsection