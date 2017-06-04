package com.leet.note;

import java.util.List;

public interface INote {
	void saveNote(Note note);//保存新的笔记
	void updateNote(Note note);//更新笔记
	void deleteNote(int note_id);//删除笔记
	List<Note> queryNote(String title);//根据题目查询符合条件的笔记
	Note querySingleNote(String title);//查询单个笔记
	Note queryViaId(int id);//根据id查询笔记
	List<String> queryNote(String title,String username);//根据题目和用户查询符合条件的笔记
}
