import { Component } from '@angular/core';
import { PersonFormComponent } from './person-form/person-form.component';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  imports: [PersonFormComponent, CommonModule]
})
export class AppComponent {
  employees: any[] = [];

  addEmployee(employee: any) {
    this.employees.push(employee);
  }
}
