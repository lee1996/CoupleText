package com.leet.note;

import java.util.List;

public interface INote {
	void saveNote(Note note);//保存新的笔记
	void updateNote(Note note);//更新笔记
	void deleteNote(String note_id);//删除笔记
	List<Note> queryNote(String title);//根据题目查询符合条件的笔记
	Note querySingleNote(String title);//查询单个笔记
	int noteSize();//查询笔记的总数
	
}
