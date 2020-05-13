import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { environment } from '../../environments/environment';
import { User } from '../user';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  constructor(private http: HttpClient) { }

  getUser() {
    return this.http.get<any> (`${environment.apiUrl}/protected`).pipe(map(user => {
      return user;
     }));
  }
}
