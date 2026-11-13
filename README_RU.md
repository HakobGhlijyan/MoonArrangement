# ArrangementView на iPhone Duo — разбор и демо-проект

Источник идеи: статья Natalia Panferova, «ArrangementView in SwiftUI: split and overlay layouts for iPhone Duo»
(https://nilcoalescing.com/blog/ArrangementViewInSwiftUISplitAndOverlayLayoutsForIPhoneDuo/).
Ниже — не перевод, а мой собственный конспект API и привязка к файлам проекта. Скриншоты из статьи смотрите
в оригинале (они принадлежат автору); проект воспроизводит те же экраны кодом.

Требования: iOS 27.1+ (минимальная версия уже стоит в проекте), Xcode 27.1+. API (`ArrangementView` и модификаторы) описан по статье;
сборку и сверку с документацией Apple я не выполнял — проверьте у себя.

## Идея

`ArrangementView` получает два вида — `primary` и `secondary` — и сам решает, как их расположить
с учётом доступного места и положения сгиба: на внешнем экране друг под другом, на внутреннем рядом,
при частичном сгибе — по разные стороны сгиба. Он отвечает только за раскладку: заголовок, toolbar
и навигация остаются за `NavigationStack` снаружи. Не кладите `ArrangementView` в `List`/`ScrollView`.

## Два стиля

**split** — делит место, виды не перекрывают друг друга. `automatic` разрешается именно в него.
**overlay** — `primary` лежит поверх `secondary`; при сгибе виды расходятся.
Оба стиля умеют `.axes(...)` — ограничивают направления деления/расхождения.

## Карта: что где смотреть

| # | Демо (файл) | Что показывает |
|---|---|---|
| 1 | `01_DefaultArrangementDemo` | автоматический split на всех положениях |
| 2 | `02_HorizontalSplitDemo` | `.split.axes(.horizontal)` — на внешнем экране остаётся один primary |
| 3 | `03_SplitRatioDemo` | `splitArrangementLayoutRatio(0.4)` |
| 4 | `04_SplitAxisRatioDemo` | отдельные min/ideal/max для ширины и идеал для высоты |
| 5 | `05_FixedSizeSplitDemo` | `splitArrangementFixedLayoutSize()` — размер по контенту |
| 6 | `06_AdaptiveSplitAxisDemo` | `@Environment(\.splitArrangementAxis)`: лента или список |
| 7 | `07_OverlayDemo` | карточка поверх луны, разъезд при сгибе |
| 8 | `08_OverlayVerticalAxisDemo` | `.overlay.axes(.vertical)` — виды остаются поверх сгиба |
| 9 | `09_OverlayEdgeDemo` | `overlayArrangementEdge(_:)` |
| 10 | `10_OverlayZIndexDemo` | `@Environment(\.overlayArrangementZIndex)`: карточка → детали |
| 11 | `11_SideBySideStyleDemo` | собственный `ArrangementViewStyle` |

Запуск: `MoonCatalogView` — меню внизу переключает демо; у каждого файла есть Light/Dark превью.

## Важные нюансы (по наблюдениям автора на Xcode 27.1)

- Модификаторы размеров — это **пожелания**: вид не сжимается меньше контента, а при частичном сгибе
  раскладка всё равно следует сгибу.
- Читать `splitArrangementAxis` и `overlayArrangementZIndex` напрямую в замыкании не работало
  (значения были `nil`/`0`) — нужна обёртка (`ZStack`). В новых релизах может быть исправлено.
- `overlayArrangementEdge` задавайте у **обоих** видов, иначе оба могут уехать на одну сторону.
- В overlay оба вида получают всю область; вид меньше области прижимается к верхнему leading-углу,
  поэтому позицию задают гибким `frame(maxWidth:maxHeight:alignment:)`.
- Скрывать `secondary` на внешнем экране можно только если он необязателен — функциональность должна
  быть доступна в любой конфигурации. Ограничивать оси overlay стоит лишь для контента, который
  нормально выглядит поверх сгиба.
- Собственный стиль, раскладывающий виды сам (например, в `VStack`), теряет реакцию на сгиб;
  надёжнее делегировать встроенному через `ArrangementView(configuration)`.

## Структура проекта

Папка `MoonArrangement/` подключена к таргету целиком, поэтому новые файлы и подпапки подхватываются сами.

```
MoonArrangement/
├── App/                      точка входа
│   └── MoonArrangementApp.swift
├── Core/                     вспомогательное
│   ├── MoonPalette.swift         цвета ночного экрана
│   └── SeededGenerator.swift     детерминированный генератор для звёзд
├── Models/                   модели данных (nonisolated)
│   ├── MoonPhaseKind.swift
│   ├── UpcomingPhase.swift
│   └── TonightMoon.swift
├── Components/               переиспользуемые view
│   ├── Sky/        NightSkyBackground
│   ├── Moon/       MoonDiscView, MoonLitShape, MoonCratersShape
│   ├── Phases/     PhaseIconView, UpcomingPhasesList, UpcomingPhasesStrip, AdaptivePhases
│   ├── Tonight/    TonightView, TonightCard, TonightDetails, TonightPanel, MoonBackdrop
│   └── Container/  MoonScreenContainer (NavigationStack + заголовок + фон)
├── Demos/                    вариации ArrangementView, нумерация = номер в каталоге
│   ├── Split/        01…06
│   ├── Overlay/      07…10
│   └── CustomStyle/  11 + SideBySideArrangementViewStyle
└── Catalog/                  MoonDemo (список), MoonCatalogView (меню переключения)
```

## Как смотреть

1. Запустить на симуляторе iPhone Duo (iOS 27.1+) — откроется `MoonCatalogView`, демо переключаются меню внизу.
2. Или открыть любой файл из `Demos/` и смотреть его превью (у каждого Light/Dark).
3. Номер в названии файла = номер в меню каталога.
