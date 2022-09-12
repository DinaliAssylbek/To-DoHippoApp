//
//  ContentView.swift
//  Hippo
//
//  Created by Dinali Assylbek on 07.09.2022.
//

import SwiftUI

struct mondayTask: Hashable, Codable {
    var task:String
    var complete:Bool
    var removefromList:Bool
    var id: String { task }
}
struct tuesdayTask: Hashable, Codable {
    var task:String
    var complete:Bool
    var removefromList:Bool
    var id: String { task }
}
struct wednesdayTask: Hashable, Codable {
    var task:String
    var complete:Bool
    var removefromList:Bool
    var id: String { task }
}
struct thursdayTask: Hashable, Codable {
    var task:String
    var complete:Bool
    var removefromList:Bool
    var id: String { task }
}
struct fridayTask: Hashable, Codable {
    var task:String
    var complete:Bool
    var removefromList:Bool
    var id: String { task }
}
struct saturdayTask: Hashable, Codable {
    var task:String
    var complete:Bool
    var removefromList:Bool
    var id: String { task }
}
struct sundayTask: Hashable, Codable {
    var task:String
    var complete:Bool
    var removefromList:Bool
    var id: String { task }
}

extension Calendar {
    static let iso8601 = Calendar(identifier: .iso8601)
}
extension Date {
    var startOfWeek: Date {
        return Calendar.iso8601.date(from: Calendar.iso8601.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
    }
    var daysOfWeek: [Date] {
        let startOfWeek = self.startOfWeek
        return (0...6).compactMap{ Calendar.current.date(byAdding: .day, value: $0, to: startOfWeek)}
    }
}
extension DateFormatter {
    static let displayDate: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMM dd"
         return formatter
    }()
}

struct ContentView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var daysoftheWeek = Date().daysOfWeek
    
    @State private var MondayTasks = [mondayTask]()
    @State private var TuesdayTasks = [tuesdayTask]()
    @State private var WednesdayTasks = [wednesdayTask]()
    @State private var ThursdayTasks = [thursdayTask]()
    @State private var FridayTasks = [fridayTask]()
    @State private var SaturdayTasks = [saturdayTask]()
    @State private var SundayTasks = [sundayTask]()
    
    
    @State private var NewMondayTask = ""
    @State private var NewTuesdayTask = ""
    @State private var NewWednesdayTask = ""
    @State private var NewThursdayTask = ""
    @State private var NewFridayTask = ""
    @State private var NewSaturdayTask = ""
    @State private var NewSundayTask = ""
    
    @State private var currentNumberMonday = 1
    @State private var currentNumberTuesday = 1
    @State private var currentNumberWednesday = 1
    @State private var currentNumberThursday = 1
    @State private var currentNumberFriday = 1
    @State private var currentNumberSaturday = 1
    @State private var currentNumberSunday = 1
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [Color(red: 0.63,green:0.77,blue:0.99),Color(red:0.76,green:0.91,blue:0.98)],startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                Form{
                    Section{
                    VStack{
                        HStack{
                            Text("Monday")
                            .font(.system(size: 25, weight:.bold, design:.rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y:6)
                            Text(DateFormatter.displayDate.string(from: daysoftheWeek[0]))
                                .foregroundColor(.gray)
                                .offset(y:6)
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:300,height:3)
                        List{
                            ForEach(Array(MondayTasks.enumerated()),id: \.element) {i, word in
                                HStack{
                                    if MondayTasks[i].removefromList == false{
                                    Button(
                                        action:  {
                                        MondayTasks[i].complete.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                        MondayTasks[i].removefromList.toggle()
                                            }
                                    }) {
                                        Circle()
                                    }
                                    .animation(.default)
                                    .frame(width: 10, height: 10)
                                    .background(word.complete ? Color.gray : Color.white)
                                    .clipShape(Circle())
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    .buttonStyle(BorderlessButtonStyle())
                                    .tint(word.complete ? Color.gray : Color.white)
                                    
                                    Text(word.task)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(word.complete ? Color.gray : Color.black)
                                        .animation(.default)
                                }
                                }
                                }
                            HStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:10, height:10)
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                
                            TextField("Task", text:$NewMondayTask)
                                .onSubmit(addMondayTask)
                            }
                        }

                }
                    }
                    Section{
                    VStack{
                        HStack{
                            Text("Tuesday")
                            .font(.system(size: 25, weight:.bold, design:.rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y:6)
                            Text(DateFormatter.displayDate.string(from: daysoftheWeek[1]))
                                .foregroundColor(.gray)
                                .offset(y:6)
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:300,height:3)
                        List{
                            ForEach(Array(TuesdayTasks.enumerated()),id: \.element) {i, word in
                                HStack{
                                    if TuesdayTasks[i].removefromList == false{
                                    Button(
                                        action:  {
                                        TuesdayTasks[i].complete.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                        TuesdayTasks[i].removefromList.toggle()
                                            }
                                    }) {
                                        Circle()
                                    }
                                    .animation(.default)
                                    .frame(width: 10, height: 10)
                                    .background(word.complete ? Color.gray : Color.white)
                                    .clipShape(Circle())
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    .buttonStyle(BorderlessButtonStyle())
                                    .tint(word.complete ? Color.gray : Color.white)
                                    
                                    Text(word.task)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(word.complete ? Color.gray : Color.black)
                                        .animation(.default)
                                }
                                }
                                }
                            HStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:10, height:10)
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                
                            TextField("Task", text:$NewTuesdayTask)
                                .onSubmit(addTuesdayTask)
                            }
                        }

                }
                    }
                    Section{
                    VStack{
                        HStack{
                            Text("Wednesday")
                            .font(.system(size: 25, weight:.bold, design:.rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y:6)
                            Text(DateFormatter.displayDate.string(from: daysoftheWeek[2]))
                                .foregroundColor(.gray)
                                .offset(y:6)
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:300,height:3)
                        List{
                            ForEach(Array(WednesdayTasks.enumerated()),id: \.element) {i, word in
                                HStack{
                                    if WednesdayTasks[i].removefromList == false{
                                    Button(
                                        action:  {
                                            WednesdayTasks[i].complete.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                                WednesdayTasks[i].removefromList.toggle()
                                            }
                                    }) {
                                        Circle()
                                    }
                                    .animation(.default)
                                    .frame(width: 10, height: 10)
                                    .background(word.complete ? Color.gray : Color.white)
                                    .clipShape(Circle())
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    .buttonStyle(BorderlessButtonStyle())
                                    .tint(word.complete ? Color.gray : Color.white)
                                    
                                    Text(word.task)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(word.complete ? Color.gray : Color.black)
                                        .animation(.default)
                                }
                                }
                                }
                            HStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:10, height:10)
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                
                            TextField("Task", text:$NewWednesdayTask)
                                .onSubmit(addWednesdayTask)
                            }
                        }

                }
                    }
                    Section{
                    VStack{
                        HStack{
                            Text("Thursday")
                            .font(.system(size: 25, weight:.bold, design:.rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y:6)
                            Text(DateFormatter.displayDate.string(from: daysoftheWeek[3]))
                                .foregroundColor(.gray)
                                .offset(y:6)
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:300,height:3)
                        List{
                            ForEach(Array(ThursdayTasks.enumerated()),id: \.element) {i, word in
                                HStack{
                                    if ThursdayTasks[i].removefromList == false{
                                    Button(
                                        action:  {
                                            ThursdayTasks[i].complete.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                                ThursdayTasks[i].removefromList.toggle()
                                            }
                                    }) {
                                        Circle()
                                    }
                                    .animation(.default)
                                    .frame(width: 10, height: 10)
                                    .background(word.complete ? Color.gray : Color.white)
                                    .clipShape(Circle())
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    .buttonStyle(BorderlessButtonStyle())
                                    .tint(word.complete ? Color.gray : Color.white)
                                    
                                    Text(word.task)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(word.complete ? Color.gray : Color.black)
                                        .animation(.default)
                                }
                                }
                                }
                            HStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:10, height:10)
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                
                            TextField("Task", text:$NewThursdayTask)
                                .onSubmit(addThursdayTask)
                            }
                        }

                }
                    }
                    Section{
                    VStack{
                        HStack{
                            Text("Friday")
                            .font(.system(size: 25, weight:.bold, design:.rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y:6)
                            Text(DateFormatter.displayDate.string(from: daysoftheWeek[4]))
                                .foregroundColor(.gray)
                                .offset(y:6)
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:300,height:3)
                        List{
                            ForEach(Array(FridayTasks.enumerated()),id: \.element) {i, word in
                                HStack{
                                    if FridayTasks[i].removefromList == false{
                                    Button(
                                        action:  {
                                            FridayTasks[i].complete.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                                FridayTasks[i].removefromList.toggle()
                                            }
                                    }) {
                                        Circle()
                                    }
                                    .animation(.default)
                                    .frame(width: 10, height: 10)
                                    .background(word.complete ? Color.gray : Color.white)
                                    .clipShape(Circle())
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    .buttonStyle(BorderlessButtonStyle())
                                    .tint(word.complete ? Color.gray : Color.white)
                                    
                                    Text(word.task)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(word.complete ? Color.gray : Color.black)
                                        .animation(.default)
                                }
                                }
                                }
                            HStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:10, height:10)
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                
                            TextField("Task", text:$NewFridayTask)
                                .onSubmit(addFridayTask)
                            }
                        }

                }
                    }
                    Section{
                    VStack{
                        HStack{
                            Text("Saturday")
                            .font(.system(size: 25, weight:.bold, design:.rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y:6)
                            Text(DateFormatter.displayDate.string(from: daysoftheWeek[5]))
                                .foregroundColor(.gray)
                                .offset(y:6)
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:300,height:3)
                        List{
                            ForEach(Array(SaturdayTasks.enumerated()),id: \.element) {i, word in
                                HStack{
                                    if SaturdayTasks[i].removefromList == false{
                                    Button(
                                        action:  {
                                            SaturdayTasks[i].complete.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                                SaturdayTasks[i].removefromList.toggle()
                                            }
                                    }) {
                                        Circle()
                                    }
                                    .animation(.default)
                                    .frame(width: 10, height: 10)
                                    .background(word.complete ? Color.gray : Color.white)
                                    .clipShape(Circle())
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    .buttonStyle(BorderlessButtonStyle())
                                    .tint(word.complete ? Color.gray : Color.white)
                                    
                                    Text(word.task)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(word.complete ? Color.gray : Color.black)
                                        .animation(.default)
                                }
                                }
                                }
                            HStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:10, height:10)
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                
                            TextField("Task", text:$NewSaturdayTask)
                                .onSubmit(addSaturdayTask)
                            }
                        }

                }
                    }
                    Section{
                    VStack{
                        HStack{
                            Text("Sunday")
                            .font(.system(size: 25, weight:.bold, design:.rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y:6)
                            Text(DateFormatter.displayDate.string(from: daysoftheWeek[6]))
                                .foregroundColor(.gray)
                                .offset(y:6)
                        }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:300,height:3)
                        List{
                            ForEach(Array(SundayTasks.enumerated()),id: \.element) {i, word in
                                HStack{
                                    if SundayTasks[i].removefromList == false{
                                    Button(
                                        action:  {
                                            SundayTasks[i].complete.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                                SundayTasks[i].removefromList.toggle()
                                            }
                                    }) {
                                        Circle()
                                    }
                                    .animation(.default)
                                    .frame(width: 10, height: 10)
                                    .background(word.complete ? Color.gray : Color.white)
                                    .clipShape(Circle())
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                    .buttonStyle(BorderlessButtonStyle())
                                    .tint(word.complete ? Color.gray : Color.white)
                                    
                                    Text(word.task)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(word.complete ? Color.gray : Color.black)
                                        .animation(.default)
                                }
                                }
                                }
                            HStack{
                                Circle()
                                    .fill(.white)
                                    .frame(width:10, height:10)
                                    .frame(width:13, height: 13)
                                    .background(.gray)
                                    .clipShape(Circle())
                                
                            TextField("Task", text:$NewSundayTask)
                                .onSubmit(addSundayTask)
                            }
                        }
                    }
                }
            }
                .navigationBarItems(leading:
                                        HStack{
                Image("Hippoface")
                    .resizable()
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:60,height:60)
                    Text("HIPPO")
                        .font(.system(size:36,weight:.heavy,design:.rounded))
                }
                    .offset(y:30)
                                    )
            }
        }
}
    func addMondayTask() {
        let task = NewMondayTask
        let completed = false
        let removeit = false
        let mondayTask = mondayTask(task: task, complete: completed,removefromList: removeit)
        guard task.count > 0 else {return}
        
        MondayTasks.append(mondayTask)
        NewMondayTask = ""
    }

    func addTuesdayTask() {
        let task = NewTuesdayTask
        let completed = false
        let removeit = false
        let tuesdayTask = tuesdayTask(task: task, complete: completed,removefromList: removeit)
        guard task.count > 0 else {return}
        
        TuesdayTasks.append(tuesdayTask)
        NewTuesdayTask = ""
    }
    
    func addWednesdayTask() {
        let task = NewWednesdayTask
        let completed = false
        let removeit = false
        let wednesdayTask = wednesdayTask(task: task, complete: completed,removefromList: removeit)
        guard task.count > 0 else {return}
        
        WednesdayTasks.append(wednesdayTask)
        NewWednesdayTask = ""
    }
    
    func addThursdayTask() {
        let task = NewThursdayTask
        let completed = false
        let removeit = false
        let thursdayTask = thursdayTask(task: task, complete: completed,removefromList: removeit)
        guard task.count > 0 else {return}
        
        ThursdayTasks.append(thursdayTask)
        NewThursdayTask = ""
    }
    
    func addFridayTask() {
        let task = NewFridayTask
        let completed = false
        let removeit = false
        let fridayTask = fridayTask(task: task, complete: completed,removefromList: removeit)
        guard task.count > 0 else {return}
        
        FridayTasks.append(fridayTask)
        NewFridayTask = ""
    }
    
    func addSaturdayTask() {
        let task = NewSaturdayTask
        let completed = false
        let removeit = false
        let saturdayTask = saturdayTask(task: task, complete: completed,removefromList: removeit)
        guard task.count > 0 else {return}
        
        SaturdayTasks.append(saturdayTask)
        NewSaturdayTask = ""
    }
    
    func addSundayTask() {
        let task = NewSundayTask
        let completed = false
        let removeit = false
        let sundayTask = sundayTask(task: task, complete: completed,removefromList: removeit)
        guard task.count > 0 else {return}
        
        SundayTasks.append(sundayTask)
        NewSundayTask = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
