//
//  main.swift
//  lesson4
//
//  Created by Serg on 19/02/2019.
//  Copyright © 2019 Serg. All rights reserved.
//

import Foundation

print("sorted array by bubble sorting is \(bubbleSorting(array: [-14, 10, 53, -158, 10, 0, 49, 536]))")
print("sorted array by insertion sort is \(insertionSort(array: ["asdf", "g", "dsfa", "a", "/"]))")
print("sorted array by merge sort is \(mergeSort([-14.4, 10.234, 53, -158, 10, 0, 49, 536.3243]))")

print("sorted array by quick sort with extra arrays is \(quickSortWithEx(array: [-14, 10, 53, -158, 10, 0, 49, 536]))")

print("sorted array by quick sort is \(quickSort([4, 3, -7, 8, 5, 2, 1, 4, 9, 5, 4]))")

