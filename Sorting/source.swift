//
//  source.swift
//  lesson4
//
//  Created by Serg on 19/02/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

// сортировка пузырьком

func bubbleSorting<T: Comparable>(array: [T]) -> [T] {
    var sortArray = array
    for i in 0..<sortArray.count {
        for n in 0..<sortArray.count - i - 1 {
            if sortArray[n] > sortArray[n + 1] {
                let change = sortArray[n]
                sortArray[n] = sortArray[n + 1]
                sortArray[n + 1] = change
            }
        }
    }
    return sortArray
}

// сортировка вставками

func insertionSort<T: Comparable>(array: [T]) -> [T] {
    var sortArray = array
    for i in 1..<sortArray.count {
        let change = sortArray[i]
        var j = i
        while j > 0 && change < sortArray[j - 1] {
            sortArray[j] = sortArray[j - 1]
            j -= 1
        }
        sortArray[j] = change
    }
    return sortArray
}

// сортировка слиянием

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.count == 1 {
        return array
    }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [T] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

// быстрая сортировка с созданием массивов, ячеек памяти

func quickSortWithEx<T: Comparable>(array:[T]) -> [T] {
    let sortedArray = array
    if sortedArray.count > 1 {
        
        var less = [T]()
        var equal = [T]()
        var greater = [T]()
        
        // pivot - опорная точка
        
        let pivot = sortedArray[1]
        
        for elem in sortedArray {
            if elem < pivot {
                less.append(elem)
            }else if elem == pivot {
                equal.append(elem)
            } else {
                greater.append(elem)
            }
        }
        return quickSortWithEx(array: less) + equal + quickSortWithEx(array: greater)
    } else {
        return sortedArray
    }
}


// быстрая сортировка

func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    var sortArray = array
    if sortArray.count > 1 {
    var i = 0
    var j = i
    var referenceIndex = sortArray.count - 1
    let reference = sortArray[referenceIndex]
    while j < sortArray.count - 1 - i {
            if reference <= sortArray[i] {
                sortArray[referenceIndex - j] = sortArray[i]
                j += 1
                sortArray[i] = sortArray[referenceIndex - j]
                sortArray[referenceIndex - j] = reference
            } else {
                i += 1
            }
        }
    referenceIndex = sortArray.count - 1 - j
    let equal = [sortArray[referenceIndex]]
    let leftArray = quickSort(Array(sortArray[0..<referenceIndex]))
    let rightArray = quickSort(Array(sortArray[(referenceIndex + 1)..<array.count]))
        return leftArray + equal + rightArray
    } else {
        return sortArray
    }
}

