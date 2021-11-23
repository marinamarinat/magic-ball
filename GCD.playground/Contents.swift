import UIKit

// deadlock with two queues

//let queue = DispatchQueue(label: "deadlock")
//queue.async {
//    queue.sync {
//        print("a") // => deadlock
//    }
//    print("done")// this will never be reached
//}


// cancellation of DispatchWorkItem

let backgroundQueue = DispatchQueue(label: "backgroundQueue", qos: .background)
let workItem = DispatchWorkItem(qos: .default) {
    while true {
        print("0")
    }
}
    backgroundQueue.asyncAfter(deadline: .now() + .seconds(2), execute: workItem)
    workItem.cancel()
    print("canceled")
