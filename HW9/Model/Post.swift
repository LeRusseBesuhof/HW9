import Foundation

struct Post : Identifiable {
    
    let id : String = UUID().uuidString
    let userName : String
    let profilePicture : String
    let mainImage : String
    let date : String
    let header : String
    let text : String
    
    internal static func mockData() -> [Post] {
        [
            Post(
                userName: "Old Archaeologist",
                profilePicture: "man",
                mainImage: "malachite",
                date: createDate(forDay: 0),
                header: "Malachite",
                text: "Malachite is generally opaque and comes in a vivid bluish green to green color. It is usually banded in two or more tones of green and may have a subtle sheen. This gem is a secondary copper mineral and is commonly found in conjunction with azurite, a bold blue copper carbonate mineral"),
            Post(
                userName: "Bedrock Destroyer",
                profilePicture: "afro",
                mainImage: "granite",
                date: createDate(forDay: -1),
                header: "Granite",
                text: "Granite is a coarse-grained (phaneritic) intrusive igneous rock composed mostly of quartz, alkali feldspar, and plagioclase. It forms from magma with a high content of silica and alkali metal oxides that slowly cools and solidifies underground"),
            Post(
                userName: "Archaeology enjoyer",
                profilePicture: "guy",
                mainImage: "obsidian",
                date: createDate(forDay: -2),
                header: "Obsidian",
                text: "Obsidian is an extrusive rock that erupted out of a volcano. Most volcanic rocks are rough and jagged because they contain gas bubbles. But obsidian is smooth because it contains mostly of glass")
        ]
    }
    
    private static func createDate(forDay dayIndex: Int) -> String {
        let date = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        
        guard let day = calendar.date(byAdding: .day, value: dayIndex, to: date) else {
            return dateFormatter.string(from: date)
        }
        return dateFormatter.string(from: day)
    }
}
