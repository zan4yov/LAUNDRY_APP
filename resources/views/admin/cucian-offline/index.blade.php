@extends('admin.layouts.app')
@section('content')

@if ($errors->any())
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			$('#modalCreateCucian').modal('show');
		});
	</script>
@endif

<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Cucian Offline</h2>
            <p>List Cucian Offline</p>
        </div>
			<div class="col-lg-4 col-md-6">
				<input type="text" placeholder="Cari No. Order/Atas Nama/Nama User..." id="search" class="form-control bg-white" value="{{ request()->query('search') }}"/>
		  </div>
    </div>
    <div class="card mb-4">
        <header class="card-header">
            <form action="{{ route('admin.cucian-offline') }}">
					<div class="row gy-3">
						 <div class="col-lg-3 col-md-3 col-6">
							  <select class="form-select" name="status_cucian">
								  <option {{ request()->query('status_cucian') == '' ? 'selected' : '' }} value=''>Semua</option>
									<option {{ request()->query('status_cucian') == 'diproses' ? 'selected' : '' }} value="diproses">Diproses</option>
									<option {{ request()->query('status_cucian') == 'selesai' ? 'selected' : '' }} value="selesai">Selesai</option>
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
					<div class="col-lg-3 col-md-3 col-6 me-auto mt-4">
						<button type="button" class="btn btn-sm btn-success text-white" data-toggle="modal" data-target="#modalCreateCucian" >Buat Cucian Baru</button>
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
                            <th>Atas Nama</th>
                            <th>Kategori</th>
                            <th>Status Cucian</th>
                            <th>Waktu Order</th>
									 @if (request()->query('status_cucian') != 'selesai')
									 <th>Estimasi</th>
									 @endif
                            <th>Jenis Ambil</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($cucian as $c)
                        <tr>
                            <td>{{$c->no_order}}</td>
                            <td>{{$c->atas_nama}}</td> <!-- Menampilkan nama pengguna -->
                            <td>{{$c->kategori->nama}}</td> <!-- Menampilkan nama kategori -->
                            @if ($c->status_cucian == 'diproses')
										<td><span class="badge badge-warning">{{$c->status_cucian}}</span></td> 
									  @else
										<td><span class="badge badge-success">{{$c->status_cucian}}</span></td>
									 @endif
                            <td>{{$c->wkt_order}}</td>
									 @if (request()->query('status_cucian') != 'selesai')
									 <td>{{$c->estimasi ?? '----------'}}</td>
									 @endif
                            <td>{{$c->jenis_ambil}}</td> 
									 <td class="text-end">
										<div class="dropdown">
											 <a href="#" data-bs-toggle="dropdown" class="btn btn-light rounded btn-sm font-sm"> <i class="material-icons md-more_horiz"></i> </a>
											 <div class="dropdown-menu">
												  <a class="dropdown-item text-success" href="{{ route('admin.cucian-offline.detail', $c->no_order) }}">Detail</a>
												  @if ($c->status_cucian == 'diproses')
												  <a data-confirm="Cucian Offline" onclick="actionConfirmation(this, event, 'Selesaikan Cucian {{ $c->atas_nama }}')" class="dropdown-item text-primary" href="{{ route('admin.cucian-offline.selesaikan', $c->no_order) }}">Selesaikan</a>
													@elseif ($c->status_cucian == 'selesai')
													<a data-confirm="Cucian Offline" onclick="actionConfirmation(this, event, 'Ambil Cucian {{ $c->atas_nama }}')" class="dropdown-item text-primary" href="{{ route('admin.cucian-offline.diambil', $c->no_order) }}">Diambil</a>
												  @endif
												  <a class="dropdown-item text-warning" href="{{ route('admin.cucian-offline.edit', $c->no_order) }}">Edit</a>
												  <a data-confirm="Cucian Offline" onclick="hapus(this, event)" class="dropdown-item text-danger" href="{{ route('admin.cucian-offline.hapus', $c->no_order) }}">Hapus</a>
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

@include('admin.cucian-offline.create')

@endsection
