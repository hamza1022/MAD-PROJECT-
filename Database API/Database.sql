

package com.practice.a18321519_142;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

public class DBHelper extends SQLiteOpenHelper {
    private static final String dbname="dbcontact";

    public DBHelper(@Nullable Context context)
    {
        super(context, dbname, null, 1);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase)
    {
        String qry="create table tbl_contact ( id integer primary key autoincrement, name text,father text, contact text, email text,age text)";
        sqLiteDatabase.execSQL(qry);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1)
    {
        String qry="DROP TABLE IF EXISTS tbl_contact";
        sqLiteDatabase.execSQL(qry);
        onCreate(sqLiteDatabase);
    }

    public  String addrecord(String name, String father,String contact, String email,String age)
    {
        SQLiteDatabase db=this.getWritableDatabase();

        ContentValues cv=new ContentValues();
        cv.put("name",name);
        cv.put("father",father);
        cv.put("contact",contact);
        cv.put("email",email);
        cv.put("age",age);
        float res=db.insert("tbl_contact",null,cv);

        if(res==-1)
            return "Failed";
        else
            return  "Successfully inserted";

    }
    public Integer deleteuserList (Integer id) {
        SQLiteDatabase db = this.getWritableDatabase();
        return db.delete("tbl_contact",
                "id = ? ",
                new String[] { Integer.toString(id) });
    }

    public boolean updateContact (Integer id, String name, String father, String contact, String email,String age) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("name", name);
        contentValues.put("contact", contact);
        contentValues.put("father", father);
        contentValues.put("email", email);
        contentValues.put("age", age);
        db.update("tbl_contact", contentValues, "id = ? ", new String[] { Integer.toString(id) } );
        return true;
    }

    public Cursor readalldata()
    {
        SQLiteDatabase db=this.getWritableDatabase();
        String qry="select * from tbl_contact order by id desc";
        Cursor cursor=db.rawQuery(qry,null);
        return  cursor;
    }
}


