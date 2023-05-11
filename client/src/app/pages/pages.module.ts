import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../shared/shared.module';
import { PagesComponent } from './pages.component';
import { RouterModule } from '@angular/router';
import { DatingComponent } from './dating/dating.component';
import { ProfileComponent } from './profile/profile.component';
import { ImageSliderComponent } from './dating/image-slider/image-slider.component';
import { DatingButtonComponent } from './dating/dating-button/dating-button.component';

@NgModule({
  declarations: [
    PagesComponent,
    DatingComponent,
    ProfileComponent,
    ImageSliderComponent,
    DatingButtonComponent,
  ],
  imports: [
    CommonModule,
    SharedModule,
    RouterModule
  ],
  exports: [
    PagesComponent,
  ],
})
export class PagesModule { }
