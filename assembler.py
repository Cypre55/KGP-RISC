#!/usr/bin/python

#//////////////////////////////////////////////////////////////////////////////////
#// Assignment 7
#//
#//Group No.42
#//Members: 	Seemant Guruprasad Achari 	19CS10055
#//			    Chappidi Yoga Satwik 		19CS30013
#// 
#// 
#// 
#//////////////////////////////////////////////////////////////////////////////////
import sys
import re
from bitarray import bitarray

labels = {}
file_name = "instructions.coe"

total = 0

def parselabels(fn):
    linenum = 0
    with open(sys.argv[1]) as f:
        for line in f:
            line = line.replace('\n', '').replace('\r', '')
            
            if line == "":
                continue
            
            if line[0] == '#':
                continue

            if line[0] == '.':
                labels[line[1:]] = linenum
                print("Label: " + line[1:] + " @ " + format(linenum, '#04x'))
            else:
                linenum = linenum + 1


def zerobin(fn):
    with open(fn, "w") as binary_file:
        binary_file.write("memory_initialization_radix=2;\n")
        binary_file.write("memory_initialization_vector=\n")



def writebin(fn, s):
    # s = s[::-1]
    # byte = bitarray(s).tobytes()
    # global total
    # total += int.from_bytes(byte, 'big')
    # print(int.from_bytes(byte, 'big'))
    print(s)
    # print(byte)
    with open(fn, "a") as binary_file:
        binary_file.write(s)
        binary_file.write(",\n")




if len(sys.argv) != 2:
    print("Usage: vASM file.asm")
    sys.exit()

zerobin(file_name)

parselabels(sys.argv[1])

# print(labels)

with open(sys.argv[1]) as f:
    cur_line = -1
    for line in f:

        # Ignore labels
        if line[0] == '.':
            continue


        # print(line)
        if line == '':
            continue

        # Ignore comments
        if line[0] == '#':
            continue

        line = line.replace('\n', '').replace('\r', '')
        tok = re.split(r'[(), ]', line)

        tok = [i for i in tok if i != '']

        if tok == []:
            continue
        cur_line += 1

        print(cur_line, tok)


    # R Instructions
        if tok[0].upper() == "ADD":
            op_code = '000000'
            func_code = '00000001'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[2].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[2].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)

        elif tok[0].upper() == "COMP":
            op_code = '000000'
            func_code = '00000010'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[2].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[2].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)

        elif tok[0].upper() == "SHLLV":
            op_code = '000000'
            func_code = '00000100'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[2].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[2].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)
            
        elif tok[0].upper() == "SHRLV":
            op_code = '000000'
            func_code = '00001000'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[2].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[2].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)
            
        elif tok[0].upper() == "SHRAV":
            op_code = '000000'
            func_code = '00010000'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[2].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[2].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)
            
        elif tok[0].upper() == "BR":
            op_code = '000000'
            func_code = '00100000'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '00000'

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)
            
        elif tok[0].upper() == "AND":
            op_code = '000000'
            func_code = '01000000'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[2].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[2].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)
            
        elif tok[0].upper() == "XOR":
            op_code = '000000'
            func_code = '10000000'
            dont_cares = '00000000'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[2].upper()[1:])

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[2].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            inst = op_code + r1 + r2 + func_code + dont_cares
            writebin(file_name, inst)
            

        # I Instructions
        elif tok[0].upper() == "LW":
            op_code = '100000'
            
            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[3].upper()[1:])

            imm = int(tok[2])

            if imm < -32768 or imm > 32767:
                print("ERROR: Immediate too big")
                print(tok[2])
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[3].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            imm = '{0:016b}'.format(imm & 0xffff)

            inst = op_code + r1 + r2 + imm
            writebin(file_name, inst)
            
            
        elif tok[0].upper() == "SW":
            op_code = '100001'

            r1 = int(tok[1].upper()[1:])
            r2 = int(tok[3].upper()[1:])

            imm = int(tok[2])
            # print(imm)

            if imm < -32768 or imm > 32767:
                print("ERROR: Immediate too big")
                print(tok[2])
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()
            if r2 < 0 or r2 > 31:
                print("ERROR: Invalid register name")
                print(tok[3].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            r2 = '{0:05b}'.format(r2)

            imm = '{0:016b}'.format(imm & 0xffff)

            inst = op_code + r1 + r2 + imm
            writebin(file_name, inst)

        # J Instructions
        elif tok[0].upper() == "B":
            op_code = '100101'

            if tok[1] in labels:
                line_no = labels[tok[1]]
            else:
                print("ERROR:", tok[1], ": invalid label")
                sys.exit()

            cur_byte = cur_line * 4 + 4
            dest_byte = line_no * 4
            # dest_byte = 12312012412313

            cur_byte = '{0:032b}'.format(cur_byte)            
            dest_byte = '{0:032b}'.format(dest_byte)            

            if (cur_byte[0:4] != dest_byte[0:4]):
                print("ERROR: Cannot use 'b' with this label '" + tok[1] + "'; use 'br' instead.")
                sys.exit()

            
            addr = dest_byte[4:30]
            inst = op_code + addr
            writebin(file_name, inst)
            
        elif tok[0].upper() == "BL":
            op_code = '100110'

            if tok[1] in labels:
                line_no = labels[tok[1]]
            else:
                print("ERROR:", tok[1], ": invalid label")
                sys.exit()

            cur_byte = cur_line * 4 + 4
            dest_byte = line_no * 4
            # dest_byte = 12312012412313

            cur_byte = '{0:032b}'.format(cur_byte)            
            dest_byte = '{0:032b}'.format(dest_byte)            

            if (cur_byte[0:4] != dest_byte[0:4]):
                print("ERROR: Cannot use 'b' with this label '" + tok[1] + "'; use 'br' instead.")
                sys.exit()

            
            addr = dest_byte[4:30]
            inst = op_code + addr
            writebin(file_name, inst)
            
        elif tok[0].upper() == "BCY":
            op_code = '100111'

            if tok[1] in labels:
                line_no = labels[tok[1]]
            else:
                print("ERROR:", tok[1], ": invalid label")
                sys.exit()

            cur_byte = cur_line * 4 + 4
            dest_byte = line_no * 4
            # dest_byte = 12312012412313

            cur_byte = '{0:032b}'.format(cur_byte)            
            dest_byte = '{0:032b}'.format(dest_byte)            

            if (cur_byte[0:4] != dest_byte[0:4]):
                print("ERROR: Cannot use 'b' with this label '" + tok[1] + "'; use 'br' instead.")
                sys.exit()

            
            addr = dest_byte[4:30]
            inst = op_code + addr
            writebin(file_name, inst)
            
        elif tok[0].upper() == "BCNY":
            op_code = '101000'

            if tok[1] in labels:
                line_no = labels[tok[1]]
            else:
                print("ERROR:", tok[1], ": invalid label")
                sys.exit()

            cur_byte = cur_line * 4 + 4
            dest_byte = line_no * 4
            # dest_byte = 12312012412313

            cur_byte = '{0:032b}'.format(cur_byte)            
            dest_byte = '{0:032b}'.format(dest_byte)            

            if (cur_byte[0:4] != dest_byte[0:4]):
                print("ERROR: Cannot use 'b' with this label '" + tok[1] + "'; use 'br' instead.")
                sys.exit()

            
            addr = dest_byte[4:30]
            inst = op_code + addr
            writebin(file_name, inst)

        # I* Instructions
        elif tok[0].upper() == "ADDI":
            op_code = '000001'
            shift = '00000'

            r1 = int(tok[1].upper()[1:])

            imm = int(tok[2])

            if imm < -32768 or imm > 32767:
                print("ERROR: Immediate too big")
                print(tok[2])
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)

            imm = '{0:016b}'.format(imm & 0xffff)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)

        elif tok[0].upper() == "COMPI":
            op_code = '000010'
            shift = '00000'

            r1 = int(tok[1].upper()[1:])

            imm = int(tok[2])

            if imm < -32768 or imm > 32767:
                print("ERROR: Immediate too big")
                print(tok[2])
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)

            imm = '{0:016b}'.format(imm & 0xffff)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)

        elif tok[0].upper() == "SHLL":
            op_code = '000011'
            imm = '0000000000000000'

            r1 = int(tok[1].upper()[1:])

            shift = int(tok[2])

            if shift < 0 or shift > 31:
                print("ERROR: Shift Amount too large")
                print(tok[2])
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            shift = '{0:05b}'.format(shift)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)


        elif tok[0].upper() == "SHRL":
            op_code = '000100'
            imm = '0000000000000000'

            r1 = int(tok[1].upper()[1:])

            shift = int(tok[2])

            if shift < 0 or shift > 31:
                print("ERROR: Shift Amount too large")
                print(tok[2])
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            shift = '{0:05b}'.format(shift)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)

        elif tok[0].upper() == "SHRA":
            op_code = '000101'
            imm = '0000000000000000'

            r1 = int(tok[1].upper()[1:])

            shift = int(tok[2])

            if shift < 0 or shift > 31:
                print("ERROR: Shift Amount too large")
                print(tok[2])
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            shift = '{0:05b}'.format(shift)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)

        elif tok[0].upper() == "BLTZ":
            op_code = '000110'
            shift = '00000'

            r1 = int(tok[1].upper()[1:])

            if tok[2] in labels:
                line_no = labels[tok[2]]
            else:
                print("ERROR:", tok[2], ": invalid label")
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            diff = line_no - cur_line - 1
            line_no = '{0:016b}'.format(diff & 0xffff)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)
            

        elif tok[0].upper() == "BZ":
            op_code = '000111'
            shift = '00000'

            r1 = int(tok[1].upper()[1:])

            if tok[2] in labels:
                line_no = labels[tok[2]]
            else:
                print("ERROR:", tok[2], ": invalid label")
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            diff = line_no - cur_line - 1
            line_no = '{0:016b}'.format(diff & 0xffff)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)

        elif tok[0].upper() == "BNZ":
            op_code = '001000'
            shift = '00000'

            r1 = int(tok[1].upper()[1:])

            if tok[2] in labels:
                line_no = labels[tok[2]]
            else:
                print("ERROR:", tok[2], ": invalid label")
                sys.exit()

            if r1 < 0 or r1 > 31:
                print("ERROR: Invalid register name")
                print(tok[1].upper())
                sys.exit()

            r1 = '{0:05b}'.format(r1)
            diff = line_no - cur_line - 1
            line_no = '{0:016b}'.format(diff & 0xffff)

            inst = op_code + r1 + shift + imm
            writebin(file_name, inst)

        else:
            print("ERROR: Unknown operand")
            print(tok[0])
            sys.exit()

# print(total)

with open(file_name, "a") as binary_file:
    binary_file.write("00000000000000000000000000000000;")
    # binary_file.write(",\n")