<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Washwes - User</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta property="og:title" content="" />
        <meta property="og:type" content="" />
        <meta property="og:url" content="" />
        <meta property="og:image" content="" />
        <!-- Favicon -->
        <link rel="icon" href="{{ asset('admins') }}/imgs/theme/washwes.png" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Template CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="{{ asset('admins') }}/css/main.css?v=1.1" rel="stylesheet" type="text/css" />
    </head>

<main class="main">
    <header class="main-header navbar">
			<a href="/" class="navbar-brand p-0">
				<h1 class="m-0 text-primary">Washwes</h1>
				<!-- <img src="img/logo.png" alt="Logo"> -->
		  </a>
		  @auth
				@if (auth()->user()->role == 'pelanggan')
					<div class="col-nav">
						<button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"><i class="material-icons md-apps"></i></button>
						<ul class="nav">
							<li class="dropdown nav-item">
								<a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownAccount" aria-expanded="false"> <img class="img-xs rounded-circle" src="{{ auth()->user()->img ?? asset('admins/imgs/people/avatar-2.png') }}" alt="User" /></a>
								<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownAccount">
									<a class="dropdown-item" href="{{ route('user.profile') }}"><i class="material-icons md-perm_identity"></i>Profile</a>
									<a class="dropdown-item" href="{{ route('user.index') }}"><i class="material-icons md-receipt"></i>Order</a>
									<div class="dropdown-divider"></div>
									<form onsubmit="submitLogout(this, event)" action="{{ route('logout') }}" method="POST">
										@method('DELETE')
										@csrf
										<button class="dropdown-item text-danger" href="#"><i class="material-icons md-exit_to_app"></i>Logout</button>
									</form>
								</div>
							</li>
						</ul>
					</div>
				@elseif(auth()->user()->role == 'admin')
					<div class="col-nav">
						<button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside"><i class="material-icons md-apps"></i></button>
						<ul class="nav">
							<li class="dropdown nav-item">
								<a class="dropdown-toggle" data-bs-toggle="dropdown" href="#" id="dropdownAccount" aria-expanded="false"> <img class="img-xs rounded-circle" src="{{ asset('admins') }}/imgs/people/avatar-2.png" alt="User" /></a>
								<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownAccount">
									<a class="dropdown-item" href="{{ route('admin.index') }}"><i class="material-icons md-dashboard"></i>Dashboard</a>
										<a class="dropdown-item" href="{{ route('admin.profile') }}"><i class="material-icons md-perm_identity"></i>Profile</a>
										<div class="dropdown-divider"></div>
										<form onsubmit="submitLogout(this, event)" action="{{ route('logout') }}" method="POST">
											@method('DELETE')
											@csrf
											<button type="submit" class="dropdown-item text-danger cursor-pointer"><i class="material-icons md-exit_to_app"></i>Logout</button>
										</form>
								</div>
							</li>
						</ul>
					</div>
				@endif
		 	@else
			 <div class="nav-item">
				<a href="{{ route('login') }}" class="btn btn-primary rounded-pill py-2 px-5 text-white">Login</a>
			</div>
		  @endauth
    </header>

	 <script>
		function submitLogout(element, event){
			event.preventDefault()
			Swal.fire({
				title: `Logout`,
				text: "Anda Akan Keluar Aplikasi",
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