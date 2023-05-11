import { Component } from '@angular/core';
import { NavigationButton } from './typing';

@Component({
  selector: 'app-navigation-list',
  templateUrl: './navigation-list.component.html',
  styleUrls: ['./navigation-list.component.css']
})
export class NavigationListComponent {
  navLinks: NavigationButton[] = [
    {
      title: 'Dating',
      path: '/',
      iconName: "favorite"
    },
    {
      title: 'Users',
      path: '/users',
      iconName: "groupe"
    },
    {
      title: 'Messages',
      path: '/messages',
      iconName: "chat"
    },
    {
      title: 'Activity',
      path: '/activity',
      iconName: "diversity_1"
    },
    {
      title: 'Profile',
      path: '/profile',
      iconName: "person"
    },
  ];

  settingsNav: NavigationButton = {
    title: 'Settings',
    path: '/settings',
    iconName: "settings"
  }

}
