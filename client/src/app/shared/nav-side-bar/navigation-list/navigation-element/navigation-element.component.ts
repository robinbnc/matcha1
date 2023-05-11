import { Component, Input, OnInit } from '@angular/core';
import { NavigationButton } from '../typing';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navigation-element',
  templateUrl: './navigation-element.component.html',
  styleUrls: ['./navigation-element.component.css']
})
export class NavigationElementComponent implements OnInit {
  @Input()
  navigationButton!: NavigationButton;

  constructor(public router: Router) { }

  ngOnInit(): void {
      console.log(this.router.url)
  }
}
