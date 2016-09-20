import Foundation

extension Array where Element : Comparable {

   
   /// Uses insertion sort to sort through an array
   ///
   /// - parameter order: Weather we want to have the return array from largest to smallest or smallest to largest
   ///
   /// - returns: A sorted array in whatever version we wanted it
   func insertionSorted(_ order: (Element, Element) -> Bool) -> Array {
      
      guard self.count > 1 else { return self }
      
      return self.next(sorted: [], unsorted: self, order)
      
   }
   
   
   /// Takes an unsorted array and a empty sorted array and continues to call itself until the sorted array contains all of the unsorted array's elements
   ///
   /// - parameter sorted:   The current version of the sorted array
   /// - parameter unsorted: The current version of the unsorted array
   /// - parameter order:    The order we are going in either accending or decending
   ///
   /// - returns: The sorted array
   func next(sorted: Array, unsorted: Array, _ order: (Element, Element) -> Bool) -> Array {
      
      guard unsorted.count > 0 else { return sorted }
      
      let sort = (sorted.count > 0) ? sorted.insert(value: unsorted[0], at: sorted.count - 1, order) : [unsorted[0]]
      let unsort = Array(unsorted[1 ..< unsorted.count])
      return self.next(sorted: sort, unsorted: unsort, order)
      
   }
   
   
   /// Inserts the value at the index appropriate
   ///
   /// - parameter value: The value that will be placed into the current array
   /// - parameter index: The current index we are checking against
   /// - parameter order: If we are going in accending or decending order
   ///
   /// - returns: Sorted array
   func insert(value: Element, at index: Int, _ order: (Element, Element) -> Bool) -> Array {
      // If we are at index 0 then at value at either index 0 or 1
      guard index > 0 else {
         return order(self[index], value) ? [self[0]] + [value] + self[1..<self.count] : [value] + self
      }
      
      // Check if the value is above or below what we are looking for if it is then insert it into the array
      if order(self[index], value) {
         let begin = Array(self[0..<index + 1]) + [value]
         let end = Array(self[index + 1..<self.count])
         return begin + end
      } else {
         // If not then try again
         return self.insert(value: value, at: index - 1, order)
      }
      
   }
   
   mutating func insertionSort(_ order: (Element, Element) -> Bool) -> Array {
      // Make sure we don't have just 1 item
      guard self.count > 1 else { return self }
      
      // Iterate from 1 to end
      for a in 1..<self.count {
         // Copy current iteration
         var b = a
         // Get value for current iteration
         let temp = self[b]
         // Keep going as long as we aren't at first index and the temporary 1 is lower than the next index
         while b > 0 && order(temp, self[b - 1]) {
            // Set the value to the next index
            self[b] = self[b - 1]
            // Lower the index
            b -= 1
         }
         // Set the value for the index we needed to what value
         self[b] = temp
      }
      
      // Return the array
      return self
   }
 
}