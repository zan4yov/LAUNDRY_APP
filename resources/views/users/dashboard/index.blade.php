@extends('users.layouts.app')
@section('content')

<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Order Cucian</h2>
            <p>Melakukan order cucian serta status cucian</p>
        </div>
        <div>
            <input type="text" id="search" placeholder="Cari No.Order..." class="form-control bg-white" />
        </div>
    </div>
    <div class="card">
		
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <form action="{{ route('user.order.confirmation') }}">
								<div class="mb-4">
									<label for="product_title" class="form-label">Atas Nama</label>
									<input type="text" placeholder="Masukkan Atas Nama Order" class="form-control" id="atas_nama" name="atas_nama" value="{{ old('atas_nama') }}" />
									@error('atas_nama')
									<p class="text-danger">{{ $message }}</p>
									@enderror
								</div>
                        <div class="mb-4">
									<label for="product_title" class="form-label">Alamat Pengantaran</label>
									<input type="text" placeholder="Masukkan Alamat Pengantaran" class="form-control" id="alamat_antar" name="alamat_antar" value="{{ auth()->user()->alamat }}" />
									@error('alamat_antar')
									 <p class="text-danger">{{ $message }}</p>
									@enderror
							  </div>
							  <div class="mb-4">
									<label for="product_title" class="form-label">No. Telp</label>
									<input type="text" placeholder="Masukkan No. Telp" class="form-control" id="no_telp" name="no_telp" value="{{ auth()->user()->no_telp }}"/>
									@error('no_telp')
									<p class="text-danger">{{ $message }}</p>
									@enderror
						  		</div>
								<div class="mb-4">
									<label for="product_title" class="form-label">No. Wa</label>
									<input type="text" placeholder="Masukkan No. Wa" class="form-control" id="no_wa" name="no_wa" value="{{ auth()->user()->no_wa }}" />
									@error('no_wa')
									<p class="text-danger">{{ $message }}</p>
									@enderror
								</div>
                        <div class="mb-4">
									<label class="form-label">Kategori</label>
									<select class="form-select" name="kategori_id" id="kategori_id">
										 <option value="" hidden>-- PILIH KATEGORI --</option>
										 @foreach ($kategori as $k)
										 <option {{ old('kategori_id') == $k->id ? 'selected' : '' }} value="{{ $k->id }}">{{ $k->nama}}-----IDR {{ $k->harga}}</option>
										 @endforeach
									</select>
									@error('kategori_id')
									 <p class="text-danger">{{ $message }}</p>
									@enderror
							  </div>
							  <div class="mb-4">
									<label for="product_brand" class="form-label">Jenis Pengambilan</label>
									<select class="form-select" id="jenis_ambil" name="jenis_ambil">
										<option value="" hidden>-- PILIH JENIS PENGAMBILAN --</option>
										<option {{ old('jenis_ambil') == 'ambil sendiri' ? 'selected' : '' }} value="ambil sendiri">Ambil Sendiri</option>
										<option {{ old('jenis_ambil') == 'diantar' ? 'selected' : '' }} value="diantar">Diantar</option>
									</select>
									@error('jenis_ambil')
									<p class="text-danger">{{ $message }}</p>
									@enderror
								</div>
                        <div class="">
                            <button class="btn btn-primary">Buat Pesanan</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-9 mt-5">
						<header class="card-header pt-0 mt-0">
							<form action="{{ route('user.index') }}">
								<div class="row justify-content-end gy-3">
									 <div class="col-lg-2 col-md-2 col-2 ms-auto">
										<a href="javascript:window.location.reload();">
											 <i class="material-icons md-refresh"></i>
										</a>
									 </div>
									 <div class="col-lg-3 col-md-3 col-6">
										  <select class="form-select" name="status_cucian">
											  <option {{ request()->query('status_cucian') == '' ? 'selected' : '' }} value=''>Semua</option>
												<option {{ request()->query('status_cucian') == 'menunggu' ? 'selected' : '' }} value="menunggu">Menunggu</option>
												<option {{ request()->query('status_cucian') == 'diproses' ? 'selected' : '' }} value="diproses">Diproses</option>
												<option {{ request()->query('status_cucian') == 'selesai' ? 'selected' : '' }} value="selesai">Selesai</option>
										  </select>
									 </div>
									 <div class="col-lg-3 col-md-3 col-6">
										  <select class="form-select" name="paginate">
												<option {{ request()->query('paginate') == 15 ? 'selected' : '' }} value="15">Show 15</option>
												<option {{ request()->query('paginate') == 30 ? 'selected' : '' }} value="30">Show 30</option>
												<option {{ request()->query('paginate') == 50 ? 'selected' : '' }} value="50">Show 50</option>
										  </select>
									 </div>
									 <div class="col-lg-3 col-md-3 col-6">
										  <button class="btn btn-sm btn-primary">Terapkan</button>
									 </div>
					  </header>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>No. Order</th>
												<th>Kategori</th>
                                    <th>Status Cucian</th>
												<th>Waktu Order</th>
												@if (request()->query('status_cucian') != 'selesai' && request()->query('status_cucian') != 'menunggu')
												<th>Estimasi</th>
												@endif
												<th>Status Bayar</th>
												@if (request()->query('status_cucian') != 'menunggu')
                                    <th>Berat/KG</th>
												@endif
												<th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
										@foreach($cucian as $c)
										<tr>
											 <td>{{$c->no_order}}</td>
											 <td>{{$c->kategori->nama ?? '------'}}</td>
											 @if ($c->status_cucian == 'menunggu')
												<td><span class="badge badge-danger">{{$c->status_cucian}}</span></td> 
												@elseif ( $c->status_cucian == 'diproses')
												<td><span class="badge badge-warning">{{$c->status_cucian}}</span></td> 
												@elseif( $c->status_cucian == 'selesai' )
												<td><span class="badge badge-success">{{$c->status_cucian}}</span></td>
												@else
												<td><span class="badge badge-primary">{{$c->status_cucian}}</span></td>
											@endif
											 <td>{{$c->wkt_order}}</td>
											 @if (request()->query('status_cucian') != 'selesai' && request()->query('status_cucian') != 'menunggu')
												 <td>{{$c->estimasi ?? '----------'}}</td>
											 @endif
											 <td><span class="badge {{ $c->status_bayar == 'dibayar' ? 'badge-success' : 'badge-danger' }}">{{$c->status_bayar}}</span></td> 
											 @if (request()->query('status_cucian') != 'menunggu')
											 <td>{{$c->berat ?? '--------'}}</td> 
											 @endif
											 <td class="text-end">
												<a class="text-success" href="{{ route('user.order.detail',$c->no_order) }}">Detail</a>
										  </td>
										</tr>
										@endforeach
                            </tbody>
                        </table>
                    </div>
						  <div class="pagination-area mt-15 mb-50">
							<nav aria-label="Page navigation example">
								 <ul class="pagination justify-content-start">
									  {{ $cucian->links() }}
								 </ul>
							</nav>
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

<script>
	document.getElementById('search').addEventListener('keypress', function(e) {
		if(e.key === 'Enter') {
			window.location = window.location.origin + window.location.pathname + '?search=' + this.value
		}
	})
</script>

@endsection
