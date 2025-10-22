<?php

namespace App\Http\Controllers\Admins;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cucian;

class IndexController extends Controller
{

	public function index(Request $request)
	{
		$paginate = (int)$request->paginate ?? 15;
		$request->jenis_order ?? '';
		$request->jenis_ambil ?? '';
		$request->search ?? '';
		
		$jenis_order = $request->jenis_order;

		$cucian = Cucian::with(['kategori', 'user'])
		->where('status_cucian', 'diambil')
		->where(function ($query) use ($request) {
			$query->where('no_order', 'like', '%'.$request->search.'%')
			->orWhere('atas_nama', 'like', '%'.$request->search.'%')
			->orWhereHas('user', function ($query) use ($request) {
				$query->where('nama', 'like', '%' . $request->search . '%');
			});
		})
		->where('jenis_order', 'like', '%'.$request->jenis_order.'%')
		->where('jenis_ambil', 'like', '%'.$request->jenis_ambil.'%')
		->orderBy('updated_at','desc')
		->paginate($paginate)->withQueryString();

		return view('admin.dashboard.index', compact('cucian', "jenis_order"));
	}

	public function detail($no_order)
	{
		$detail = Cucian::where('no_order', $no_order)->first();
		$jenis_order = $detail->jenis_order;
		return view('admin.dashboard.detail', compact('detail', 'jenis_order'));
	}
}
