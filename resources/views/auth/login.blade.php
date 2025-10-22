<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Masuk - Washwes</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta property="og:title" content="" />
        <meta property="og:type" content="" />
        <meta property="og:url" content="" />
        <meta property="og:image" content="" />
        <!-- Favicon -->
        <link rel="icon" href="{{ asset('admins') }}/imgs/theme/washwes.png" />
        <!-- Template CSS -->
        <link href="{{ asset('admins') }}/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
    </head>

    <body>
		
        <main>
			@if (session('success'))
				<script>
					document.addEventListener('DOMContentLoaded', function() {
						Swal.fire({
							position: "center",
							icon: "success",
							title: '{{ session("success") }}',
							showConfirmButton: false,
							timer: 2000
						});
					});
				</script>
			@elseif(session('error'))
			<script>
				document.addEventListener('DOMContentLoaded', function() {
					Swal.fire({
					icon: "error",
					title: "{{ session('error') }}",
					});
				})
			</script>
			@endif
			<section class="content-main mt-40 mb-80">
					<a href="/" class="p-0 m-0">
						<h1 class="p-0 m-0">Washwes</h1>
					 </a>
				<div class="card mx-auto card-login">
					 <div class="card-body">
						  <h4 class="card-title mb-4">Login</h4>
						  <form action="{{ route('login.store') }}" method="POST">
							@csrf
								<div class="mb-3">
									 <label class="form-label">Email</label>
									 <input name="email" value="{{ old('email') }}" class="form-control" placeholder="emailmu@mail.com" type="text" />
									 @error('email')
										<p class="text-danger">{{ $message }}</p>
									 @enderror
								</div>
								<div class="mb-3">
									 <label class="form-label">Password</label>
									 <input name="password" value="{{ old('password') }}" class="form-control" placeholder="******" type="password" />
									 @error('password')
									 <p class="text-danger">{{ $message }}</p>
								 	 @enderror
								</div>
								<div class="mb-3">
									<label class="form-check">
										 <input type="checkbox" class="form-check-input" name="remember" />
										 <span class="form-check-label">Remember</span>
									</label>
							  </div>
								<div class="mb-3">
									 <button type="submit" class="btn btn-primary">Masuk</button>
								</div>
						  </form>
						  <p class="text-center mb-2">Belum punya akun? <a href="{{ route('register') }}">daftar sekarang</a></p>
					 </div>
				</div>
		  </section>
        </main>
        <script src="{{ asset('admins') }}/js/vendors/jquery-3.6.0.min.js"></script>
        <script src="{{ asset('admins') }}/js/vendors/bootstrap.bundle.min.js"></script>
        <script src="{{ asset('admins') }}/js/vendors/jquery.fullscreen.min.js"></script>
        <!-- Main Script -->
        <script src="{{ asset('admins') }}/js/main.js?v=1.1" type="text/javascript"></script>
		  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </body>
</html>
