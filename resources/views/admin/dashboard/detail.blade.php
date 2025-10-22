@extends('admin.layouts.app')
@section('content')

<section class="content-main">
	<div class="content-header">
		 <div>
			  <h2 class="content-title card-title">Detail Cucian {{ $jenis_order }}</h2>
			  <p>No. Order: {{ $detail->no_order }}</p>
		 </div>
	</div>
	<div class="card">
		 <header class="card-header">
			  <div class="row align-items-center">
					<div class="col-lg-6 col-md-6 mb-lg-0 mb-15">
						 <b>Diambil Pada: {{ $detail->wkt_diambil }}</b><br />
						 <b>Atas Nama: {{ $detail->atas_nama }}</b><br />
						 <small class="text-muted">{{ $detail->no_order }}</small>
					</div>
					<div class="col-lg-6 col-md-6 ms-auto text-md-end">
						 {{-- <a class="btn btn-primary" href="#">Print</a> --}}
						 <a onclick="window.print()" class="btn btn-secondary print ms-2" href="#"><i class="icon material-icons md-print"></i></a>
					</div>
			  </div>
		 </header>
		 <!-- card-header end// -->
		 <div class="card-body">
			  <div class="row mb-50 mt-20 order-info-wrap">
					<div class="col-md-4">
						 <article class="icontext align-items-start">
							  <span class="icon icon-sm rounded-circle bg-primary-light">
									<i class="text-primary material-icons md-person"></i>
							  </span>
							  <div class="text">
									<h6 class="mb-1">Data Pelanggan</h6>
									<p class="mb-1">
										 {{ $detail->atas_nama }} <br />
										 {{ $detail->user->email ?? 'email tidak tersedia' }} <br />
										 (telp) {{ $detail->no_telp ?? '' }} <br>
										 (wa) {{ $detail->no_telp ?? '' }}
									</p>
									<a href="#">View profile</a>
							  </div>
						 </article>
					</div>
					<!-- col// -->
					<div class="col-md-5">
						 <article class="icontext align-items-start">
							  <span class="icon icon-sm rounded-circle bg-primary-light">
									<i class="text-primary material-icons md-local_shipping"></i>
							  </span>
							  <div class="text">
									<h6 class="mb-1">Order Info</h6>
									<p class="mb-1">
										 waktu order: {{ $detail->wkt_order }} <br />
										 waktu selesai: {{ $detail->wkt_selesai }} <br />
										 waktu ambil: {{ $detail->wkt_diambil }} <br />
										 jenis ambil: {{ $detail->jenis_ambil }}
									</p>
							  </div>
						 </article>
					</div>
					<!-- col// -->
					<div class="col-md-3">
						 <article class="icontext align-items-start">
							  <span class="icon icon-sm rounded-circle bg-primary-light">
									<i class="text-primary material-icons md-place"></i>
							  </span>
							  <div class="text">
									<h6 class="mb-1">Alamat Antar</h6>
									@if ($detail->alamat_antar)
										<p class="mb-1">{{ $detail->alamat_antar }}</p>
									@else
										<p class="mb-1">-</p>
									@endif
							  </div>
						 </article>
					</div>
					<!-- col// -->
			  </div>
			  <!-- row // -->
			  <div class="row justify-content-center">
					<div class="col-lg-8">
						 <div class="table-responsive">
							  <table class="table">
									<thead>
										 <tr>
											  <th width="40%">Kategori Cucian</th>
											  <th width="20%">Berat</th>
											  <th width="20%">Harga</th>
											  <th width="20%">Harga/KG</th>
										 </tr>
									</thead>
									<tbody>
										 <tr>
											  <td>{{ $detail->kategori->nama }}</td>
											  <td>{{ $detail->berat }} KG</td>
											  <td>{{ $detail->kategori->harga * $detail->berat }}</td>
											  <td>{{ $detail->kategori->harga }}</td>
										 </tr>
										 <tr>
											  <td colspan="4">
													<article class="float-end">
														 <dl class="dlist">
															  <dt>Subtotal:</dt>
															  <dd>{{ $detail->kategori->harga * $detail->berat }}</dd>
														 </dl>
														 <dl class="dlist">
															<dt>Ongkir Antar:</dt>
															<dd>{{ $detail->ongkir_antar }}</dd>
													 	 </dl>
														 <dl class="dlist">
															<dt>Ongkir Jemput:</dt>
															<dd>{{ $detail->ongkir_jemput }}</dd>
													 	 </dl>
														 <dl class="dlist">
															  <dt>Total Harga:</dt>
															  <dd><b class="h5">IDR {{ $detail->kategori->harga * $detail->berat + $detail->ongkir_jemput + $detail->ongkir_antar }}</b></dd>
														 </dl>
														 <dl class="dlist">
															  <dt class="text-muted">Status Pembayaran:</dt>
															  <dd>
																	<span class="badge rounded-pill alert-success text-success">{{ $detail->status_bayar }}</span>
															  </dd>
														 </dl>
													</article>
											  </td>
										 </tr>
									</tbody>
							  </table>
						 </div>
					</div>
			  </div>
		 </div>
		 <!-- card-body end// -->
	</div>
	<!-- card end// -->
</section>

<style>
	@media print {
		 .print, .no-print {
			  display: none;
		 }
		 header, footer, nav, .nav, .form-control, .btn{
			  display: none;
		 }
	}
</style>

@endsection
