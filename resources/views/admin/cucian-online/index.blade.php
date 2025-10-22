@extends('admin.layouts.app')
@section('content')

<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Cucian Online</h2>
            <p>List Cucian Online</p>
        </div>
			<div class="col-lg-4 col-md-6">
				<input type="text" placeholder="Cari No. Order/Atas Nama/Nama User..." id="search" class="form-control bg-white" value="{{ request()->query('search') }}"/>
		  </div>
    </div>
    <div class="card mb-4">
        <header class="card-header">
            <form action="{{ route('admin.cucian-online') }}">
					<div class="row gy-3">
						 <div class="col-lg-3 col-md-3 col-6">
							  <select class="form-select" name="status_cucian">
								  <option {{ request()->query('status_cucian') == '' ? 'selected' : '' }} value=''>Semua</option>
									<option {{ request()->query('status_cucian') == 'menunggu' ? 'selected' : '' }} value="menunggu">Menunggu</option>
									<option {{ request()->query('status_cucian') == 'diproses' ? 'selected' : '' }} value="diproses">Diproses</option>
									<option {{ request()->query('status_cucian') == 'selesai' ? 'selected' : '' }} value="selesai">Selesai</option>
							  </select>
						 </div>
						 <div class="col-lg-3 col-md-3 col-6">
							  <select class="form-select" name="status_bayar">
								  <option {{ request()->query('status_bayar') == '' ? 'selected' : '' }} value=''>Semua</option>
									<option {{ request()->query('status_bayar') == 'dibayar' ? 'selected' : '' }} value="dibayar">Dibayar</option>
									<option {{ request()->query('status_bayar') == 'belum dibayar' ? 'selected' : '' }} value="belum dibayar">Belum Dibayar</option>
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
        <!-- card-header end// -->
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>No. Order</th>
									 <th>User</th>
                            <th>Atas Nama</th>
									 <th>Kategori</th>
                            <th>Status Cucian</th>
                            <th>Waktu Order</th>
									 @if (request()->query('status_cucian') != 'selesai' && request()->query('status_cucian') != 'menunggu')
									 <th>Estimasi</th>
									 @endif
                            <th>Status Bayar</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($cucian as $c)
                        <tr>
                            <td>{{$c->no_order}}</td>
									 <td>{{$c->user->nama}}</td>
                            <td>{{$c->atas_nama}}</td> <!-- Menampilkan nama pengguna -->
									 <td>{{$c->kategori->nama ?? '------'}}</td>
									 @if ($c->status_cucian == 'menunggu')
										<td><span class="badge badge-danger">{{$c->status_cucian}}</span></td> 
										@elseif ( $c->status_cucian == 'diproses')
										<td><span class="badge badge-warning">{{$c->status_cucian}}</span></td> 
										@else
										<td><span class="badge badge-success">{{$c->status_cucian}}</span></td>
									@endif
                            <td>{{$c->wkt_order}}</td>
									 @if (request()->query('status_cucian') != 'selesai' && request()->query('status_cucian') != 'menunggu')
										 <td>{{$c->estimasi ?? '----------'}}</td>
									 @endif
                            <td><span class="badge {{ $c->status_bayar == 'dibayar' ? 'badge-success' : 'badge-danger' }}">{{$c->status_bayar}}</span></td> 
									 <td class="text-end">
										<div class="dropdown">
											 <a href="#" data-bs-toggle="dropdown" class="btn btn-light rounded btn-sm font-sm"> <i class="material-icons md-more_horiz"></i> </a>
											 <div class="dropdown-menu">
												  @if ($c->status_cucian != 'menunggu')
												  <a class="dropdown-item text-success" href="{{ route('admin.cucian-online.detail', $c->no_order) }}">Detail</a>
												  @endif
												  @if ($c->status_cucian == 'diproses')
												  <a data-confirm="Cucian Online" onclick="actionConfirmation(this, event, 'Selesaikan Cucian {{ $c->atas_nama }}')" class="dropdown-item text-primary" href="{{ route('admin.cucian-online.selesaikan', $c->no_order) }}">Selesaikan</a>
													@elseif ($c->status_cucian == 'selesai')
													<a data-confirm="Cucian Online" onclick="actionConfirmation(this, event, 'Ambil Cucian {{ $c->atas_nama }}')" class="dropdown-item text-primary" href="{{ route('admin.cucian-online.diambil', $c->no_order) }}">Diambil</a>
												  @endif
												  @if ($c->status_cucian != 'menunggu')
												  <a class="dropdown-item text-warning" href="{{ route('admin.cucian-online.edit', $c->no_order) }}">Edit</a>
												  @else
												  <a class="dropdown-item text-warning" href="{{ route('admin.cucian-online.proses-order', $c->no_order) }}">Proses Order</a>
												  @endif
												  <a data-confirm="Cucian Online" onclick="hapus(this, event)" class="dropdown-item text-danger" href="{{ route('admin.cucian-online.hapus', $c->no_order) }}">Hapus</a>
											 </div>
										</div>
										<!-- dropdown //end -->
								  </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <!-- table-responsive//end -->
        </div>
        <!-- card-body end// -->
    </div>
    <!-- card end// -->
    </div>
	 <div class="pagination-area mt-15 mb-50">
		<nav aria-label="Page navigation example">
			 <ul class="pagination justify-content-start">
				  {{ $cucian->links() }}
			 </ul>
		</nav>
  </div>
</section>

<script>
	document.getElementById('search').addEventListener('keypress', function(e) {
		if(e.key === 'Enter') {
			window.location = window.location.origin + window.location.pathname + '?search=' + this.value
		}
	})
</script>

@endsection