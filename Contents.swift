//: Playground - noun: a place where people can play

import UIKit

var date = Date()
var dateformatter = DateFormatter()
dateformatter.dateFormat = "yyyy年MM月dd日 aa KK:mm"
dateformatter.locale = Locale.current
print(dateformatter.string(from: date))
//dateformatter.timeZone = TimeZone(abbreviation: ".UTC + 9:00")
//print(dateformatter.string(from: date))
var str = "Swift is a powerful and intuitive programming language for iOS, OS X,tvOS,and tatchOS"
var start = str.index(str.startIndex, offsetBy: 5)
var end = str.index(str.startIndex, offsetBy: 19)
print(str[start...end])
str.replacingOccurrences(of: "OS", with: "")

var dic = ["hehe":"as","dd":"20"] as NSDictionary
var filemanage = FileManager.default
var url = filemanage.urls(for: .documentDirectory, in: .userDomainMask).first!
url.appendPathComponent("text.txt")
try! dic.write(to: url)

let dic_get = NSDictionary(contentsOf: url)!
print(dic_get)

var imgurl = URL(string: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2899142879,4043532548&fm=27&gp=0.jpg")!
var imgData = try! Data(contentsOf: imgurl)
let imgpath = filemanage.urls(for: .documentDirectory, in: .userDomainMask).first!
imgurl.appendPathComponent("1.jpg")
try? imgData.write(to: imgpath)

var dicurl = URL(string: "http://www.weather.com.cn/adat/sk/101270101.html")
var dicData = try Data(contentsOf: dicurl!)
let object = try JSONSerialization.jsonObject(with: dicData, options: .allowFragments)
if let dic = object as? [String:Any] {
    if let weather = dic["weatherinfo"] as? [String:Any] {
        print(weather["city"]!)
    }
}


class Person:Codable{
    var height:String
    init(height:String) {
        self.height = height
    }
}

//var filemanager = FileManager.default
var p1 = Person(height: "178")
var classpath = filemanage.urls(for: .documentDirectory, in: .userDomainMask).first!
classpath.appendPathComponent("class.txt")
var encode = JSONEncoder()
var decode = JSONDecoder()
var classdata = try encode.encode(p1)
try classdata.write(to: classpath)

let data1 = try Data.init(contentsOf: classpath)
let get = try decode.decode(type(of: p1), from: data1)
print(String(data:data1,encoding:.utf8)!)


var result = try Data.init(contentsOf: classpath)
var getit = try decode.decode(type(of: p1), from: result)
print(String(data:result,encoding:.utf8)!)





