import { Component } from '@angular/core';
import {Router} from '@angular/router';
import { AuthenticationService } from './authentication.service';
import { first } from 'rxjs/operators';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'hopsworks-web';
  constructor(private router: Router, private authenticationService: AuthenticationService) {
    // redirect to home if already logged in
  }
  logout(): void {
    this.authenticationService.logout()
    .pipe(first()).subscribe(
      data => {
        this.router.navigate(['/']);
      },
      error => {
        this.router.navigate(['/']);
      });
  }
}
