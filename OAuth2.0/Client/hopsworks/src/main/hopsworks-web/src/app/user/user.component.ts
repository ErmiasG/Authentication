import { Component, OnInit } from '@angular/core';
import { first } from 'rxjs/operators';
import {User} from '../user';
import {UserService} from './user.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  private user: User;
  constructor(private userService: UserService) { }

  ngOnInit() {
    this.userService.getUser().pipe(first())
    .subscribe(
        data => {
          console.log(data);
          this.user = data;
        },
        error => {
        });
  }

}
