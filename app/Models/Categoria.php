// app/Models/Categoria.php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;

    // Si la tabla en la base de datos no se llama "categorias", puedes especificar el nombre de la tabla
    protected $table = 'categorias';

    // Relación inversa con el modelo Producto
    public function productos()
    {
        return $this->hasMany(Producto::class);
    }
}
