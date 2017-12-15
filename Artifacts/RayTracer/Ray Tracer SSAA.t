import GUI

module Vector
    export Set, Magnitude, Normal, Normalized, Negative, Dot, Cross, Add, Mult
    %%%
    function Set (x : real, y : real, z : real) : array 1 .. 3 of real
	var v : array 1 .. 3 of real
	v (1) := x
	v (2) := y
	v (3) := z
	result v
    end Set
    %%%
    function Magnitude (v : array 1 .. 3 of real) : real
	result sqrt ((v (1) * v (1)) + (v (2) * v (2)) + (v (3) * v (3)))
    end Magnitude
    %%%
    function Normal (v : array 1 .. 3 of real) : array 1 .. 3 of real
	var vect : array 1 .. 3 of real
	var mag : real := sqrt ((v (1) * v (1)) + (v (2) * v (2)) + (v (3) * v (3)))
	if mag > 0 then
	    vect (1) := v (1) / mag
	    vect (2) := v (2) / mag
	    vect (3) := v (3) / mag
	else
	    vect (1) := v (1)
	    vect (2) := v (2)
	    vect (3) := v (3)
	end if
	result vect
    end Normal
    %%%
    function Normalized (x : real, y : real, z : real) : array 1 .. 3 of real
	var v : array 1 .. 3 of real
	v (1) := x
	v (2) := y
	v (3) := z
	v := Normal (v)
	result v
    end Normalized
    %%%
    function Negative (v : array 1 .. 3 of real) : array 1 .. 3 of real
	var vect : array 1 .. 3 of real
	vect (1) := -v (1)
	vect (2) := -v (2)
	vect (3) := -v (3)
	result vect
    end Negative
    %%%
    function Dot (v : array 1 .. 3 of real, v2 : array 1 .. 3 of real) : real
	result v (1) * v2 (1) + v (2) * v2 (2) + v (3) * v2 (3)
    end Dot
    %%%
    function Cross (v : array 1 .. 3 of real, v2 : array 1 .. 3 of real) : array 1 .. 3 of real
	var vect : array 1 .. 3 of real
	vect (1) := v (2) * v2 (3) - v (3) * v2 (2)
	vect (2) := v (3) * v2 (1) - v (1) * v2 (3)
	vect (3) := v (1) * v2 (2) - v (2) * v2 (1)
	result vect
    end Cross
    %%%
    function Add (v : array 1 .. 3 of real, v2 : array 1 .. 3 of real) : array 1 .. 3 of real
	var vect : array 1 .. 3 of real
	vect (1) := v (1) + v2 (1)
	vect (2) := v (2) + v2 (2)
	vect (3) := v (3) + v2 (3)
	result vect
    end Add
    %%%
    function Mult (v : array 1 .. 3 of real, scalar : real) : array 1 .. 3 of real
	var vect : array 1 .. 3 of real
	vect (1) := v (1) * scalar
	vect (2) := v (2) * scalar
	vect (3) := v (3) * scalar
	result vect
    end Mult
end Vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
module Colour
    export Set, Brightness, Scalar, Add, Mult, Average, Clip

    function Set (r : real, g : real, b : real, s : real) : array 1 .. 4 of real
	var col : array 1 .. 4 of real
	col (1) := r
	col (2) := g
	col (3) := b
	col (4) := s
	result col
    end Set
    %%%
    function Brightness (c : array 1 .. 4 of real) : real
	result (c (1) + c (2) + c (3)) / 3
    end Brightness
    %%%
    function Scalar (c : array 1 .. 4 of real, scalar : real) : array 1 .. 4 of real
	var col : array 1 .. 4 of real
	col (1) := c (1) * scalar
	col (2) := c (2) * scalar
	col (3) := c (3) * scalar
	col (4) := c (4)
	result col
    end Scalar
    %%%
    function Add (c : array 1 .. 4 of real, c2 : array 1 .. 4 of real) : array 1 .. 4 of real
	var col : array 1 .. 4 of real
	col (1) := c (1) + c2 (1)
	col (2) := c (2) + c2 (2)
	col (3) := c (3) + c2 (3)
	col (4) := c (4)
	result col
    end Add
    %%%
    function Mult (c : array 1 .. 4 of real, c2 : array 1 .. 4 of real) : array 1 .. 4 of real
	var col : array 1 .. 4 of real
	col (1) := c (1) * c2 (1)
	col (2) := c (2) * c2 (2)
	col (3) := c (3) * c2 (3)
	col (4) := c (4)
	result col
    end Mult
    %%%
    function Average (c : array 1 .. 4 of real, c2 : array 1 .. 4 of real) : array 1 .. 4 of real
	var col : array 1 .. 4 of real
	col (1) := (c (1) + c2 (1)) / 2
	col (2) := (c (2) + c2 (2)) / 2
	col (3) := (c (3) + c2 (3)) / 2
	col (4) := c (4)
	result col
    end Average
    %%%
    function Clip (c : array 1 .. 4 of real) : array 1 .. 4 of real
	var col : array 1 .. 4 of real
	var alllight : real := c (1) + c (2) + c (3)
	var excesslight : real := alllight - 3
	%
	if excesslight > 0 then
	    col (1) := c (1) + excesslight * (c (1) / alllight)
	    col (2) := c (2) + excesslight * (c (2) / alllight)
	    col (3) := c (3) + excesslight * (c (3) / alllight)
	else
	    col (1) := c (1)
	    col (2) := c (2)
	    col (3) := c (3)
	end if
	if col (1) > 1 then
	    col (1) := 1
	end if
	if col (2) > 1 then
	    col (2) := 1
	end if
	if col (3) > 1 then
	    col (3) := 1
	end if
	%
	if col (1) < 0 then
	    col (1) := 0
	end if
	if col (2) < 0 then
	    col (2) := 0
	end if
	if col (3) < 0 then
	    col (3) := 0
	end if
	col (4) := c (4)
	result col
    end Clip
end Colour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
module Camera
    import Vector
    export Direction, Right, Down

    function Direction (pos : array 1 .. 3 of real, look : array 1 .. 3 of real) : array 1 .. 3 of real
	result Vector.Normal (Vector.Negative (Vector.Add (pos, Vector.Negative (look))))
    end Direction
    %%%
    function Right (dir : array 1 .. 3 of real) : array 1 .. 3 of real
	var y : array 1 .. 3 of real := Vector.Set (0, 1, 0)
	result Vector.Normal (Vector.Cross (y, dir))
    end Right
    %%%
    function Down (right : array 1 .. 3 of real, dir : array 1 .. 3 of real) : array 1 .. 3 of real
	result Vector.Cross (right, dir)
    end Down
end Camera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Light
    export CreateLight, LightPosition, LightColour
    var position : array 1 .. 3 of real
    var ccolour : array 1 .. 4 of real

    procedure CreateLight (pos : array 1 .. 3 of real, col : array 1 .. 4 of real)
	position := pos
	ccolour := col
    end CreateLight
    %%%
    function LightPosition : array 1 .. 3 of real
	result position
    end LightPosition
    %%%
    function LightColour : array 1 .. 4 of real
	result ccolour
    end LightColour
end Light
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Primitive
    export CreatePrimitive, getPrimitivePN, getPrimitiveRD, getPrimitiveColour, getPrimitiveShape, findIntersection, getNormalAt
    var pos_normal : array 1 .. 3 of real
    var rad_dis : real
    var ccolour : array 1 .. 4 of real
    var shape : int
    %%%
    procedure CreatePrimitive (p : array 1 .. 3 of real, r : real, c : array 1 .. 4 of real, sh : int)
	pos_normal := p
	rad_dis := r
	ccolour := c
	shape := sh
    end CreatePrimitive
    %%%
    function getPrimitivePN : array 1 .. 3 of real
	result pos_normal
    end getPrimitivePN
    %%%
    function getPrimitiveRD : real
	result rad_dis
    end getPrimitiveRD
    %%%
    function getPrimitiveColour : array 1 .. 4 of real
	result ccolour
    end getPrimitiveColour
    %%%
    function getPrimitiveShape : int
	result shape
    end getPrimitiveShape
    %%%
    function getNormalAt (point : array 1 .. 3 of real) : array 1 .. 3 of real
	if shape = 0 then
	    result pos_normal
	elsif shape = 1 then
	    var nvect : array 1 .. 3 of real
	    %nvect := Vector.Normal (Vector.Add (point, Vector.Negative (pos_normal)))
	    var mag : real
	    nvect (1) := point (1) - pos_normal (1)
	    nvect (2) := point (2) - pos_normal (2)
	    nvect (3) := point (3) - pos_normal (3)
	    mag := sqrt (nvect (1) * nvect (1) + nvect (2) * nvect (2) + nvect (3) * nvect (3))
	    nvect (1) := nvect (1) / mag
	    nvect (2) := nvect (2) / mag
	    nvect (3) := nvect (3) / mag
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    result nvect
	end if
    end getNormalAt
    %%%
    function findIntersection (ray_origin : array 1 .. 3 of real, ray_direction : array 1 .. 3 of real) : real
	if shape = 0 then
	    %var a : real := Vector.Dot (pos_normal, ray_direction)
	    var a : real := pos_normal (1) * ray_direction (1) + pos_normal (2) * ray_direction (2) + pos_normal (3) * ray_direction (3)
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    if a = 0 then
		result - 1
	    else
		%var b : real := Vector.Dot (pos_normal, Vector.Add (ray_origin, Vector.Negative (Vector.Mult (pos_normal, rad_dis))))
		var b : real := pos_normal (1) * (ray_origin (1) - (pos_normal (1) * rad_dis)) + pos_normal (2) * (ray_origin (2) - (pos_normal (2) * rad_dis)) + pos_normal (3) * (ray_origin (3)
		    - (pos_normal (3) *
		    rad_dis))
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		var c : real := -1 * b / a
		if c > 0.00001 then
		    result c
		else
		    result - 1
		end if
	    end if
	elsif shape = 1 then
	    var b, c, discriminant : real
	    b := 2 * ((ray_origin (1) - pos_normal (1)) * ray_direction (1) + (ray_origin (2) - pos_normal (2)) * ray_direction (2) + (ray_origin (3) - pos_normal (3)) * ray_direction (3))
	    c := (ray_origin (1) - pos_normal (1)) ** 2 + (ray_origin (2) - pos_normal (2)) ** 2 + (ray_origin (3) - pos_normal (3)) ** 2 - rad_dis * rad_dis
	    discriminant := b * b - 4 * c
	    if discriminant > 0 then
		discriminant := sqrt (discriminant)
		var root_1 := ((-1 * b - discriminant) / 2) - 0.00001
		if root_1 > 0 then
		    result root_1
		else
		    var root_2 := ((discriminant - b) / 2) - 0.00001
		    result root_2
		end if
	    else
		result - 1
	    end if
	end if
    end findIntersection
end Primitive
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function winningObjIndex (obj : array 1 .. * of real) : int
    %
    var objCount : int := upper (obj)
    if objCount = 0 then
	result - 1
    else
	%
	if objCount = 1 then
	    if obj (1) > 0 then
		result 1
	    else
		result - 1
	    end if
	    %
	else
	    var min_index : int
	    var maxi : real := 0
	    for i : 1 .. objCount
		if maxi < obj (i) then
		    maxi := obj (i)
		end if
	    end for
	    %
	    if maxi > 0 then
		for i : 1 .. objCount
		    if obj (i) > 0 and obj (i) <= maxi then
			maxi := obj (i)
			min_index := i
		    end if
		end for
		result min_index
	    else
		result - 1
	    end if
	end if
    end if
end winningObjIndex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function getColourAt (pos : array 1 .. 3 of real, dir : array 1 .. 3 of real, object : array 1 .. * of ^Primitive,
	winningIndex : int, lights : array 1 .. * of ^Light, accuracy : real,
	ambientlight : real) : array 1 .. 4 of real
    %%%
    var mag : real
    var objCount : int := upper (object)
    var winning_object_colour : array 1 .. 4 of real := object (winningIndex) -> getPrimitiveColour
    var winning_object_normal : array 1 .. 3 of real := object (winningIndex) -> getNormalAt (pos)
    %var final_colour : array 1 .. 4 of real := Colour.Scalar (winning_object_colour, ambientlight)
    var final_colour : array 1 .. 4 of real
    final_colour (1) := winning_object_colour (1) * ambientlight
    final_colour (2) := winning_object_colour (2) * ambientlight
    final_colour (3) := winning_object_colour (3) * ambientlight
    final_colour (4) := winning_object_colour (4)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    var ref_dir : array 1 .. 3 of real

    if winning_object_colour (4) > 0 and winning_object_colour (4) <= 1 then
	%ref_dir := Vector.Normal (Vector.Add (Vector.Negative (dir),
	%    Vector.Mult (Vector.Add (Vector.Mult (winning_object_normal,
	%    Vector.Dot (winning_object_normal,
	%    Vector.Negative (dir))), dir), 2)))
	ref_dir (1) := -dir (1) + (((winning_object_normal (1) * (winning_object_normal (1) * (-dir (1)) + winning_object_normal (2) * (-dir (2)) + winning_object_normal (3) * (-dir (3)))) +
	    dir (1))
	    * 2)
	ref_dir (2) := -dir (2) + (((winning_object_normal (2) * (winning_object_normal (1) * (-dir (1)) + winning_object_normal (2) * (-dir (2)) + winning_object_normal (3) * (-dir (3)))) +
	    dir (2))
	    * 2)
	ref_dir (3) := -dir (3) + (((winning_object_normal (3) * (winning_object_normal (1) * (-dir (1)) + winning_object_normal (2) * (-dir (2)) + winning_object_normal (3) * (-dir (3)))) +
	    dir (3))
	    * 2)
	mag := sqrt (ref_dir (1) * ref_dir (1) + ref_dir (2) * ref_dir (2) + ref_dir (3) * ref_dir (3))
	ref_dir (1) := ref_dir (1) / mag
	ref_dir (2) := ref_dir (2) / mag
	ref_dir (3) := ref_dir (3) / mag
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	var ref_intersections : array 1 .. objCount of real
	for r_index : 1 .. objCount
	    if r_index not= winningIndex then
		ref_intersections (r_index) := object (r_index) -> findIntersection (pos, ref_dir)
	    else
		ref_intersections (r_index) := -1
	    end if
	end for

	var index_of_winning_ref : int := winningObjIndex (ref_intersections)

	if index_of_winning_ref not= -1 then
	    if ref_intersections (index_of_winning_ref) > accuracy then
		%var ref_int_pos : array 1 .. 3 of real := Vector.Add (pos, Vector.Mult (ref_dir, ref_intersections (index_of_winning_ref)))
		var ref_int_pos : array 1 .. 3 of real
		ref_int_pos (1) := pos (1) + ref_dir (1) * ref_intersections (index_of_winning_ref)
		ref_int_pos (2) := pos (2) + ref_dir (2) * ref_intersections (index_of_winning_ref)
		ref_int_pos (3) := pos (3) + ref_dir (3) * ref_intersections (index_of_winning_ref)
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		var ref_colour : array 1 .. 4 of real := getColourAt (ref_int_pos, ref_dir, object, index_of_winning_ref, lights, accuracy, ambientlight)
		%final_colour := Colour.Add (final_colour, Colour.Scalar (ref_colour, winning_object_colour (4)))
		final_colour (1) := final_colour (1) + ref_colour (1) * winning_object_colour (4)
		final_colour (2) := final_colour (2) + ref_colour (2) * winning_object_colour (4)
		final_colour (3) := final_colour (3) + ref_colour (3) * winning_object_colour (4)
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    end if
	end if
    end if
    %
    var light_direction, lightPos : array 1 .. 3 of real
    var cosine_angle : real
    var shadowed : boolean
    var distance_to_light_magnitude : real
    var secondary_intersections : array 1 .. objCount of real
    %
    for light : 1 .. upper (lights)
	%light_direction := Vector.Normal (Vector.Add (lights (light) -> LightPosition, Vector.Negative (pos)))
	lightPos := lights (light) -> LightPosition
	light_direction (1) := lightPos (1) - pos (1)
	light_direction (2) := lightPos (2) - pos (2)
	light_direction (3) := lightPos (3) - pos (3)
	mag := sqrt (light_direction (1) * light_direction (1) + light_direction (2) * light_direction (2) + light_direction (3) * light_direction (3))
	light_direction (1) := light_direction (1) / mag
	light_direction (2) := light_direction (2) / mag
	light_direction (3) := light_direction (3) / mag
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%
	%cosine_angle := Vector.Dot (winning_object_normal, light_direction)
	cosine_angle := winning_object_normal (1) * light_direction (1) + winning_object_normal (2) * light_direction (2) + winning_object_normal (3) * light_direction (3)
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if cosine_angle > 0 then

	    shadowed := false
	    %distance_to_light_magnitude := Vector.Magnitude (light_direction)
	    distance_to_light_magnitude := sqrt (light_direction (1) * light_direction (1) + light_direction (2) * light_direction (2) + light_direction (3) * light_direction (3))
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
	    if shadowed = false then
		for i : 1 .. objCount
		    if i not= winningIndex then
			secondary_intersections (i) := object (i) -> findIntersection (pos, light_direction)
		    else
			secondary_intersections (i) := -1
		    end if
		end for
	    end if

	    for c : 1 .. objCount
		if secondary_intersections (c) > accuracy then     %
		    if secondary_intersections (c) <= distance_to_light_magnitude then
			shadowed := true
			exit when shadowed = true
		    end if
		end if
	    end for

	    var lightColour : array 1 .. 4 of real := lights (light) -> LightColour
	    if shadowed = false then
		%final_colour := Colour.Add (final_colour, Colour.Mult (winning_object_colour, Colour.Scalar (lights (light) -> LightColour, cosine_angle)))
		final_colour (1) := final_colour (1) + winning_object_colour (1) * (lightColour (1) * cosine_angle)
		final_colour (2) := final_colour (2) + winning_object_colour (2) * (lightColour (2) * cosine_angle)
		final_colour (3) := final_colour (3) + winning_object_colour (3) * (lightColour (3) * cosine_angle)
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		if winning_object_colour (4) > 0 and winning_object_colour (4) <= 1 then
		    var specular : real := Vector.Dot (ref_dir, light_direction)
		    if specular > 0 then
			specular := specular ** 10
			%final_colour := Colour.Add (final_colour, Colour.Scalar (lights (light) -> LightColour, (specular * winning_object_colour (4))))
			final_colour (1) := final_colour (1) + lightColour (1) * (specular * winning_object_colour (4))
			final_colour (2) := final_colour (2) + lightColour (2) * (specular * winning_object_colour (4))
			final_colour (3) := final_colour (3) + lightColour (3) * (specular * winning_object_colour (4))
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		    end if
		end if
	    end if
	end if
    end for
    %final_colour := Colour.Clip (final_colour)
    var alllight : real := final_colour (1) + final_colour (2) + final_colour (3)
    var excesslight : real := alllight - 3
    %
    if excesslight > 0 then
	final_colour (1) := final_colour (1) + excesslight * (final_colour (1) / alllight)
	final_colour (2) := final_colour (2) + excesslight * (final_colour (2) / alllight)
	final_colour (3) := final_colour (3) + excesslight * (final_colour (3) / alllight)
    end if
    %
    if final_colour (1) > 1 then
	final_colour (1) := 1
    end if
    if final_colour (2) > 1 then
	final_colour (2) := 1
    end if
    if final_colour (3) > 1 then
	final_colour (3) := 1
    end if
    %
    if final_colour (1) < 0 then
	final_colour (1) := 0
    end if
    if final_colour (2) < 0 then
	final_colour (2) := 0
    end if
    if final_colour (3) < 0 then
	final_colour (3) := 0
    end if
    %
    result final_colour
end getColourAt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%   Camera  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var camPos, look_at, camDir, camRight, camDown : array 1 .. 3 of real
camPos := Vector.Set (-16, 6, 0)
look_at := Vector.Set (0, 0, 0)
camDir := Camera.Direction (camPos, look_at)
camRight := Camera.Right (camDir)
camDown := Camera.Down (camRight, camDir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%   Lights   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var lightCount : int := 1 % amount of lights to make
var lights : array 1 .. lightCount of ^Light
%
for i : 1 .. lightCount
    new lights (i)
end for
% lights (i) -> CreateLight ((x,y,z),(r,g,b,s))
lights (1) -> CreateLight (Vector.Set (0, 6, 0), Colour.Set (0.3, 0.3, 0.3, 0))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%     Objects   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var objCount : int := 13 % Amount of objects u create
var object : array 1 .. objCount of ^Primitive
%
for i : 1 .. objCount
    new object (i)
end for
% object (i) -> CreatePrimtive ((x,y,z),r,(r,g,b,s),shape)
% shape 0, plane
% shape 1, sphere
% colour s, reflectiveness 0= none 1=full
object (1) -> CreatePrimitive (Vector.Set (0, -1, 0), 1, Colour.Set (1, 1, 1, 1), 0)
object (2) -> CreatePrimitive (Vector.Set (0, 0, -10), 1, Colour.Set (1, 0, 0, 0), 1)
object (3) -> CreatePrimitive (Vector.Set (0, 0, -8), 1, Colour.Set (0, 1, 0, 0.1), 1)
object (4) -> CreatePrimitive (Vector.Set (0, 0, -6), 1, Colour.Set (0, 0, 1, 0.2), 1)
object (5) -> CreatePrimitive (Vector.Set (0, 0, -4), 1, Colour.Set (1, 1, 0, 0.3), 1)
object (6) -> CreatePrimitive (Vector.Set (0, 0, -2), 1, Colour.Set (0, 1, 1, 0.4), 1)
object (7) -> CreatePrimitive (Vector.Set (0, 0, 0), 1, Colour.Set (1, 1, 1, 0.5), 1)
object (8) -> CreatePrimitive (Vector.Set (0, 0, 2), 1, Colour.Set (0, 1, 1, 0.6), 1)
object (9) -> CreatePrimitive (Vector.Set (0, 0, 4), 1, Colour.Set (1, 1, 0, 0.7), 1)
object (10) -> CreatePrimitive (Vector.Set (0, 0, 6), 1, Colour.Set (0, 0, 1, 0.8), 1)
object (11) -> CreatePrimitive (Vector.Set (0, 0, 8), 1, Colour.Set (0, 1, 0, 0.9), 1)
object (12) -> CreatePrimitive (Vector.Set (0, 0, 10), 1, Colour.Set (1, 0, 0, 1), 1)
object (13) -> CreatePrimitive (Vector.Set (1, 0, 0), 2, Colour.Set (1, 1, 1, 1), 0)
%%%%%%%%%%%%%%Ray/Intersection Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var cam_ray_direction : array 1 .. 3 of real
var intersection_pos, intersection_ray_dir : array 1 .. 3 of real
var intersection_colour : array 1 .. 4 of real
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Basic Variables
const width : int := 640
const height : int := 480
var thisone : int
var xamnt, yamnt : real
var aspectratio : real := width / height
var intersections : array 1 .. objCount of real
var winningIndex : int
var accuracy : real := 0.00001
var ambientlight : real := 0.2
var mag : real
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Get Info GUI
var guiwindow : int := Window.Open ("graphics:640;480")
var aadepth : int := 1
var aafield, aalabel : int
procedure changeaa (text : string)
    var ntext : string := ""
    for i : 1 .. length (text)
	if ord (text (i)) > 47 and ord (text (i)) < 58 then
	    ntext += text (i)
	end if
    end for
    if ntext not= "" then
	aadepth := strint (ntext)
	drawfillbox (110, 10, 157, 25, white)
	GUI.SetLabel (aalabel, ntext + "x SSAA")
	GUI.SetText (aafield, ntext)
    end if
end changeaa
%
procedure quuit
    Window.Close (guiwindow)
    quit
end quuit
%
aalabel := GUI.CreateLabel (100, 13, intstr (aadepth) + "x SSAA")
aafield := GUI.CreateTextFieldFull (160, 13, 50, intstr (aadepth), changeaa, GUI.INDENT, 0, 0)
var cont : int := GUI.CreateButton (8, 10, 0, "Continue", GUI.Quit)
var quitBtn : int := GUI.CreateButton (576, 10, 0, "Quit", quuit)

var textbox := GUI.CreateTextBoxFull (10, 40, 620, 430,
    GUI.INDENT, 0)

procedure getlight (i : int)
    var temp : array 1 .. 3 of real := lights (i) -> LightPosition
    var temp2 : array 1 .. 4 of real := lights (i) -> LightColour
    var line : string
    line := "Light " + intstr (i) + " at (" + realstr (temp (1), 4) + ", " + realstr (temp (2), 4) + ", " + realstr (temp (3), 4) + ") with Colour: (R: " + realstr (floor (temp2 (1) * 255), 4) +
	", G: " +
	realstr (floor (temp2 (2) * 255), 4) + ", B: " + realstr (floor (temp2 (3) * 255), 4) + ", S: " + realstr (temp2 (4), 4) + ")"
    GUI.AddLine (textbox, line)
end getlight
%
procedure getshape (i : int)
    var temp : array 1 .. 3 of real := object (i) -> getPrimitivePN
    var temp2 : array 1 .. 4 of real := object (i) -> getPrimitiveColour
    var t : real := object (i) -> getPrimitiveRD
    var t2 : real := object (i) -> getPrimitiveShape
    var ty, pn, rd, line : string
    if t2 = 0 then
	ty := "Plane"
	pn := "Normal of"
	rd := "Distance of"
    elsif t2 = 1 then
	ty := "Sphere"
	pn := "Center at"
	rd := "Radius of"
    end if
    line := ty + ": " + pn + " (" + realstr (temp (1), 4) + ", " + realstr (temp (2), 4) + ", " + realstr (temp (3), 4) + ") and " + rd + realstr (t, 4) + " with Colour: (R: " +
	realstr (floor (temp2 (1) *
	255), 4) +
	", G: " +
	realstr (floor (temp2 (2) * 255), 4) + ", B: " + realstr (floor (temp2 (3) * 255), 4) + ", S: " + realstr (temp2 (4), 4) + ")"
    GUI.AddLine (textbox, line)
end getshape
%
var line : string
line := "Resolution: " + intstr (width) + "x" + intstr (height)
GUI.AddLine (textbox, line)
line := "Ambient Light: " + realstr (ambientlight, 4)
GUI.AddLine (textbox, line)
line := ""
GUI.AddLine (textbox, line)
line := "Camera at: (" + realstr (camPos (1), 4) + ", " + realstr (camPos (2), 4) + ", " + realstr (camPos (3), 4) + ")"
GUI.AddLine (textbox, line)
line := "Camera looking at: (" + realstr (look_at (1), 4) + "," + realstr (look_at (2), 4) + "," + realstr (look_at (3), 4) + ")"
GUI.AddLine (textbox, line)
line := ""
GUI.AddLine (textbox, line)
line := intstr (lightCount) + " Light(s)"
GUI.AddLine (textbox, line)
for i : 1 .. lightCount
    getlight (i)
end for
line := ""
GUI.AddLine (textbox, line)
line := intstr (objCount) + " Shape(s)"
GUI.AddLine (textbox, line)
for i : 1 .. objCount
    getshape (i)
end for

loop
    exit when GUI.ProcessEvent
end loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%AA variables
var aaindex : int
var aathreshold : real := 0.1
var aalev : int := aadepth ** 2
var AR, AG, AB : array 0 .. aalev - 1 of real
var TR, TG, TB : real
%%%%%%%%%%%%%%%%%%%
Window.Close (guiwindow)
View.Set ("graphics:" + intstr (width) + ";" + intstr (height) + ",nobuttonbar,offscreenonly")
var endtime, ctime1, ctime2 : int
var ctt, btt : real := 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Assign for variables
var h_y : real := height + 0.5
var w_a : real := aspectratio / width
var x_w : real := (width - height) / height / 2
var h_a : real := height * aspectratio
var y_h : real := (height - width) / width / 2
var a_j : int := aadepth - 1


var starttime : int := Time.Elapsed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for x : 0 .. width - 1
    for y : 0 .. height - 1
	thisone := y * width + x
	%
	for aax : 0 .. aadepth - 1
	    for aay : 0 .. aadepth - 1
		aaindex := aay * aadepth + aax
		%
		if aadepth = 1 then
		    if width > height then
			xamnt := ((x + 0.5) * w_a) - x_w
			yamnt := (h_y - y) / height
		    elsif height > width then
			xamnt := (x + 0.5) / width
			yamnt := ((h_y - y) / h_a) - y_h
		    else
			xamnt := (x + 0.5) / width
			yamnt := (h_y - y) / height
		    end if
		else
		    if width > height then
			xamnt := (x + aax / a_j) * w_a - x_w
			yamnt := ((height - y) + aax / a_j) / height
		    elsif height > width then
			xamnt := (x + aax / a_j) / width
			yamnt := ((height - y) + aax / a_j) / h_a - y_h
		    else
			xamnt := (x + aax / a_j) / width
			yamnt := ((height - y) + aax / a_j) / height
		    end if
		end if

		%cam_ray_direction := Vector.Normal (Vector.Add (Vector.Add (camDir, Vector.Mult (camRight, xamnt - 0.5)), Vector.Mult (camDown, yamnt - 0.5)))
		cam_ray_direction (1) := camDir (1) + camRight (1) * (xamnt - 0.5) + camDown (1) * (yamnt - 0.5)
		cam_ray_direction (2) := camDir (2) + camRight (2) * (xamnt - 0.5) + camDown (2) * (yamnt - 0.5)
		cam_ray_direction (3) := camDir (3) + camRight (3) * (xamnt - 0.5) + camDown (3) * (yamnt - 0.5)
		mag := sqrt (cam_ray_direction (1) * cam_ray_direction (1) + cam_ray_direction (2) * cam_ray_direction (2) + cam_ray_direction (3) * cam_ray_direction (3))
		cam_ray_direction (1) := cam_ray_direction (1) / mag
		cam_ray_direction (2) := cam_ray_direction (2) / mag
		cam_ray_direction (3) := cam_ray_direction (3) / mag
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		for i : 1 .. objCount
		    intersections (i) := object (i) -> findIntersection (camPos, cam_ray_direction)
		end for
		winningIndex := winningObjIndex (intersections)
		%
		if winningIndex = -1 then
		    AR (aaindex) := 0
		    AG (aaindex) := 0
		    AB (aaindex) := 0
		else
		    if intersections (winningIndex) > accuracy then
			%intersection_pos := Vector.Add (camPos, Vector.Mult (cam_ray_direction, intersections (winningIndex)))
			intersection_pos (1) := camPos (1) + cam_ray_direction (1) * intersections (winningIndex)
			intersection_pos (2) := camPos (2) + cam_ray_direction (2) * intersections (winningIndex)
			intersection_pos (3) := camPos (3) + cam_ray_direction (3) * intersections (winningIndex)
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			intersection_colour := getColourAt (intersection_pos, cam_ray_direction, object, winningIndex, lights, accuracy, ambientlight)
			AR (aaindex) := intersection_colour (1)
			AG (aaindex) := intersection_colour (2)
			AB (aaindex) := intersection_colour (3)
		    end if
		end if
		%
	    end for
	end for     %AA
	if aadepth = 1 then
		RGB.SetColour (255, AR (0), AG (0), AB (0))
		drawdot (x, y, 255)
	else
	    TR := 0
	    TG := 0
	    TB := 0
	    for i : 0 .. aalev - 1
		TR := TR + AR (i)
		TG := TG + AG (i)
		TB := TB + AB (i)
	    end for
	    TR := TR / aalev
	    TG := TG / aalev
	    TB := TB / aalev
		RGB.SetColour (255, TR, TG, TB)
		drawdot (x, y, 255)
	end if
    end for
    View.UpdateArea (x, 0, x, maxy)
end for
%
endtime := Time.Elapsed
var popup := Window.Open ("graphics:300;300,nobuttonbar")
put (endtime - starttime) / 1000, " Seconds"
