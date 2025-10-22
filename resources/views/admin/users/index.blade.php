@extends('admin.layouts.app')
@section('content')

<section class="content-main">
    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Admin</h2>
            <p>Management Data Admin </p>
        </div>
        <div>
            <input type="text" id="search" placeholder="Cari Nama/Email..." class="form-control bg-white" value="{{ request()->query('search') }}" />
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <form onsubmit="submitTambahAdmin(this, event)" action="{{ route('admin.users.store') }}" method="POST">
                        @csrf
								<div class="mb-4">
									<label for="nama" class="form-label">Nama</label>
									<input type="text" name="nama" placeholder="Masukkan Nama" class="form-control" id="nama" value="{{ old('nama')}}" />
									@error('nama')
										<p class="text-danger">{{ $message }}</p>
									@enderror
							  </div>
							  
                        <div class="mb-4">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" name="email" placeholder="Masukkan Email" class="form-control" id="email" value="{{ old('email')}}" />
									 @error('email')
										<p class="text-danger">{{ $message }}</p>
									@enderror
                        </div>
								
                        <div class="mb-4">
                            <label for="no_telp" class="form-label">No Telp</label>
                            <input type="text" name="no_telp" placeholder="Masukkan No Telp" class="form-control" id="no_telp" value="{{ old('no_telp')}}" />
									 @error('no_telp')
									 <p class="text-danger">{{ $message }}</p>
									@enderror
                        </div>
							
                        <div class="mb-4">
                            <label for="no_telp" class="form-label">No Whatsapp</label>
                            <input type="text" name="no_telp" placeholder="Masukkan No Wa" class="form-control" id="no_wa" value="{{ old('no_wa')}}" />
									 @error('no_wa')
										<p class="text-danger">{{ $message }}</p>
									@enderror
                        </div>
								
                        <div class="mb-4">
                            <label for="alamat" class="form-label">Alamat</label>
                            <input type="text" name="alamat" placeholder="Masukkan Alamat" class="form-control" id="alamat" value="{{ old('alamat')}}" />
									 @error('alamat')
										<p class="text-danger">{{ $message }}</p>
									@enderror
                        </div>
								
								<div class="mb-4">
									<label for="password" class="form-label">Password</label>
									<input type="password" name="password" placeholder="Masukkan Password" class="form-control" id="password" />
									@error('password')
										<p class="text-danger">{{ $message }}</p>
									@enderror
							  </div>
							  
								<div class="mb-4">
									<label for="password" class="form-label">Konfirmasi Password</label>
									<input type="password" name="password_confirmation" placeholder="Konfirmasi Password" class="form-control" id="password_confirmation" />
							  </div>
                        <div class="d-grid">
                            <button class="btn btn-primary" type="submit">Buat Akun Admin</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-9">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Nama</th>
                                    <th>No Telp</th>
                                    <th>Alamat</th>
                                    <th>Role</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $user)
                                <tr>
                                    <td>{{ $user->id }}</td>
                                    <td>{{ $user->email }}</td>
                                    <td><b>{{ $user->nama }}</b></td>
                                    <td>{{ $user->no_telp }}</td>
                                    <td>{{ $user->alamat }}</td>
                                    <td>{{ ucfirst($user->role) }}</td>
                                    <td class="text-end">
													<form onsubmit="submitDeleteAdmin(this, event)" action="{{ route('admin.users.delete', $user->id) }}" method="POST">
														@method('DELETE')
														@csrf
														<button class="btn btn-danger">Delete</button>
													</form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
	document.getElementById('search').addEventListener('keypress', function(e) {
		if(e.key === 'Enter') {
			window.location = window.location.origin + window.location.pathname + '?search=' + this.value
		}
	})

	function submitTambahAdmin(element, event){
		event.preventDefault()
		Swal.fire({
			title: `Tambah Admin`,
			text: "Apakah data sudah benar?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Ya!'
		}).then((result) => {
			if (result.isConfirmed) {
				element.submit();
			}
		});
	}
	function submitDeleteAdmin(element, event){
		event.preventDefault()
		Swal.fire({
			title: `Hapus Admin`,
			text: "Apakah anda yakin ingin menghapus?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Ya!'
		}).then((result) => {
			if (result.isConfirmed) {
				element.submit();
			}
		});
	}
</script>
@endsection
