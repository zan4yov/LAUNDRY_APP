<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Cucian extends Model
{
	use HasFactory;
	protected $table = 'cucian';
	protected $guarded = [];

	public function user(): BelongsTo
	{
		return $this->belongsTo(User::class, 'user_id');
	}

	public function kategori(): BelongsTo
	{
		return $this->belongsTo(Kategori::class, 'kategori_id');
	}
}
