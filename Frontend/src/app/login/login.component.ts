import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  formularioRegistro: FormGroup;
  hayError: boolean = false;
  mensajeError:string;
  responseCode:number;

  constructor(private http: HttpClient, private fb: FormBuilder, private router: Router) {

  }

  ngOnInit() {
    this.crearFormularioRegistro();
  }

  registrarse(){
    const datosFormularioRegistro = {
      nombre:this.formularioRegistro.value.nombre,
      telefono: this.formularioRegistro.value.telefono,
      correoElectronico: this.formularioRegistro.value.correoElectronico,
      contrasena: this.formularioRegistro.value.contrasena
    }
    console.log(datosFormularioRegistro);
  }

  crearFormularioRegistro() {
    this.formularioRegistro = this.fb.group({
      nombre: ['', Validators.required],
      telefono: ['', Validators.required],
      correoElectronico: ['', Validators.required],
      contrasena: ['', Validators.required]
    })
  }
}
