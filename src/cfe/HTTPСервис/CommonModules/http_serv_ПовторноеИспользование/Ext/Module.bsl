﻿Функция ПолучитьТаблицуСтатическихДанных(НаименованиеУзла) Экспорт
	
	ТаблицаСтатическихДанных = Новый ТаблицаЗначений;
	ТаблицаСтатическихДанных.Колонки.Добавить("ИмяФайла", Новый ОписаниеТипов("Строка"));
	ТаблицаСтатическихДанных.Колонки.Добавить("АдресВХранилище", Новый ОписаниеТипов("Строка"));
	
	Узел = ПолучитьУзел(НаименованиеУзла);
	
	Если Не ЗначениеЗаполнено(Узел) Тогда
		Возврат ТаблицаСтатическихДанных;
	КонецЕсли;
	
	ИмяАрхивногоФайла = ПолучитьИмяВременногоФайла("zip");
	
	ДвоичныеДанные = Узел.СтатичныеДанные.Получить();
	ДвоичныеДанные.Записать(ИмяАрхивногоФайла);
	
	ПапкаНазначения = КаталогВременныхФайлов() + Строка(Новый УникальныйИдентификатор) + "\";
	
	ЧтениеZIP = Новый ЧтениеZipФайла(ИмяАрхивногоФайла);
	ЧтениеZIP.ИзвлечьВсе(ПапкаНазначения, РежимВосстановленияПутейФайловZIP.НеВосстанавливать);
	
	МассивФайлов = НайтиФайлы(ПапкаНазначения,"*", Истина);
	
	Для Каждого СтрИмяФайла Из МассивФайлов Цикл
		
		ДвоичныеДанные = Новый ДвоичныеДанные(СтрИмяФайла.ПолноеИмя);
		
		СтрСт = ТаблицаСтатическихДанных.Добавить();
		СтрСт.ИмяФайла = СтрЗаменить(СтрИмяФайла.ПолноеИмя, ПапкаНазначения, "");
		СтрСт.АдресВХранилище = ПоместитьВоВременноеХранилище(ДвоичныеДанные, Новый УникальныйИдентификатор)
		
		
	КонецЦикла;
	ТаблицаСтатическихДанных.Индексы.Добавить("ИмяФайла");
	
	УдалитьФайлы(ИмяАрхивногоФайла);
	УдалитьФайлы(ПапкаНазначения);
	
	Возврат ТаблицаСтатическихДанных;
	
КонецФункции

Функция ПолучитьОбработчики(НаименованиеУзла) Экспорт
КонецФункции

Функция ПолучитьУзел(Наименование) Экспорт
	
	Возврат Справочники.http_serv_НастройкиПодсистемы.НайтиПоРеквизиту("КорневойАдрес", Наименование);
	
КонецФункции
