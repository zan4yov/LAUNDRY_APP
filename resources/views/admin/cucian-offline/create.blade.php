<form action="{{ route('admin.cucian-offline.store.confirmation') }}" method="GET">
    <div class="modal fade text-left" id="modalCreateCucian" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <section class="content-main">
                        <div class="row">
                            <div class="col-12">
                                <div class="content-header">
                                    <h2 class="content-title">Tambah Order Cucian Offline</h2>
                                    <div>
                                        <button class="btn btn-md rounded font-sm hover-up">Tambah</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="mb-4">
                                            <label for="product_title" class="form-label">Atas Nama</label>
                                            <input type="text" placeholder="Masukkan Nama Pelanggan" class="form-control" id="atas_nama" name="atas_nama" value="{{ old('atas_nama') }}" />
														  @error('atas_nama')
															<p class="text-danger">{{ $message }}</p>
														  @enderror
                                        </div>
                                        <div class="mb-4">
                                            <label for="product_title" class="form-label">Alamat Antar</label>
                                            <input type="text" placeholder="Masukkan Alamat Pengantaran" class="form-control" id="alamat_antar" name="alamat_antar" value="{{ old('alamat_antar') }}" />
														  @error('alamat_antar')
															<p class="text-danger">{{ $message }}</p>
														  @enderror
                                        </div>
                                        <div class="mb-4">
                                            <label for="product_title" class="form-label">No. Telp</label>
                                            <input type="text" placeholder="Masukkan No. Telp" class="form-control" id="no_telp" name="no_telp" value="{{ old('no_telp') }}"/>
														  @error('no_telp')
															<p class="text-danger">{{ $message }}</p>
														  @enderror
                                        </div>
                                        <div class="mb-4">
                                            <label for="product_title" class="form-label">No. Wa</label>
                                            <input type="text" placeholder="Masukkan No. Wa" class="form-control" id="no_wa" name="no_wa" value="{{ old('no_wa') }}" />
														  @error('no_wa')
															<p class="text-danger">{{ $message }}</p>
														  @enderror
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-body">
													<div class="mb-4">
														<label for="product_brand" class="form-label">Jenis Pengambilan</label>
														<select class="form-select" id="jenis_ambil" name="jenis_ambil">
															 <option value="" hidden>-- PILIH JENIS PENGAMBILAN --</option>
															 <option {{ old('jenis_ambil') == 'ambil sendiri' ? 'selected' : '' }} value="ambil sendiri">Ambil Sendiri</option>
															 <option {{ old('jenis_ambil') == 'diantar' ? 'selected' : '' }} value="diantar">Diantar</option>
														</select>
														@error('jenis_ambil')
														<p class="text-danger">{{ $message }}</p>
														@enderror
												  </div>
                                        <div class="mb-4">
                                            <label class="form-label">Berat</label>
                                            <input id="berat" name="berat" type="text" placeholder="Masukkan Berat Pakaian" class="form-control" value="{{ old('berat') }}" />
														  @error('berat')
															<p class="text-danger">{{ $message }}</p>
														  @enderror
                                        </div>
                                        <div class="mb-4">
                                            <label class="form-label">Kategori</label>
                                            <select class="form-select" name="kategori_id" id="kategori_id">
                                                <option value="" hidden>-- PILIH KATEGORI --</option>
                                                @foreach ($kategori as $k)
																<option {{ old('kategori_id') == $k->id ? 'selected' : '' }} value="{{ $k->id }}">{{ $k->nama}}-----IDR {{ $k->harga}}</option>
																@endforeach
                                            </select>
														  @error('kategori_id')
															<p class="text-danger">{{ $message }}</p>
														  @enderror
                                        </div>
                                    </div>
                                </div>
                                <!-- card end// -->
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</form>
