//
//  GraphView.swift
//  NovelCOVID
//
//  Created by Developer Bully on 10/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import UIKit


struct GraphViewWrapper: UIViewControllerRepresentable {
    
    var dataEntries: [PointEntry] = [PointEntry]()

    typealias UIViewControllerType = GraphViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<GraphViewWrapper>) -> GraphViewWrapper.UIViewControllerType {
        let loadedStoryboard = UIStoryboard(name: "Graph", bundle: nil)
        let loadedControlller = loadedStoryboard.instantiateViewController(withIdentifier: "GraphViewController") as! GraphViewWrapper.UIViewControllerType
        loadedControlller.dataEntries = dataEntries
        return loadedControlller
    }

    func updateUIViewController(_ uiViewController: GraphViewWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<GraphViewWrapper>) {
        
        uiViewController.dataEntries = dataEntries
    }
}
