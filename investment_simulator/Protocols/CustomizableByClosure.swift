protocol CustomizableByClosure {
  func customInit<T>(_ value: T, _ completion: (_ object: T) -> Void) -> T
}

extension CustomizableByClosure {
  func customInit<T>(_ value: T, _ completion: (_ object: T) -> Void) -> T {
    completion(value)
    return value
  }
}
