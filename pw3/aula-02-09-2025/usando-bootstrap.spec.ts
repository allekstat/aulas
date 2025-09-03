import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UsandoBootstrap } from './usando-bootstrap';

describe('UsandoBootstrap', () => {
  let component: UsandoBootstrap;
  let fixture: ComponentFixture<UsandoBootstrap>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [UsandoBootstrap]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UsandoBootstrap);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
