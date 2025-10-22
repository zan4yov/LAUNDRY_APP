
@extends('admin.layouts.app')
@section('content')

<section class="content-main">
	<div class="content-header">
		 <div>
			  <h2 class="content-title card-title">Konfirmasi Update Cucian Offline</h2>
		 </div>
	</div>
	<div class="card">
		 <header class="card-header">
			  <div class="row align-items-center">
					<div class="col-lg-6 col-md-6 mb-lg-0 mb-15">
						 <b>Atas Nama: {{ $request['atas_nama'] }}</b><br />
						 <b>Alamat Antar: {{ $request['alamat_antar'] }}</b><br />
						 <small class="text-muted">(wa) {{ $request['no_wa'] ?? '-' }}</small> <br>
						 <small class="text-muted">(telp) {{ $request['no_telp'] ?? '-' }}</small>
					</div>
					<div class="col-lg-6 col-md-6 ms-auto text-md-end">
						 <button class="btn btn-primary" id="konfirmasiButton" href="#">Update</button>
					</div>
			  </div>
		 </header>
		 <!-- card-header end// -->
		 <div class="card-body">
			  <!-- row // -->
			  <div class="row justify-content-center">
					<div class="col-lg-8">
						 <div class="table-responsive">
							  <table class="table">
									<thead>
										 <tr>
											  <th width="40%">Kategori Cucian</th>
											  <th width="20%">Berat</th>
											  <th width="20%">Jenis Ambil</th>
											  <th width="20%">Harga/KG</th>
										 </tr>
									</thead>
									<tbody>
										 <tr>
											  <td>{{ $request['kategori']['nama'] }}</td>
											  <td>{{ $request['berat'] }} KG</td>
											  <td>{{ $request['jenis_ambil'] }}</td>
											  <td>{{ $request['kategori']['harga'] }}</td>
										 </tr>
										 <tr>
											  <td colspan="4">
													<article class="float-end">
														 <dl class="dlist">
															  <dt>Subtotal:</dt>
															  <dd>{{ $request['harga'] }}</dd>
														 </dl>
														 <dl class="dlist">
															<dt>Ongkir Antar:</dt>
															<dd>{{ $request['ongkir_antar'] }}</dd>
													 	 </dl>
														 <dl class="dlist">
															  <dt>Total Harga:</dt>
															  <dd><b class="h5">IDR {{ $request['total_harga'] }}</b></dd>
														 </dl>
														 {{-- <dl class="dlist">
															  <dt class="text-muted">Status Pembayaran:</dt>
															  <dd>
																	<span class="badge rounded-pill alert-success text-success">{{ $detail->status_bayar }}</span>
															  </dd>
														 </dl> --}}
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

<form data-confirm="Cucian Offline" onsubmit="submitUpdateForm(this, event)" id="konfirmasiForm" action="{{ route('admin.cucian-offline.update') }}" method="POST" style="display: none;">
	@csrf
	<input type="hidden" name="no_order" value="{{ $request['no_order'] }}">
	<input type="hidden" name="atas_nama" value="{{ $request['atas_nama'] }}">
	<input type="hidden" name="alamat_antar" value="{{ $request['alamat_antar'] }}">
	<input type="hidden" name="no_wa" value="{{ $request['no_wa'] ?? null }}">
	<input type="hidden" name="no_telp" value="{{ $request['no_telp'] ?? null }}">
	<input type="hidden" name="kategori_nama" value="{{ $request['kategori']['nama'] }}">
	<input type="hidden" name="kategori_id" value="{{ $request['kategori']['id'] }}">
	<input type="hidden" name="berat" value="{{ $request['berat'] }}">
	<input type="hidden" name="jenis_ambil" value="{{ $request['jenis_ambil'] }}">
	<input type="hidden" name="harga" value="{{ $request['harga'] }}">
	<input type="hidden" name="ongkir_antar" value="{{ $request['ongkir_antar'] }}">
	<input type="hidden" name="total_harga" value="{{ $request['total_harga'] }}">
	<button type="submit" id="buttonHidden" hidden>Update</button>
</form>

<script>
	document.getElementById('konfirmasiButton').addEventListener('click', function() {
		 document.getElementById('buttonHidden').click();
	});
</script>

@endsection
