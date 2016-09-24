extension Array where Element : Comparable {

   mutating func bubble(_ order: (Element, Element) -> Bool) -> Array {
      // 1
      var counter = -1
      // 2
      var iterations: Int = 0
      // 3
      repeat {
         // 4
         counter = 0
         // 5
         let times = self.count - (iterations + 1)
         // 6
         for x in 0..<times {
            // 7
            if order(self[x + 1], self[x]) {
               counter += 1
               swap(&self[x], &self[x + 1])
            }
         }
         // 8
         iterations += 1
         // 9
      } while counter != 0
      // 10
      return self
   }
   
   func bubbled(_ order: (Element, Element) -> Bool) -> [Element] {
      return self.check(swaps: -1, iterations: 0, order)
   }
   
   func check(swaps: Int, iterations: Int, _ order: (Element, Element) -> Bool) -> [Element] {
      guard swaps != 0 else { return self }
      let iterate = self.iterate(index: 0, max: self.count - (iterations + 1), order, swaps: 0)
      if iterate.swaps == 0 {
         return iterate.arr
      } else {
         return iterate.arr.check(swaps: iterate.swaps, iterations: iterations + 1, order)
      }
   }
   
   func iterate(index: Int, max: Int, _ order: (Element, Element) -> Bool, swaps: Int) -> (swaps: Int, arr: [Element]) {
      guard index < max else { return (swaps, self) }
      if order(self[index + 1], self[index]) {
         return self.swapper(index: index).iterate(index: index + 1, max: max, order, swaps: swaps + 1)
      }
      return iterate(index: index + 1, max: max, order, swaps: swaps)
   }
   
   func swapper(index: Int) -> Array {
      guard self.count > index + 1 else { return self }
      let begin = Array(self[0..<index]) + [self[index + 1]]
      let end = [self[index]] + Array(self[index + 2..<self.count])
      return begin + end
   }
}