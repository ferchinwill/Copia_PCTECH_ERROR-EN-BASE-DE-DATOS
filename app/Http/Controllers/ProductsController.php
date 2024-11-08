
<?php

namespace App\Http\Controllers;

use App\Models\Producto; // Esto se debe colocar después del namespace
use App\Models\Categoria;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function index()
    {
        // Obtener todos los productos con su categoría relacionada
        $products = Producto::with('categoria')->get();
        
        // Pasar los productos a la vista
        return view('ProductosCards.test', ['products' => $products]);
    }


    

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // Aquí podrías mostrar un formulario para agregar productos
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Guardar un nuevo producto
        $product = new Producto();
        $product->Nombre = $request->Nombre;
        $product->Descripcion = $request->Descripcion;
        $product->Precio = $request->Precio;
        $product->Stock = $request->Stock;
        $product->ID_Categoria = $request->ID_Categoria;
        $product->save();

        return redirect()->route('productos.index');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Mostrar un producto específico con su categoría
        $product = Producto::with('categoria')->findOrFail($id);
        return view('productos.show', ['product' => $product]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        // Mostrar formulario para editar un producto
        $product = Producto::findOrFail($id);
        return view('productos.edit', ['product' => $product]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        // Actualizar el producto
        $product = Producto::findOrFail($id);
        $product->update($request->all());

        return redirect()->route('productos.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        // Eliminar un producto
        $product = Producto::findOrFail($id);
        $product->delete();

        return redirect()->route('productos.index');
    }
}
