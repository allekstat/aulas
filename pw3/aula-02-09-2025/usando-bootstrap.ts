import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-usando-bootstrap',
  imports: [FormsModule, CommonModule],
  templateUrl: './usando-bootstrap.html',
  styleUrl: './usando-bootstrap.css'
})
export class UsandoBootstrap {
nome : string;
idade : number = null;
cidade : string;
inserir()
{
    return 1;
}
}
