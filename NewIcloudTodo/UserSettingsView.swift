//
//  UserSettingsView.swift
//  NewIcloudTodo
//
//  Created by Kaori Persson on 2023-05-17.
//

import SwiftUI

struct UserSettingsView: View {
  
  @EnvironmentObject var homeVM: HomeViewModel
  @State private var isIcloudSyncOnButtonStatus: Bool = false
  
  var body: some View {
    HStack {
      Toggle("iCloud Sync", isOn: $isIcloudSyncOnButtonStatus)
    }
    .padding()
    .onChange(of: self.isIcloudSyncOnButtonStatus) { _ in
      homeVM.isIcloudSyncOn = self.isIcloudSyncOnButtonStatus
    }
    .onAppear {
      self.isIcloudSyncOnButtonStatus = homeVM.isIcloudSyncOn
    }
  }
}

struct UserSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    UserSettingsView()
  }
}
