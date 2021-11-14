# Assignment 7

# Group No. 42

# Members: 	Seemant Guruprasad Achari 	19CS10055
#			Chappidi Yoga Satwik 		19CS30013



# The following is the assembly code for a recursive gcd function to test the return mechanism,
# the arithmetic operations, branching and read and write form the memory

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
xor   $0, $0            #setting $sp <- 0
xor   $1, $1            #setting $rbp <- 0
addi    $0, 3           #creating space for local variables

xor   $10, $10          
lw    $10, 0($1)        #loading the arguments from memory

xor   $11, $11
lw    $11, 1($1)

bl    gcd               #calling gcd

b       end             #proceeding to set final answer

.gcd                    #the gcd function

addi  $0, 1             #storing the return address to be restored later
sw    $31, -1($0)       

addi  $0, 1             #storing the base pointer to be restored later
sw    $1, -1($0)


xor $1, $1              #updating the base pointer
add $1, $0



bz  $11, return_a       #if b==0 then proceed to return a

comp $2, $11            #$2 <- (-b)

xor $3, $3              #$3 <- 0
add $3, $10             #$3 <- a
add  $3, $2             #$3 <- a-b

bltz $3, swap           # if a-b<0 then swap a and b
b    recur_call         # making the recursive call

.swap                   # swapping $10 and $11
xor $4, $4
add $4, $10
xor $10, $10
add $10, $11
xor $11, $11
add $11, $4

.recur_call             # gcd (a-b, b)
comp  $2, $11           # setting $10 to be a-b
add  $10, $2

bl   gcd                #calling gcd again on a-b, b

b return                # proceeding to return


.return_a               #return a
xor $14, $14            # $14 <- a
add $14, $10

b return                #proceed to return



.return

lw $1, -1($0)           #restoring the value of $rbp
addi $0, -1

lw $31, -1($0)          #restoring the value of $31
addi $0, -1

br $31                  # register jump to the return address of callee

.end
sw    $14, 2($1)        # storing the final answer in memory location 3