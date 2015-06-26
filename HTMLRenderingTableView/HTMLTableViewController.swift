//
//  HTMLTableViewController.swift
//  HTMLRenderingTableView
//
//  Created by Brice Pollock on 4/27/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import UIKit

class HTMLTableViewController: UITableViewController {

    var htmlTextList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        htmlTextList.append("normal text")
        htmlTextList.append("<b>bolded</b>")
        htmlTextList.append("<i>italics</i>")
        htmlTextList.append("It is possible to have both <i>italic</i> and <b>bolded</b> text! Even on multi-lines which can sometimes be <b>problematic</b>.")
        htmlTextList.append("Mixed text can also work using <b>NSAttributed String</b>, but it can be <i>slow</i> when paging thorugh the table view.")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return htmlTextList.count
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HTMLTableViewCell", forIndexPath: indexPath) as! HTMLTableViewCell
        cell.configure(htmlTextList[indexPath.row])
        
        // Possibly needed if you have exra HTML tags you need rendering
        if indexPath.row == htmlTextList.count-1 {
            cell.configureUsingDecoding(htmlTextList[indexPath.row])
        }
        return cell
    }
}
