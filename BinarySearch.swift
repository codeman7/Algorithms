
extension Array where Element : Comparable, Element : Equatable {
   
   func binarySearch(for element: Element) -> Bool {
      // Sort the array and get the middle element
      let array = self.sorted()
      let mid = array.count / 2
      let current = array[mid]
      
      // Check weather the element in the middle is the element we are search for
      guard current != element else {
         return true
      }
      
      // If there are only two elements in the array check if the second element is the element we are searching for
      if array.count == 2 { return element == array[1] }
      
      // Create a range for the next array
      let range: Range<Int> = (current > element) ? 0 ..< mid : mid ..< array.count
      
      // Recall function with new array
      return Array(array[range]).binarySearch(for: element)
      
   }
}