@extends('admin.layouts.app')
@section('content')

<section class="content-main">
	<div class="content-header">
		 <a onclick="history.back()"><i class="material-icons md-arrow_back"></i> Go back </a>
			<div>
				 <h3 class="content-title card-title">Detail Cucian Offline</h3>
			</div>
	</div>
	<div class="card mb-4">
		 <div class="card-header {{ $detail->status_cucian == 'diproses' ? 'bg-warning' : 'bg-success' }}" style="height: 150px"></div>
		 <div class="card-body">
			  <div class="row">
					<div class="col-xl col-lg flex-grow-0" style="flex-basis: 230px">
						 <div class="img-thumbnail shadow w-100 bg-white position-relative text-center" style="height: 190px; width: 200px; margin-top: -120px">
							  <img src="{{ asset('admins/imgs/theme/washwes.png') }}" style="max-height: 190px; max-width: 200px; }}" class="center-xy img-fluid" alt="Logo Brand" />
						 </div>
					</div>
					<!--  col.// -->
					<div class="col-xl col-lg">
						 <h3>{{ $detail->no_order }}</h3>
						 <p>{{ $detail->atas_nama }}</p>
					</div>
					<!--  col.// -->
					<div class="col-xl-6 text-md-end">
						@if ($detail->status_cucian == 'diproses')
						<a data-confirm="Cucian Offline" onclick="actionConfirmation(this, event, 'Selesaikan Cucian {{ $detail->atas_nama }}')" href="{{ route('admin.cucian-offline.selesaikan', $detail->no_order) }}" class="btn btn-success text-white">Selesaikan Cucian</a>
						@elseif ($detail->status_cucian == 'selesai')
						<a data-confirm="Cucian Offline" onclick="actionConfirmation(this, event, 'Ambil Cucian {{ $detail->atas_nama }}')" href="{{ route('admin.cucian-offline.diambil', $detail->no_order) }}" class="btn btn-primary">Diambil</a>
						@endif
						 <a href="{{ route('admin.cucian-offline.edit', $detail->no_order) }}" class="btn btn-warning text-white">Edit</a>
						 <a data-confirm="Cucian Offline" onclick="hapus(this, event)" href="{{ route('admin.cucian-offline.hapus', $detail->no_order) }}" class="btn btn-danger">Hapus</a>
					</div>
					<!--  col.// -->
			  </div>
			  <!-- card-body.// -->
			  <hr class="my-4" />
			  <div class="row g-4">
					<div class="col-md-12 col-lg-3 col-xl-2 justify-content-center">
						 <article class="box">
							  <p class="mb-0 text-muted">Berat:</p>
							  <h5 class="text-success">{{ $detail->berat }} KG</h5>
							  <br>
							  <p class="mb-0 text-muted">Ongkir Antar:</p>
							  <h5 class="text-success">IDR {{ $detail->ongkir_antar }}</h5>
							  <br>
							  <p class="mb-0 text-muted">Total Harga:</p>
							  <h5 class="text-success mb-0">IDR {{ $detail->kategori->harga * $detail->berat + $detail->ongkir_jemput + $detail->ongkir_antar }}</h5>
						 </article>
					</div>
					<!--  col.// -->
					<div class="col-sm-6 col-lg-5 col-xl-4">
						 <h6>Detail Pelanggan</h6>
						 <p>
							  {{ $detail->atas_nama }} <br />
							 (telp) {{ $detail->no_telp ?? '--' }} <br />
							  (wa) {{ $detail->no_wa ?? '-' }} <br />
						 </p>
					</div>
					<div class="col-sm-6 col-lg-5 col-xl-3">
						 <h6>Detail Orderan</h6>
						 <p>
							  diorder {{ $detail->wkt_order }}<br />
							  @if ($detail->estimasi)
							  estimasi {{ $detail->estimasi }}<br />
							  @else
							  selesai {{ $detail->wkt_selesai }}<br />
							  @endif
							  {{ $detail->kategori->nama }} <br />
							  {{ $detail->jenis_ambil }} <br />
						 </p>
					</div>
					<!--  col.// -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						 <h6>Alamat Antar</h6>
						 <p>
							{{ $detail->alamat_antar }}
						</p>
						<p>
						  ({{ $detail->atas_nama }})
						</p>
					</div>
			  </div>
			  <!--  row.// -->
		 </div>
		 <div class="ms-auto">
			@if ($detail->status_cucian == 'diproses')
			<span class="badge badge-warning">Diproses</span>
			@else
			<span class="badge badge-success">Selesai</span>
			@endif
		 </div>
		 <!--  card-body.// -->
	</div>
</section>

@endsection