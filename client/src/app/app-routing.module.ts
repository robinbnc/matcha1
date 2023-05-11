import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DatingComponent } from './pages/dating/dating.component';
import { ProfileComponent } from './pages/profile/profile.component';

const routes: Routes = [
  { path: '', component: DatingComponent },
  { path: 'profile', component: ProfileComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
