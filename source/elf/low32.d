//          Copyright Yazan Dabain 2014.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module elf.low32;
import elf.low;

package:

alias ELF32_Addr = uint;
alias ELF32_Off = uint;
alias ELF32_Half = ushort;
alias ELF32_Word = uint;
alias ELF32_SWord = int;

alias ELF32_Section = ushort;

align(1) struct ELFHeader32L {
align(1):
	ELFIdent ident;
	ELF32_Half type;
	ELF32_Half machine;
	ELF32_Word version_;
	ELF32_Addr entry;
	ELF32_Off phoff;
	ELF32_Off shoff;
	ELF32_Word flags;
	ELF32_Half ehsize;
	ELF32_Half phentsize;
	ELF32_Half phnum;
	ELF32_Half shentsize;
	ELF32_Half shnum;
	ELF32_Half shstrndx;
}

align(1) struct ELFSection32L {
align(1):
	ELF32_Word name;
	ELF32_Word type;
	ELF32_Word flags;
	ELF32_Addr address;
	ELF32_Off offset;
	ELF32_Word size;
	ELF32_Word link;
	ELF32_Word info;
	ELF32_Word addralign;
	ELF32_Word entsize;
}

align(1) struct ELFSymbol32L {
align(1):
	ELF32_Word name;
	ELF32_Addr value;
	ELF32_Word size;
	ubyte info;
	ubyte other;
	ELF32_Section shndx;
}

/**
 * An ELF32L .dynamic section contains an ELFDynEntry32L[] (_DYNAMIC array in elf.h).
 *
 * Depending on dTag, DUnion will interpreted as a 32bit unsigned int or a 32bit address.
 */
align(1) struct ELFDynEntry32L {
align(1):
	ELF32_SWord dTag;
	ELF32_Word content;
	// Handle this at a higher level and just use content instead for now
	// union DUnion {
	//	ELF32_Word dVal;
	//	ELF32_Addr dPtr;
	//}
}
