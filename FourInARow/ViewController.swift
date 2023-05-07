//
//  ViewController.swift
//  FourInARow
//
//  Created by beardmikle on 19.04.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
  
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var turnImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resetBoard()
        setCellWidthHeight()
        
    }
    
    func setCellWidthHeight()
    {
        let width = collectionView.frame.size.width / 9
        let height = collectionView.frame.size.height / 6
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    func numberOfSections(in cv: UICollectionView) -> Int
    {
        return board.count
    }
    
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return board[section].count
    }
    
    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! BoardCell
        
        let boardItem = getBoardItem(indexPath)
        cell.image.tintColor = boardItem.tileColor()
        
        return cell
    }
    
    func collectionView(_ cv: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let column = indexPath.item
        if var boardItem = getLowestEmptyBoardItem(column)
        {
            if let cell = collectionView.cellForItem(at: boardItem.indexPath) as? BoardCell
            {
                cell.image.tintColor = currentTurnColor()
                boardItem.tile = currentTurnTile()
                updateBoardWithBoardItem(boardItem)
                
                toggleTurn(turnImage)
            }
        }
    }
    

}

