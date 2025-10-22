@include('users.layouts.header')

@yield('content')

@include('users.layouts.footer')

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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>