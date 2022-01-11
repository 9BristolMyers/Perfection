//
//  ThreadViewController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/25/21.
//

import UIKit

class ThreadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        runLoopInThreads()
    }
    
    func runLoopInThreads() {
        
        //print(RunLoop.current)
        
        class TimeThread: Thread {
            override func main() {
                // Настраиваем таймер
                Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
                    print("Tick")
                }
                // Запускаем петлю
                //RunLoop.current.run()
            }
        }
        
        let thread = TimeThread()//создали объект потока
        thread.start()
        //Runloop "спит"
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print("Tick")
            }
        RunLoop.current.run()//Runloop "просыпается" и идёт выполнять свою задачу – код над ним
        }
    }
    
    func mainThread() {
        
        Thread.detachNewThread {
            for _ in (0..<1000) {
            print("😈")
            }
        }
              
        let thread1 = Thread {
            for _ in (0..<1000) {
            print("🖥")
            }
        }
        
        thread1.qualityOfService = .userInteractive
                
        thread1.start()
        
        for _ in (0..<1000) {
            print("😇")
        }
    }
    
    func timerWithDate() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
        print(Date())
    }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
        sleep(1)
        }
    }

    func memoryOverFlow() {
        
        print("start test")
        for index in 0...UInt.max {
            autoreleasepool {
                let string = NSString(format: "test + %d", index)
                print(string)
            }
        }
        print("end test")
    }

