@f1 = ->(x1,x2) { x1 - Math.cos(x2) - 3 }
@f2 = ->(x1,x2) { x2 - Math.sin(x1) - 3}
@f11 = ->(x1,x2) { 1 }
@f22 = ->(x1,x2) { 1 }
@f12 = ->(x1,x2) { Math.sin(x2) }
@f21 = ->(x1,x2) { -Math.cos(x1) }
