import { Component, EventEmitter, Output } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-person-form',
  standalone: true,
  templateUrl: './person-form.component.html',
  styleUrls: ['./person-form.component.css'],
  imports: [ReactiveFormsModule]
})
export class PersonFormComponent {
  employeeForm: FormGroup;

  @Output() employeeAdded = new EventEmitter<any>();

  constructor(private fb: FormBuilder) {
    this.employeeForm = this.fb.group({
      firstName: [''],
      lastName: [''],
      designation: [''],
      skills: [''],
      salary: [''],
      dateOfJoining: ['']
    });
  }

  onSubmit() {
    this.employeeAdded.emit(this.employeeForm.value);
    this.employeeForm.reset();
  }
}
