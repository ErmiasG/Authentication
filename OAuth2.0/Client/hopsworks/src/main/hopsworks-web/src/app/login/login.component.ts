import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {MatDialog} from '@angular/material';
import { AuthenticationService } from '../authentication.service';
import { first } from 'rxjs/operators';
import { EventEmitter } from 'events';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  username: string;
  password: string;
  showSpinner: boolean;
  constructor(private router: Router, private authenticationService: AuthenticationService) {
    // redirect to home if already logged in
    if (this.authenticationService.currentUserValue) {
        this.router.navigate(['user']);
    }
  }
  ngOnInit() {
  }
  login(): void {
    this.showSpinner = true;
    console.log(this.username, this.password);
    this.authenticationService.login(this.username, this.password)
    .pipe(first())
    .subscribe(
        data => {
          this.showSpinner = false;
          this.router.navigate(['user']);
        },
        error => {
          this.showSpinner = false;
        });
  }
}
