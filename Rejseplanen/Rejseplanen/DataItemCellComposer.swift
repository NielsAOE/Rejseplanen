/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A class used to populate a `DataItemCollectionViewCell` for a given `DataItem`. The composer class handles processing and caching images for `DataItem`s.
*/

import UIKit

class DataItemCellComposer {
    // MARK: Properties
    
    /**
        A dictionary of `NSOperationQueue`s for `DataItemCollectionViewCell`s. The
        queues contain operations that process images for `DataItem`s before updating
        the cell's `UIImageView`.
    */
    private var operationQueues = [DataItemCollectionViewCell: NSOperationQueue]()

    // MARK: Implementation
    
    func composeCell(cell: DataItemCollectionViewCell, withDataItem dataItem: Stop) {
        // Cancel any queued operations to process images for the cell.
        let operationQueue = operationQueueForCell(cell)
        operationQueue.cancelAllOperations()
        
        // Set the cell's properties.
        cell.representedDataItem = dataItem
        cell.label.text = dataItem.name
        cell.imageView.alpha = 1.0
        
        // No further work is necessary if the cell's image view has an image.
        guard cell.imageView.image == nil else { return }
    }
    
    // MARK: Convenience
    
    /**
        Returns the `NSOperationQueue` for a given cell. Creates and stores a new
        queue if one doesn't already exist.
    */
    private func operationQueueForCell(cell: DataItemCollectionViewCell) -> NSOperationQueue {
        if let queue = operationQueues[cell] {
            return queue
        }
        
        let queue = NSOperationQueue()
        operationQueues[cell] = queue
        
        return queue
    }
}
