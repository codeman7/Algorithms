//: Playground - noun: a place where people can play

import Foundation

extension Array where Element : Comparable {
     
   func selectionSorted(_ order: (Element, Element) -> Bool) -> Array {
      guard self.count > 1 else { return self }
      return self.next(index: 0, order)
   }
   
   func next(index: Int, _ order: (Element, Element) -> Bool) -> Array {
      guard index < self.count else { return self }
      let current = self[index]
      let smallest = self.lowest(index: index, currentIndex: index, order)
      let array: [Element] = (current != self[smallest]) ? self.swapper(firstIndex: index, secondIndex: smallest) : self
      return array.next(index: index + 1, order)
   }
   
   func lowest(index: Int, currentIndex: Int, _ order: (Element, Element) -> Bool) -> Int {
      guard currentIndex < self.count else { return index }
      let smallerIndex: Int = (order(self[index], self[currentIndex])) ? index : currentIndex
      return lowest(index: smallerIndex, currentIndex: currentIndex + 1, order)
   }
   
   func swapper(firstIndex: Int, secondIndex: Int) -> Array {
      guard firstIndex < secondIndex else { return self }
      let begin = Array(self[0..<firstIndex]) + [self[secondIndex]]
      let mid = Array(self[firstIndex + 1 ..< secondIndex])
      let end = [self[firstIndex]] + Array(self[secondIndex + 1 ..< self.count])
      return begin + mid + end
   }
   
}