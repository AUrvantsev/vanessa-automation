﻿# language: ru

Feature: Пример как программно записать элемент а потом открыть его навигационную ссылку.

Scenario: Пример как программно записать элемент а потом открыть его навигационную ссылку.

	And I execute 1C:Enterprise script at server
		"""bsl
		НавигационнаяСсылка = ПолучитьНавигационнуюСсылку(Справочники.ИмяСправочника.НайтиПоКоду("$КодОбъекта$"));
		Объект.ЗначениеНаСервере = НавигационнаяСсылка;
		"""
	
	And I execute 1C:Enterprise script
		"""bsl
		Контекст.Вставить("MyVariable", Ванесса.Объект.ЗначениеНаСервере);
		"""
	
	Given I open hyperlink "$MyVariable$"

