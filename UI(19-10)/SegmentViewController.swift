//
//  SegmentViewController.swift
//  UI(19-10)
//
//  Created by Kim Nghĩa on 24/10/2022.
//

import UIKit

class SegmentViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var segment0ContentView: UIView!
    @IBOutlet weak var segment1ContentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
    }
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segment.removeAllSegments()
        segment.insertSegment(withTitle: "グループのみ", at: 0, animated: true)
        segment.insertSegment(withTitle: "すべて表示", at: 1, animated: true)
        
        segment0ContentView.isHidden = false
        segment1ContentView.isHidden = true
        // Select First Segment
        segment.selectedSegmentIndex = 1
    }
    
    @IBAction func segmentedChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
            segment0ContentView.isHidden = true
            segment1ContentView.isHidden = false
            case 1:
            segment0ContentView.isHidden = false
            segment1ContentView.isHidden = true
            default:
                break
            }
    }
}
