@extends('admin.layouts.app')
@section('content')

<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Laporan</h2>
            <p>Laporan Cucian {{ $jenis_order ?? 'Selesai' }}</p>
        </div>
			<div class="col-lg-4 col-md-6">
				<input type="text" placeholder="Cari No. Order/Atas Nama/Nama User..." class="form-control bg-white" id="search" value="{{ request()->query('search') }}" />
		  </div>
    </div>
    <div class="card mb-4">
        <header class="card-header">
            <form action="{{ route('admin.index') }}">
					<div class="row gx-3 gy-3">
						 <div class="col-lg-3 col-md-3 col-6">
							  <select class="form-select" name="jenis_order">
									<option {{ request()->query('jenis_order') == '' ? 'selected' : '' }} value=''>Semua</option>
									<option {{ request()->query('jenis_order') == 'online' ? 'selected' : '' }} value="online">Cucian Online</option>
									<option {{ request()->query('jenis_order') == 'offline' ? 'selected' : '' }} value="offline">Cucian Offline</option>
							  </select>
						 </div>
						 <div class="col-lg-3 col-md-3 col-6">
							  <select class="form-select" name="jenis_ambil">
									<option {{ request()->query('jenis_ambil') == '' ? 'selected' : '' }} value=''>Semua</option>
									<option {{ request()->query('jenis_ambil') == 'diantar' ? 'selected' : '' }} value="diantar">Diantar</option>
									<option {{ request()->query('jenis_ambil') == 'ambil sendiri' ? 'selected' : '' }} value="ambil sendiri">Ambil Sendiri</option>
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
					</div>
				</form>
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
                            <th>Jenis Ambil</th>
                            <th>Waktu Diambil</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($cucian as $c)
                        <tr>
                            <td>{{$c->no_order}}</td>
                            <td>{{$c->user->nama ?? '-'}}</td> <!-- Menampilkan nama pengguna -->
                            <td>{{$c->atas_nama}}</td> <!-- Menampilkan nama pengguna -->
                            <td>{{$c->kategori->nama}}</td> <!-- Menampilkan nama kategori -->
                            <td>{{$c->jenis_ambil}}</td> 
                            <td>{{$c->wkt_diambil}}</td>
                            <td>
											<a class="" href="{{ route('admin.detail', $c->no_order) }}">
												<button class="btn btn-primary">Detail</button>
											</a>
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
