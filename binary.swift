final class Binary<A : Comparable & Equatable> {
   
   let root: A
   var size: Int
   //var min: Int
   //var max: Int
   var left: Binary?
   var right: Binary?
   
   init(_ root: A) {
      self.root = root
      self.size = 1
      //self.min = root
      //self.max = root
      self.left = nil
      self.right = nil
   }
   
   func insert(_ node: A) -> Binary {
      self.size = self.size + 1
      if node < root {
         if let l = left {
            //self.min = node
            return l.insert(node)
         } else {
            self.left = Binary(node)
            //self.min = node
            return self
         }
      } else {
         if let r = right {
            //self.max = node
            return r.insert(node)
         } else {
            self.right = Binary(node)
            //self.max = node
            return self
         }
      }
   }
   
   func lookup(_ value: A) -> Bool {
      if self.root == value {
         return true
      } else if self.root > value {
         if let l = left {
            return l.lookup(value)
         } else {
            return false
         }
      } else {
         if let r = right {
            return r.lookup(value)
         } else {
            return false
         }
      }
   }
}

let a = Binary(5)
a.insert(1)
a.insert(9)
a.insert(3)
a.insert(10)
a.insert(100)
a.insert(-1)
a.insert(-3)
a.insert(-5)
a.left?.left?.left?.root

let b = Binary("Hello")
b.insert("World")
b.insert("Monkey")
b.right?.left?.root
