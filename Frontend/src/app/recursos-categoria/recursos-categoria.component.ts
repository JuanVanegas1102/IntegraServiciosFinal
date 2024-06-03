import { Component } from '@angular/core';
import { SeleccionCategoriaService } from '../seleccion-categoria.service';

@Component({
  selector: 'app-recursos-categoria',
  templateUrl: './recursos-categoria.component.html',
  styleUrl: './recursos-categoria.component.css'
})
export class RecursosCategoriaComponent {
  
  message: string = '';

  constructor(private seleccionCategoria: SeleccionCategoriaService){

  }
  
  ngOnInit(): void {
    this.seleccionCategoria.currentMessage.subscribe(message => this.message = message);
  }
  
  scrollTo(section: string) {
    document.getElementById(section)?.scrollIntoView({ behavior: 'smooth' });
  }
}
