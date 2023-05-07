//
//  Turn.swift
//  FourInARow
//
//  Created by beardmikle on 05.05.2023.
//

import Foundation
import UIKit

enum Turn
{
    case Red
    case Yellow
}

var currentTurn = Turn.Yellow

func toggleTurn(_ turnImage: UIImageView) {
    if yellowTurn()
    {
        currentTurn = Turn.Red
        turnImage.tintColor = .red
    }
    else
    {
        currentTurn = Turn.Yellow
        turnImage.tintColor = .systemYellow
    }
}

func yellowTurn() -> Bool
{
    return currentTurn == Turn.Yellow
}


func redTurn() -> Bool
{
    return currentTurn == Turn.Red
}

func currentTurnTile() -> Tile
{
    return yellowTurn() ? Tile.Yellow : Tile.Red
}

func currentTurnColor() -> UIColor
{
    return yellowTurn() ? .systemYellow : .red
}


func currentTurnVictoryMessage() -> String
{
    return yellowTurn() ? "Yellow Player Wins!" : "Red Player Wins!"
    
    // Ternary conditional operator
}


