<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Kategori;
use DB;
use App\Http\Resources\KategoriResource;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Validator;

class KategoriController extends Controller
{
    //
    public function index() {
        $kategori = DB::table('kategori')->orderBy('updated_at', 'desc')->get();
        return new KategoriResource(true, 'Data Kategori', $kategori);
    }

    public function show($id) {
        $kategori = DB::table('kategori')->where('id', $id)->orderBy('updated_at', 'desc')->first();
        if ($kategori) {
            return new KategoriResource(true, 'Data Kategori', $kategori);
        } else {
            return response([
                'success' => false,
                'message' => 'Kategori Tidak Ditemukan',
            ], 404);
        }
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(),[
            'nama' => 'required',
			'harga' => 'required',
			'estimasi_hari' => 'required',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }
        $kategori = Kategori::create([
            'nama'=> $request->nama,
			'harga'=> $request->harga,
			'estimasi_hari'=> $request->estimasi_hari,
        ]);
        return new KategoriResource(true, 'Data berhasil ditambahkan', $kategori);
    }

    public function update(Request $request, $id) {
        $validator = Validator::make($request->all(),[
            'nama' => 'required',
			'harga' => 'required',
			'estimasi_hari' => 'required',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }
        $kategori = Kategori::whereId($id)->update([
            'nama'=> $request->nama,
			'harga'=> $request->harga,
			'estimasi_hari'=> $request->estimasi_hari,
        ]);
        return new KategoriResource(true, 'Data berhasil diubah', $kategori);
    }

    public function destroy($id) {
        $kategori = Kategori::whereId($id)->first();
        $kategori->delete();
        return new KategoriResource(true, 'Data berhasil dihapus', $kategori);
    }
}
