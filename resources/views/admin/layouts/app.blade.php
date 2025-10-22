@include('admin.layouts.sidebar')
@include('admin.layouts.header')

@yield('content')

@include('admin.layouts.footer')

@if (session('success'))
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			sessionSuccess('{{ session('success') }}')
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="{{ asset('admins/js/notification-confirmation.js') }}"></script>