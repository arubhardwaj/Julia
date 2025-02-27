@testset "Math" begin

@testset "Math: abs.jl(Absolute Value) " begin
    @test abs_val(-100) == 100
    @test abs_val(0) == 0
    @test abs(123.1) ==123.1
    @test (-1000 == abs_val(-1000)) == false
    @test (1000 == abs_val(1000)) == true

    @test abs_max([1,3,4]) == 4
    @test abs_max([-3,1,2]) == -3
    @test abs_max([-7,-3,6]) == -7
    
    @test abs_min([1,3,4]) == 1
    @test abs_min([-3,1,2]) == 1
    @test abs_min([-7,-3,6]) == -3
end

@testset "Math: Area Under Curve" begin
    # Area by Trapazoid rule
    @test trapazoidal_area(x -> 5, 12, 14, 1000) == 10.00000000000334
	@test trapazoidal_area(x -> 9 * x^2, -4, 0, 1000) == 192.0000960000001
	@test trapazoidal_area(x -> 9 * x^2, -4, 4, 1000) == 384.0007680000011
end
@testset "Math: Area" begin
    @test surfarea_cube(1) == 6
    @test surfarea_cube(3) == 54
    @test_throws DomainError surfarea_cube(-1) 

    @test surfarea_sphere(5) == 314.1592653589793
    @test surfarea_sphere(1) == 12.566370614359172
    @test_throws DomainError surfarea_sphere(-1) 

    @test area_rectangle(10,20) == 200
    @test_throws DomainError area_rectangle(-1,-2)
    @test_throws DomainError area_rectangle(1,-2)
    @test_throws DomainError area_rectangle(-1,2)

    @test area_square(10) == 100
    @test_throws DomainError area_square(-1) 

    @test area_triangle(10,10) == 50.0
    @test_throws DomainError area_triangle(-1,-2)
    @test_throws DomainError area_triangle(1,-2)
    @test_throws DomainError area_triangle(-1,2)

    @test area_heron_triangle(5,12,13) == 30.0
    @test_throws DomainError area_heron_triangle(-1,-2,1)
    @test_throws DomainError area_heron_triangle(1,-2,1)
    @test_throws DomainError area_heron_triangle(-1,2,1)

    @test area_parallelogram(10,20) == 200
    @test_throws DomainError area_parallelogram(-1,-2)
    @test_throws DomainError area_parallelogram(1,-2)
    @test_throws DomainError area_parallelogram(-1,2)

    @test area_trapezium(10, 20, 30) == 450.0
    @test_throws DomainError area_trapezium(-1, -2, -3)
    @test_throws DomainError area_trapezium(-1, 2, 3)
    @test_throws DomainError area_trapezium(1, -2, 3)

    @test area_circle(20) == 1256.6370614359173
    @test_throws DomainError area_circle(-1) 

    @test area_ellipse(10, 10) == 314.1592653589793
    @test area_ellipse(10, 20) == 628.3185307179587
    @test_throws DomainError area_ellipse(1, -2) 
    @test_throws DomainError area_ellipse(-1, 2) 
    @test_throws DomainError area_ellipse(-1, -2) 

    @test area_rhombus(10, 20) == 100.0
    @test_throws DomainError area_rhombus(-1,-2)
    @test_throws DomainError area_rhombus(1,-2)  
    @test_throws DomainError area_rhombus(-1,2)  
end

@testset "Math: Armstrong Number" begin
    x = 370     # an armstrong number
    @test is_armstrong(x) == true
    x = 225     # Not an armstrong number
    @test is_armstrong(x) == false
    x = -23     # Not an armstrong number
    @test is_armstrong(x) == false
    x = 153     # an armstrong number
    @test is_armstrong(x) == true
    x = 0       # an armstrong number
    @test is_armstrong(x) == true
    x = 12      # Not an armstrong number
    @test is_armstrong(x) == false
end

@testset "Math: Average Mean" begin
    @test mean([3, 6, 9, 12, 15, 18, 21]) == 12.0
    @test mean([5, 10, 15, 20, 25, 30, 35]) == 20.0
    @test mean([1, 2, 3, 4, 5, 6, 7, 8])  == 4.5
end

@testset "Math: Average Mode" begin
    @test mode([2, 3, 4, 5, 3, 4, 2, 5, 2, 2, 4, 2, 2, 2]) == [2]
    @test mode([3, 4, 5, 3, 4, 2, 5, 2, 2, 4, 4, 2, 2, 2]) == [2]
    @test mode([3, 4, 5, 3, 4, 2, 5, 2, 2, 4, 4, 4, 2, 2, 4, 2]) == [4, 2]
    @test mode(["x", "y", "y", "z"]) == ["y"]
    @test mode(["x", "x" , "y", "y", "z"]) == ["x", "y"]
end

@testset "Math: Average Median" begin
    @test median([2,1,3,4]) == 2.5
    @test median([2, 70, 6, 50, 20, 8, 4]) == 8
    @test median([0]) == 0
end

@testset "Math: ceil_floor" begin
    @test ceil_val(1.3) == 2.0
    @test ceil_val(2.0) == 2.0
    @test ceil_val(-1.5) == -1.0

    @test floor_val(1.3) == 1
    @test floor_val(2.0) == 2.0
    @test floor_val(-1.7) == -2.0
end

@testset "Math: Collatz Sequence" begin
    @test collatz_sequence(3) == [3,10,5,16,8,4,2,1]
	@test collatz_sequence(42) == [42,21,64,32,16,8,4,2,1]
	@test collatz_sequence(5) == [5,16,8,4,2,1]
end

@testset "Math: Euler Method" begin
    @test euler_method((x, t) -> x, 1, (0, 5))[1][end] == 143.33937864611195
end

@testset "Math: Line Length" begin
    # Arc Lengths
    @test line_length(x -> x, 0, 1, 10) == 1.4142135623730947
	@test line_length(x -> 1, -5.5, 4.5) == 9.999999999999977
	@test line_length(x -> sin(5 * x) + cos(10 * x) + 0.1 * x^2, 0, 10, 10000) == 69.53493003183544
end

@testset "Math: SIR Model" begin
    # TODO: implement tests

    #initian conditions
    p = [0.5/7900000.0,0.33]
    u0 = [7900000.0,10.0,0.0]
    tspan = (0.0,140.0)

    #solve
    sir = ODEProblem(SIR,u0,tspan,p)
    sol = solve(sir)

    #plot
    plot(sol)
end

end