//
//  ContentView.swift
//  NYCHighSchools
//
//  Created by Venkata on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SchoolViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.schools, id: \.dbn) { school in
                NavigationLink(destination: SchoolDetailView(school: school)) {
                    Text(school.school_name)
                }
            }
            .navigationBarTitle("NYC High Schools")
        }
        .onAppear {
            self.viewModel.fetchSchools()
        }
    }
}

struct SchoolDetailView: View {
    var school: School
    
    var body: some View {
        ScrollView {
            Text(school.overview_paragraph)
                .padding()
        }
        .navigationBarTitle(school.school_name)
    }
}

#Preview {
    ContentView()
}
