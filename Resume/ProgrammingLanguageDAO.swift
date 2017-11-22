//
//  ProgrammingLanguageDAO.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/16.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import Foundation

class ProgrammingLanguageDAO {
    
    private var pgitems: [ProgrammingLanguageBean] = []
    
    var programmingLanguageItems: [ProgrammingLanguageBean] {
        return pgitems
    }
    
    init() {
        pgitems.append(ProgrammingLanguageBean(name: "Swift", imgName: "hhw001", urlStr: "https://swift.org"))
        pgitems.append(ProgrammingLanguageBean(name: "Java", imgName: "hhw001", urlStr: "https://docs.oracle.com/javase/9/"))
        pgitems.append(ProgrammingLanguageBean(name: "C++", imgName: "hhw001", urlStr: "https://docs.microsoft.com/ja-jp/cpp/cpp/cpp-language-reference"))
        pgitems.append(ProgrammingLanguageBean(name: "Cobol", imgName: "hhw001", urlStr: "https://www.microfocus.co.jp/manuals/VC30/vc30indx.html"))
        pgitems.append(ProgrammingLanguageBean(name: "Ruby", imgName: "hhw001", urlStr: "http://guides.rubyonrails.org/getting_started.html"))
    }
    
}
