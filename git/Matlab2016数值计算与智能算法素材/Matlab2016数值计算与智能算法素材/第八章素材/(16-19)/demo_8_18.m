[X,tol]=budongdian_system(@mybudongdian,[1 0.1],800)
x=fsolve(@mybudongdian,[1,0.1])