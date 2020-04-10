//
//  GraphViewController.swift
//  NovelCOVID
//
//  Created by Developer Bully on 10/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import Foundation
import UIKit


class GraphViewController: UIViewController {
    
    @IBOutlet weak var curvedlineChart: LineChart!
    
    var dataEntries: [PointEntry] = [PointEntry]() {
        didSet {
            updateChartData()
        }
    }
    
    private func updateChartData() {
        guard curvedlineChart != nil else { return }
        curvedlineChart.cleanDotLayer()
        curvedlineChart.dataEntries = dataEntries
        curvedlineChart.animateDots = true
        curvedlineChart.showDots = true
        curvedlineChart.isCurved = true
        curvedlineChart.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

