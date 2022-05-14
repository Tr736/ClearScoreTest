import Foundation

struct CoachingSummaryResponse: Decodable {
    let activeTodo: Bool
    let activeChat: Bool
    let numberOfTodoItems: Int
    let numberOfCompletedTodoItems: Int
    let selected: Bool
}
