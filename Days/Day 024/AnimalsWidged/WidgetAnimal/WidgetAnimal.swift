//
//  WidgetAnimal.swift
//  WidgetAnimal
//
//  Created by ali on 15.04.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    @AppStorage("animal", store: UserDefaults(suiteName: "group.ali.kolukirik.AnimalsWidged"))
    var animalData : Data = Data()

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), animal: Animals(image: "shark", name: "shark"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let animal = try? JSONDecoder().decode(Animals.self, from: animalData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, animal: animal)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let animal = try? JSONDecoder().decode(Animals.self, from: animalData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, animal: animal)
            let timeLine = Timeline(entries: [entry], policy: .never)
            completion(timeLine)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let animal : Animals
}

struct WidgetAnimalEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircularImage(image: Image(entry.animal.image))
    }
}

@main
struct WidgetAnimal: Widget {
    let kind: String = "WidgetAnimal"


    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetAnimalEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

