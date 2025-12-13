
import 'package:notebook/model/notes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';


class NoteService {
  Database? _db;
  static final _shared = NoteService._sharedInstance();
  NoteService._sharedInstance();
  factory NoteService() => _shared;
  Future<Database> get database async => _db ??= await open();

//delet all
  Future<int> deleteAll () async {
    final db = await _shared.database;
    final rows = await db.delete(noteTable);
    return rows;
  }

//update note
  Future<int> update({required Notes notes}) async {
    final db = await _shared.database;
    final rows = await db.update(
        noteTable,
        notes.toMap(),
        where: "id=?",
        whereArgs: [notes.id]
    );
    return rows;
  }


//delete note
  Future<int> deleteNote({required int id}) async {
    final db = await _shared.database;
    final rows = await db.delete(
      noteTable,
      where: "id=?",
      whereArgs: [id],
    );
    return rows;
  }


//get note
  Future<Notes> getNote({required int id}) async {
    final db = await _shared.database;
    final notes = await db.query(
      noteTable,
      limit: 1,
      where: "id=?",
      whereArgs: [id],
    );
    final note = Notes.fromMap(map: notes.first);
    return note;
  }

//get notes
  Future<List<Notes>> getNotes() async {
    final db = await _shared.database;
    final notes = await db.query(noteTable, orderBy: idColumn);
    final notesList = notes.map((map) => Notes.fromMap(map: map)).toList();
    return notes.isEmpty ? [] : notesList;
  }

  Future<int> insert({required Notes notes}) async {
    final db = await _shared.database;
    final rows = await db.insert(noteTable, notes.toMap());
    return rows;

  }
  //open function
  Future<Database> open() async {
    final docPath = await getApplicationDocumentsDirectory();
    final dbPath = join(docPath.path, dbName);
    final db = await openDatabase(dbPath);

    db.execute(createTable);
    _db = db;
    return db;

  }
}

const dbName = "notes.db";
const noteTable = "notes";

//fields

const idColumn = "id";
const titleColumn = "title";
const textColumn = "text";
const datetimeColumn = "datetime";

const createTable = ''' CREATE TABLE IF NOT EXISTS "notes" (
  "id" INTEGER NOT NULL,
  "title" TEXT,
  "text" TEXT,
  "datetime" TEXT,
  PRIMARY KEY("id" AUTOINCREMENT)
)''';