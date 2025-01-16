//
//  ProfileView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


@MainActor class ProfileViewModel: ObservableObject {
    @ObservedObject var contentVM: ContentViewModel
    @Published var isAlert = false
    @Published var user: User
    @Published var coalitions: Coalitions
    @Published var color: Color

    init(contentVM: ContentViewModel) {
        self.contentVM = contentVM
        self.user = contentVM.user ?? User.example
        let coalitions = contentVM.coalitions ?? Coalitions([Coalition(id: 1, name: "Water", color: "#326C9C"), Coalition(id: 1, name: "The Worms", color: "#326C9C")])
        self.coalitions = coalitions
        self.color = Color(hex: coalitions[0].color)
    }
    
    func isCursusExists() -> Bool {
        user.cursusUsers.indices.contains(2)
    }
    
    func defineXPBar() -> CGFloat {
        let xp = isCursusExists() ? user.cursusUsers[2].level : user.cursusUsers[1].level
        let xpBar = (xp / 21) * 358
        return xpBar > 358 ? 358 : xpBar
    }
    
    func displayDate(isoDate: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        displayFormatter.timeStyle = .none
        
        if let date = dateFormatter.date(from: isoDate) {
            return displayFormatter.string(from: date)
        } else {
            return "Invalid date"
        }
    }
    
    func displayProjects(projectsUsers: [ProjectsUser]) -> some View {
        VStack {
            if projectsUsers.isEmpty {
                HStack {
                    Text("No ongoing projects")
                        .foregroundStyle(.secondary.opacity(0.8))
                    Spacer()
                }
                .padding(.top, 5)
            } else {
                ForEach(projectsUsers) { projectUser in
                    HStack {
                        HStack {
                            Text(projectUser.project.name)
                                .foregroundStyle(self.color)
                                .bold()
                            
                            Text(self.displayDate(isoDate: projectUser.updatedAt))
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Text("\(projectUser.validated ?? false ? "✓" : "✘") \(projectUser.finalMark ?? 0)")
                            .foregroundStyle(projectUser.validated ?? false ? .green : .red)
                            .bold()
                    }
                    .padding(.top, 5)
                }
            }
        }
        .padding([.leading, .trailing], 20)
    }
}


struct ProfileView: View {
    @ObservedObject var contentVM: ContentViewModel
    @StateObject var vm: ProfileViewModel
    
    init(contentVM: ContentViewModel) {
        self._contentVM = ObservedObject(wrappedValue: contentVM)
        self._vm = StateObject(wrappedValue: ProfileViewModel(contentVM: contentVM))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: vm.user.image.link)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .scaleEffect(5)
                    }
                    .frame(width: 250, height: 250)
                    
                    Image(systemName: vm.user.location != nil ? "checkmark.seal.fill" : "xmark.seal.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(vm.user.location != nil ? .green : .red)
                        .background(
                            Circle()
                                .fill(.background)
                                .frame(width: 60, height: 60)
                        )
                }
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(vm.color)
                            .frame(width: 250, height: 100)
                        
                        VStack {
                            HStack {
                                Text("₳\(vm.user.wallet)")
                                    .font(.title)
                                Text(vm.user.login)
                                    .font(.title2.bold())
                            }
                            .foregroundStyle(.white)
                            
                            HStack(spacing: 5) {
                                Text(vm.user.firstName)
                                Text(vm.user.lastName)
                            }
                            .foregroundStyle(.white)
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(vm.color)
                            .frame(width: 100, height: 100)
                        
                        Text("\(vm.user.correctionPoint)")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.top, 20)
                
                VStack {
                    Text("\(vm.isCursusExists() ? vm.user.cursusUsers[2].grade! : vm.user.cursusUsers[1].grade ?? "Unknown") (\(String(format: "%.2f", vm.isCursusExists() ? vm.user.cursusUsers[2].level : vm.user.cursusUsers[1].level)))")
                        .font(.title2.italic().bold())
                        .foregroundStyle(vm.color)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(style: StrokeStyle())
                            .frame(width: 360, height: 30)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green)
                            .frame(width: vm.defineXPBar(), height: 28)
                            .offset(x: 1)
                    }
                }
                .padding(.top, 20)
                
                VStack {
                    Text("Ongoing projects")
                        .foregroundStyle(.secondary.opacity(0.8))
                    
                    vm.displayProjects(projectsUsers: vm.user.projectsUsers.filter { $0.validated == nil })
                    
                    Spacer(minLength: 50)
                    
                    Text("Finished projects")
                        .foregroundStyle(.secondary.opacity(0.8))
                    
                    vm.displayProjects(projectsUsers: vm.user.projectsUsers.filter { $0.validated != nil })
                }
                .padding(.top, 20)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SearchView(contentVM: contentVM)
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.isAlert = true
                    } label: {
                        Image(systemName: "power")
                            .resizable()
                            .scaledToFit()
                            .tint(.red)
                    }
                }
            }
        }
        .alert("Log out?", isPresented: $vm.isAlert) {
            Button("Yes") {
                contentVM.isLogged = false
                contentVM.isSheet = true
            }
            Button("No", role: .cancel) {}
        }
    }
}

#Preview {
    ProfileView(contentVM: ContentViewModel())
}
