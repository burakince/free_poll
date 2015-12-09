library free_poll.data_grid_component;

import 'package:angular2/angular2.dart' show Component, NgFor, View;

@Component(
    selector: 'data-grid', inputs: const ['rows: rows', 'columns: columns'])
@View(
    template: '''
    <table class="table table-striped">
      <thead>
        <tr>
          <td *ng-for="#col of columns">
            <a (click)="sort(col.name)">{{col.descr}}</a>
          </td>
        </tr>
      </thead>
      <tbody>
        <tr *ng-for="#row of rows">
          <td *ng-for="#col of columns">{{row[col.name]}}</td>
        </tr>
      </tbody>
    </table>
    ''',
    styles: const [r'''
    thead {
      color: tomato;
    }
    thead tr td:hover {
      text-decoration: underline;
      cursor: pointer;
    }
    '''],
    directives: const [NgFor])
class DataGrid {
  List<Column> columns = [
    new Column('firstName', 'First Name'),
    new Column('lastName', 'Last Name'),
    new Column('age', 'Age')
  ];
  List<Map> rows = [
    {'firstName': 'Joe', 'lastName': 'Jackson', 'age': 30},
    {'firstName': 'Peter', 'lastName': 'Smith', 'age': 20},
    {'firstName': 'Jane', 'lastName': 'Doe', 'age': 50},
    {'firstName': 'Bob', 'lastName': 'Smith', 'age': 80}
  ];

  Sorter sorter = new Sorter();

  sort(String key) {
    sorter.sort(key, rows);
  }
}

class Column {
  String name, descr;

  Column(this.name, this.descr);
}

class Sorter {
  num direction = 1;
  String key;

  sort(String key, List<Map> data) {
    if (this.key == key) {
      direction = -direction;
    } else {
      this.direction = 1;
    }

    this.key = key;

    data.sort((a, b) => direction * a[key].compareTo(b[key]));
  }
}