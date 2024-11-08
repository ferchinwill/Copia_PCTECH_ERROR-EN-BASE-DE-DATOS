// app/Models/Producto.php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    // Si la tabla en la base de datos no se llama "productos", puedes especificar el nombre de la tabla
    protected $table = 'productos';

    // Relaciones con otras tablas (Ejemplo: Categoria)
    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }
}
