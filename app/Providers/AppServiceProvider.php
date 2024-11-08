<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Blade; // Mover esto aquí

class AppServiceProvider extends ServiceProvider
{
    
    public function register(): void
    {
    
    }

   
    public function boot(): void   ///importamos la primera navbar
    {

        //para hacer funcuinar  el @include es necesario tener en cuenta la  ruta de la vista y  el nombre de la vista
        //para hacer funcionar el @component  es necesario tener en cuenta la ruta de la vista y el nombre de la vista

        Blade::include('includes.navbar', 'navbar'); 
        Blade::include('includes.navbar', 'navbar2'); 
        Blade::include('includes.Carousel', 'carousel');
        Blade::include('includes.Carousel', 'carouselMarcas');
        Blade::include('includes.ListProductos', 'ListProductos');
        Blade::include('includes.TestCards', 'TestCards');
        
        
       // Blade::include('includes.productos','productos' );     // Esta seccion esta en pausa para poder desarrollarla en un futuro 
    }
}


