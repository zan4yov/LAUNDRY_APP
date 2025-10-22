@extends('users.layouts.app')
@section('content')

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="content-header">
    <h2 class="content-title just">Profile setting</h2>
</div>
<div class="card">
    <div class="card-body">
        <div class="row gx-5">
            <aside class="col-lg-3 border-end">
                <nav class="nav nav-pills flex-lg-column mb-4">
                    <a onclick="history.back()"><i class="material-icons md-arrow_back"></i> Kembali </a>
                </nav>
            </aside>
            <div class="col-lg-9">
                <section class="content-body p-xl-4">
                    <form method="POST" action="{{ route('user.profile.update') }}" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="row gx-3">
                                    <div class="col-6 mb-3">
                                        <label class="form-label">Nama</label>
                                        <input type="text" class="form-control" name="nama" value="{{ $user->nama }}" />
                                    </div>
                                    <div class="col-6 mb-3">
                                        <label class="form-label">Email</label>
                                        <input class="form-control" type="email" name="email" value="{{ $user->email }}" />
                                    </div>
                                    <div class="col-6 mb-3">
                                        <label class="form-label">No.Telp</label>
                                        <input class="form-control" type="text" name="no_telp" value="{{ $user->no_telp }}" />
                                    </div>
                                    <div class="col-6 mb-3">
                                        <label class="form-label">No.WA</label>
                                        <input class="form-control" type="text" name="no_wa" value="{{ $user->no_wa }}" />
                                    </div>
                                    <div class="col-lg-6 mb-3">
                                        <label class="form-label">Password Lama</label>
                                        <input class="form-control" type="password" name="old_password" placeholder="Masukkan Password lama" />
                                    </div>
                                    <div class="col-lg-6 mb-3">
                                        <label class="form-label">Password baru</label>
                                        <input class="form-control" type="password" name="password" placeholder="Masukkan Password baru" />
                                    </div>
                                    <div class="col-lg-12 mb-3">
                                        <label class="form-label">Alamat</label>
                                        <input class="form-control" type="text" name="alamat" value="{{ $user->alamat }}" />
                                    </div>
                                </div>
                            </div>
                            <aside class="col-lg-4">
                                <figure class="text-lg-center">
                                    <img id="previewImg" class="img-lg mb-3 img-avatar" src="{{ $user->img ?? asset('assets/imgs/people/avatar-1.png') }}" alt="User Photo" />
                                    <figcaption>
                                        <a class="btn btn-light rounded font-md" onclick="document.getElementById('inputImg').click()"> <i class="icons material-icons md-backup font-md"></i> Upload </a>
													 <input type="file" name="inputImg" id="inputImg" value="{{ $user->image }}" hidden/>
                                    </figcaption>
                                </figure>
                            </aside>
                        </div>
                        <br />
                        <button class="btn btn-primary" type="submit">Save changes</button>
                    </form>
                </section>
            </div>
        </div>
    </div>
</div>

<script>
	document.getElementById('inputImg').addEventListener('change', function(event) {
		 var input = event.target;
		 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  reader.onload = function(e) {
					var previewImage = document.getElementById('previewImg');
					previewImage.src = e.target.result;
			  }
			  reader.readAsDataURL(input.files[0]);
		 }
	});
</script>
@endsection
