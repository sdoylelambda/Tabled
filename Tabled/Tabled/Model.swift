import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private(set) var items: [String] = []
    
    func addItem(_ item: String) {
        items.append(item)
        saveData()
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
        saveData()
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        let value = items.remove(at: index)
        items.insert(value, at: index)
        saveData()
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> String {
        return items[index]
    }
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("ToDo")
        .appendingPathExtension("plist")
    
    func saveData() {
        try! (items as NSArray).write(to: fileURL)
    }
    
    func loadData() {
        if let items = NSArray(contentsOf: fileURL) as? [String] {
              self.items = items
        }
    }
}
