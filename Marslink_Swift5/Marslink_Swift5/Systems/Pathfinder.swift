//
//  Pathfinder.swift
//  Marslink_Swift5
//
//  Created by liuruixuan on 2023/4/17.
//

import Foundation

protocol PathfinderDelegate: AnyObject {
    func pathfinderDidUpdateMessages(pathfinder: Pathfinder)
}

private func delay(time: Double = 1, execute work: @escaping @convention(block) () -> Swift.Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        work()
    }
}

private func lewisMessage(text: String, interval: TimeInterval = 0) -> Message {
    let user = User(id: 2, name: "cpt.lewis")
    return Message(date: Date(timeIntervalSinceNow: interval), text: text, user: user)
}

class Pathfinder {
    weak var delegate: PathfinderDelegate?

    var messages: [Message] = {
        var arr = [Message]()
        arr.append(lewisMessage(text: "Mark, are you receiving me?", interval: -803200))
        arr.append(lewisMessage(text: "I think I left behind some ABBA, might help with the drive 😜", interval: -259200))
        return arr
    }() {
        didSet {
            delegate?.pathfinderDidUpdateMessages(pathfinder: self)
        }
    }

    func connect() {
        delay(time: 2.3) {
            self.messages.append(lewisMessage(text: "Liftoff in 3..."))
            delay {
                self.messages.append(lewisMessage(text: "2..."))
                delay {
                    self.messages.append(lewisMessage(text: "1..."))
                }
            }
        }
    }
}
