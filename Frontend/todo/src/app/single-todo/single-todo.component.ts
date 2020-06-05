import { ActivatedRoute, Router, ParamMap } from '@angular/router';
import { TodoService } from 'src/app/services/todo.service';
import { TodoModel } from './../model/todo.model';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-single-todo',
  templateUrl: './single-todo.component.html',
  styleUrls: ['./single-todo.component.css']
})
export class SingleTodoComponent implements OnInit {

  public todo: TodoModel;
  private todoId: number;

  constructor(
    private todoService: TodoService,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    // this.todo = this.todoService.getTodo();
    this.route.paramMap.subscribe((params: ParamMap) => {
      this.todoId = parseInt(params.get('id'), 10)
    });

    const link = 'http://localhost:8080/todo/' + this.todoId;
    this.todoService.getSingleTodo(link).subscribe((responce) => {
      this.todo = responce;
    });
  }

}
