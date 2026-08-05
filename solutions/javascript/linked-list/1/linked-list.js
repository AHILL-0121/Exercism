class Node {
  constructor(value) {
    this.value = value
    this.prev = null
    this.next = null
  }
}

export class LinkedList {
  constructor() {
    this.head = null
    this.tail = null
    this.length = 0
  }

  push(value) {
    const node = new Node(value)
    if (this.tail) {
      node.prev = this.tail
      this.tail.next = node
      this.tail = node
    } else {
      this.head = node
      this.tail = node
    }
    this.length++
  }

  pop() {
    if (!this.tail) return undefined
    const node = this.tail
    this.tail = node.prev
    if (this.tail) {
      this.tail.next = null
    } else {
      this.head = null
    }
    this.length--
    return node.value
  }

  shift() {
    if (!this.head) return undefined
    const node = this.head
    this.head = node.next
    if (this.head) {
      this.head.prev = null
    } else {
      this.tail = null
    }
    this.length--
    return node.value
  }

  unshift(value) {
    const node = new Node(value)
    if (this.head) {
      node.next = this.head
      this.head.prev = node
      this.head = node
    } else {
      this.head = node
      this.tail = node
    }
    this.length++
  }

  delete(value) {
    let current = this.head
    while (current) {
      if (current.value === value) {
        if (current.prev) {
          current.prev.next = current.next
        } else {
          this.head = current.next
        }
        if (current.next) {
          current.next.prev = current.prev
        } else {
          this.tail = current.prev
        }
        this.length--
        return
      }
      current = current.next
    }
  }

  count() {
    return this.length
  }
}