//
//  HTMLTableViewCell.swift
//  HTMLRenderingTableView
//
//  Created by Brice Pollock on 4/27/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import UIKit

class HTMLTableViewCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!
    
    func configureUsingDecoding(htmlText: String) {
        textView.attributedText = stringByDecodingHTMLCharacters(htmlText) ?? NSAttributedString(string: htmlText)
    }

    func stringByDecodingHTMLCharacters(htmlText: String) -> NSAttributedString? {
        let attributedOptions: [NSObject: AnyObject] = [
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
        ]
        if let encodedData = htmlText.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true), let attributedString = NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil, error: nil) {
            return attributedString
        }
        return nil
    }
    
    func configure(htmlText: String) {
        //Remove the insets/padding thats being rendered by the UITextView
        textView.textContainer.lineFragmentPadding = 0;
        textView.textContainerInset = UIEdgeInsetsZero
        
        // Define Font / Color Options
        let color = UIColor.blackColor()
        let fontSize: Float = 12
        var options = [
            DTCoreTextStub.kDTCoreTextOptionKeyFontSize(): NSNumber(float: Float(fontSize)),
            DTCoreTextStub.kDTCoreTextOptionKeyFontName(): "HelveticaNeue",
            DTCoreTextStub.kDTCoreTextOptionKeyFontFamily(): "Helvetica Neue",
            DTCoreTextStub.kDTCoreTextOptionKeyUseiOS6Attributes(): NSNumber(bool: true),
            DTCoreTextStub.kDTCoreTextOptionKeyTextColor(): color
        ]
        let attributedString = DTCoreTextStub.attributedStringWithHtml(htmlText, options: options)

        //Strip out the extraneous \n added by DTCoreText
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        let range = NSMakeRange(0, attributedString.length)
        mutableAttributedString.mutableString.replaceOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch, range: range)
        
        // Additional Formatting
        let stringRange = NSMakeRange(0, mutableAttributedString.length)
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 3.5
        mutableAttributedString.addAttribute(NSParagraphStyleAttributeName, value: style, range: stringRange)
        
        // Hand off to text field
        textView.attributedText = mutableAttributedString
        
        // Have cells expand multi-line using auto-layout
        textView.scrollEnabled = false
        
        // If your still having layout problems then forcing an update may help. This is not typically necessary:
//        textView.layoutManager.ensureLayoutForTextContainer(textView.textContainer)
//        textView.layoutIfNeeded()
    }
}
