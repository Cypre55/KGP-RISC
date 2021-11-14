# Assignment 7

# Group No. 42

# Members: 	Seemant Guruprasad Achari 	19CS10055
#			Chappidi Yoga Satwik 		19CS30013

# C Program

# gcd(int a, int b){
#     if(b==0) return a;
#     if(a<b){
#         int t=a;
#         a=b;
#         b=t;
#     }

#     return gcd(a-b,b);

# }

# int main(){
#     int x=111, y=37;
#     int ans=gcd(111,37);
# }



# Register description

# $0 is $sp
# $1 is $rbp

# $2 is $t0
# $3 is $t1
# $4 is $t2
# $5 is $t3

# $10 is arg1
# $11 is arg2
# $12 is arg3
# $13 is arg4

# $14 is return

# $31 is $ra






.main
xor   $0, $0
xor   $1, $1
addi    $0, 3

xor   $10, $10
lw    $10, 0($1)

xor   $11, $11
lw    $11, 1($1)

bl    gcd

b       end 

.gcd

addi  $0, 1
sw    $31, -1($0)

addi  $0, 1
sw    $1, -1($0)


xor $1, $1
add $1, $0



bz  $11, return_a

comp $2, $11

xor $3, $3
add $3, $10
add  $3, $2

bltz $3, swap
b    recur_call

.swap
xor $4, $4
add $4, $10
xor $10, $10
add $10, $11
xor $11, $11
add $11, $4

.recur_call
comp  $2, $11
add  $10, $2

bl   gcd

b return


.return_a
xor $14, $14
add $14, $10

addi $1, 10
addi $1, -10

b return



.return

lw $1, -1($0)
addi $0, -1

lw $31, -1($0)
addi $0, -1

br $31

.end
sw    $14, 2($1)