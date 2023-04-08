//
//  CommonMoyaProvider.swift
//  fooiy-ios
//
//  Created by 김상우 on 2022/08/10.
//

import Foundation
import Moya

class CommonMoyaProvider<T: TargetType>: MoyaProvider<T> {
    init() {
        // custom plugins
        // plugin has logic about duplicate logins 
        let networkLoggerPlugin = BaseNetworkPlugin.networkLoggerPlugin      
        let networkActivityPlugin = BaseNetworkPlugin.networkActivityPlugin
        let configuration = BaseNetworkPlugin.configuration
        let session = Session(configuration: configuration)
        
        super.init(session: session, plugins: [networkLoggerPlugin, networkActivityPlugin])
    }
}
