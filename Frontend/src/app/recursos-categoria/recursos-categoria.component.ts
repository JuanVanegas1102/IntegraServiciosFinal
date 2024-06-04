import { Component } from '@angular/core';
import { SeleccionCategoriaService } from '../seleccion-categoria.service';
import { AdminService } from '../admin.service';
import { FormBuilder } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { categoriaSeleccionadaResponse } from '../modelos/responses';

@Component({
  selector: 'app-recursos-categoria',
  templateUrl: './recursos-categoria.component.html',
  styleUrl: './recursos-categoria.component.css'
})
export class RecursosCategoriaComponent {
  
  listaRecursos : Array<any>
  message: string = ''

  constructor(private http : HttpClient,private  fb:FormBuilder, private router:Router, private adminServicio:AdminService, private seleccionCategoria:SeleccionCategoriaService){

  }
  
  ngOnInit(): void {
    if(this.adminServicio.hayUsuarioLogeado){
      this.router.navigate(['/recursos-categoria'])
    }else{
      this.router.navigate(['/login'])
    }
    this.seleccionCategoria.currentMessage.subscribe(message => this.message = message);
    this.http.get<categoriaSeleccionadaResponse>("http://127.0.0.1:8000/listaCategoriaSeleccionada").subscribe(
      {
        next:(res)=>{
          this.listaRecursos = res.data
          console.log(this.listaRecursos)
        },
        error: (error) => {
          console.log(error)
        }
      })
  }
  
  scrollTo(section: string) {
    document.getElementById(section)?.scrollIntoView({ behavior: 'smooth' });
  }

  reservar(dato:string){
    console.log(dato)
  }
}
