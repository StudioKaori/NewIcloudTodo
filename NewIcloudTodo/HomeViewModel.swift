//
//  HomeViewModel.swift
//  NewIcloudTodo
//
//  Created by Kaori Persson on 2023-05-17.
//

import SwiftUI

class HomeViewModel: ObservableObject {
  @AppStorage("icloudSyncOn") var isIcloudSyncOn: Bool = false
}
