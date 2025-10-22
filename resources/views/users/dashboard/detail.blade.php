@extends('users.layouts.app')
@section('content')


<section class="content-main p-5">
	<div class="content-header">
		<a href="{{ route('user.index') }}"><i class="material-icons md-arrow_back"></i> Kembali </a>
			<div>
				 <h3 class="content-title card-title">Detail Order Cucian</h3>
			</div>
	</div>
	<div class="card mb-4">
		 @if ($detail->status_cucian == 'menunggu')
		 <div class="card-header bg-danger" style="height: 150px"></div>
		 @elseif ($detail->status_cucian == 'diproses')
		 <div class="card-header bg-warning" style="height: 150px"></div>
		 @elseif ($detail->status_cucian == 'selesai')
		 <div class="card-header bg-success" style="height: 150px"></div>
		 @else
		 <div class="card-header bg-primary" style="height: 150px"></div>
		 @endif
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
						 <span class="badge {{ $detail->status_bayar == 'belum dibayar' ? 'badge-danger' : 'badge-success' }}" >{{ $detail->status_bayar }}</span>
					</div>
					<!--  col.// -->
					<div class="col-xl-6 text-md-end">
							@if ($detail->status_cucian == 'menunggu')
								<span class="badge badge-danger" style="width: 30%;" >Menunggu</span>
							@elseif ($detail->status_cucian == 'diproses')
								<span class="badge badge-warning" style="width: 30%;">Diproses</span>
							@elseif ($detail->status_cucian == 'selesai')
								<span class="badge badge-success" style="width: 30%;">Selesai</span>
							@else
								<span class="badge badge-primary" style="width: 30%;">Diambil</span>
							@endif
					</div>
					<!--  col.// -->
			  </div>
			  <!-- card-body.// -->
			  <hr class="my-4" />
			  <div class="row g-4">
					<div class="col-md-12 col-lg-3 col-xl-2 justify-content-center">
						 <article class="box">
							  @if ($detail->status_cucian != 'menunggu')
							  <p class="mb-0 text-muted">Berat:</p>
							  <h5 class="text-success">{{ $detail->berat }} KG</h5>
							  <br>
							  @endif
							  <p class="mb-0 text-muted">Ongkir Antar:</p>
							  <h5 class="text-success">IDR {{ $detail->ongkir_antar }}</h5>
							  <br>
							  <p class="mb-0 text-muted">Ongkir Jemput:</p>
							  <h5 class="text-success">IDR {{ $detail->ongkir_jemput }}</h5>
							  <br>
							  @if ($detail->status_cucian != 'menunggu')
							  <p class="mb-0 text-muted">Total Harga:</p>
							  <h5 class="text-success mb-0">IDR {{ $detail->kategori->harga * $detail->berat + $detail->ongkir_jemput + $detail->ongkir_antar }}</h5>
							  @endif
						 </article>
					</div>
					<!--  col.// -->
					<div class="col-sm-6 col-lg-5 col-xl-4">
						 <h6>Detail Pelanggan</h6>
						 <p>
							  {{ $detail->user->nama }} <br />
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
							  @elseif ($detail->wkt_selesai)
							  selesai {{ $detail->wkt_selesai }}<br />
							  @endif
							  
							  @if ($detail->wkt_diambil)
							  diambil {{ $detail->wkt_diambil }}<br />
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
		@if ($detail->status_bayar == 'belum dibayar' && $detail->status_cucian != 'menunggu')
			<form action="{{ route('user.pembayaran.store') }}" method="POST" class="mx-auto mb-3">
				@csrf
				<input type="hidden" name="no_order" value="{{ $detail->no_order }}">
				<input type="hidden" name="snap_token" value="{{ $detail->snap_token }}">
				@if ($detail->snap_token)
				<button id="pay-button" class="btn btn-success text-white fw-bold">Lanjut Bayar</button>
				@else
				<button id="pay-button" class="btn btn-success text-white fw-bold">Bayar Sekarang</button>
				@endif
			</form>
			@if ($detail->snap_token)
			<form action="{{ route('user.pembayaran.cancel') }}" method="POST" class="mx-auto mb-3">
				@method('DELETE')
				@csrf
				<input type="hidden" name="no_order" value="{{ $detail->no_order }}">
				<input type="hidden" name="snap_token" value="{{ $detail->snap_token }}">
				<button id="cancel-button" class="btn btn-danger text-white fw-bold">Batal Bayar</button>
			</form>
			@endif
		@endif
	</div>
</section>

<script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{ config('utils.MIDTRANS_CLIENT_KEY') }}"></script>
<script type="text/javascript">
	snapToken = "{{ session('snapToken') }}"
	if(snapToken) {
		snap.pay(snapToken, {
		 onSuccess: function(result){
			window.location.href = result.finish_redirect_url
		 },
		 onPending: function(result){
			// window.location.href = `{{ route('user.pembayaran.status') }}` + queryString;
		 },
		 onError: function(result){
			window.location.reload()
		 },
		 onClose: function () {
         // window.location.reload()
        }
	  });
	}
</script>

@endsection