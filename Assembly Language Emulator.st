<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 7.10.1 of February 6, 2014 on October 29, 2014 at 7:07:25 AM</time-stamp>


<component-created>
<name>CS474</name> <type>package</type>
</component-created><!-- Package CS474* -->


<component-property>
<name>CS474</name> <type>package</type>
<property>packageName</property> <value>'CS474'</value>
</component-property>

<component-property>
<name>CS474</name> <type>package</type>
<property>comment</property> <value>'This package contains the implementaion of an Assembly Language Emulator (ALE).


SOME OF THE TESTING SCRIPTS I USED
-------------------------------------------------------

LDI 5
ST 0
LDB 0
ADD
XCH
ADD
HLT
------

LDI 20000
ST 0
LDB 0
ADD
LDI 5
JVS 1
-----

LDI 1
ST 0
LDB 0
LDI 32000
ST 1
LDB 1
ADD
--------

LDI 1
ST 0
LDB 0
ADD
JMP 1
----------

Loop
JMP 1
JMP 0



@author: Md Abu Naser Bikas
UIN: 651644268
UIC
'</value>
</component-property>

<class>
<name>Instruction</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>salHardware </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>Instruction</class-id>
<body>This is an abstract superclass. This class contains all the common properties requirted to execute each of the SAL instruction ( LDI, LDB ...).Supported SAL Instructions:	LDA number -- 	Loads byte at data memory address number into the accumulator.	LDB number -- 	Loads byte at data memory address number into B.	LDI value -- 		Loads the integer value into the accumulator register. The value could be negative but must be in the range of 16-bit 2’s 					complement numbers.	ST number -- 	Stores content of accumulator into data memory at address number.	XCH -- 			Exchanges the content registers A and B.	JMP number -- 	Transfers control to instruction at address number in program memory.	JZS number -- 	Transfers control to instruction at address number if the zero-result bit is set.	JVS number -- 	Transfers control to instruction at address number if the overflow bit is set.	ADD --			Adds the content of registers A and B. The sum is stored in A. The overflow and zero-result bits are set or cleared as 					needed.	HLT --			Terminates program execution.</body>
</comment>

<class>
<name>ST</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>ST</class-id>
<body>Stores content of accumulator into data memory at address number.</body>
</comment>

<class>
<name>LDA</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>LDA</class-id>
<body>Loads value from data memory into the accumulator based on the given address.</body>
</comment>

<class>
<name>ALEGUI</name>
<environment>Smalltalk</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>instructions dataMemory programMemory SALInput dataMemoryOutput programMemoryOutput instructionCount maxInstructionCount salHardware </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>ALEGUI</class-id>
<body>Implementation of an Assembly Language Emulator (ALE).This class contains the GUI of the ALE and user interaction methods. During initialization it creates an instance of SALHardware. SALHardware executes the SAL commands by selecting concrete subclass of class Instruction(ADD, LDI, etc) based on the command at pc. SOME OF THE TESTING SCRIPTS I USED-------------------------------------------------------LDI 5ST 0LDB 0ADDXCHADDHLT------LDI 20000ST 0LDB 0ADDLDI 5JVS 1-----LDI 1ST 0LDB 0LDI 32000ST 1LDB 1ADD--------LDI 1ST 0LDB 0ADDJMP 1----------Loop----------JMP 1JMP 0JMP 0----------------------------------@author: Md Abu Naser BikasUIN: 651644268UIC</body>
</comment>

<class>
<name>JMP</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>JMP</class-id>
<body>Transfers control to instruction at address number in program memory.</body>
</comment>

<class>
<name>XCH</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>XCH</class-id>
<body>Exchanges the content registers A and B.</body>
</comment>

<class>
<name>SALHardware</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>dataMemory programMemory a b pc overflowBit zeroResultBit max min anInstruction instructionCount maxInstructionCount </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>SALHardware</class-id>
<body>Thic class is reponsible to store all the properties of a SAL Hardware. It will execute single SAL commands by selecting concrete subclass of abstract class Instruction(ADD, LDI, etc) based on the command at pc. Instance Variables	a	&lt;ArithmeticValue&gt;	16-bit Accumulator register (A)	b	&lt;ArithmeticValue&gt;	16-bit Extra register (B)	dataMemory	&lt;Array&gt;		Data Memory is a 16-bit, word-addressable memory (RAM) for data, array with size 64	programMemory	&lt;Array&gt;	Program Memory that can store up to 256 SAL instructions	pc	&lt;SmallInteger&gt;	8-bit program counter (PC), holds the address of program memory indicating the next instruction to be executed	max	&lt;SmallInteger&gt;	Maximum positive integer  that can fit into a 16 bit registers. 2^(16-1) - 1 = 32767	min	&lt;SmallInteger&gt;	Maximum negative integer  that can fit into a 16 bit registers. -2^(16-1) = -32768	overflowBit	&lt;SmallInteger&gt;	This bit is set(1) if the last ADD instruction produced an overflow, otherwise cleared (0)	zeroResultBit &lt;SmallInteger&gt;	This bit is set(1) if the last ADD instruction produced a zero result, otherwise cleared (0)@author: Md Abu Naser BikasUIN: 651644268UIC</body>
</comment>

<class>
<name>JVS</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>JVS</class-id>
<body>Transfers control to instruction at address number if the overflow bit is set.</body>
</comment>

<class>
<name>JZS</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>JZS</class-id>
<body>Transfers control to instruction at address number if the zero-result bit is set.</body>
</comment>

<class>
<name>LDB</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>LDB</class-id>
<body>Loads value from data memory into the extra register (B) based on the given address.</body>
</comment>

<class>
<name>HLT</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>HLT</class-id>
<body>Terminates program execution.</body>
</comment>

<class>
<name>ADD</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>ADD</class-id>
<body>Adds the content of registers A and B. The sum is stored in A. The overflow and zero-result bits are set or cleared as needed</body>
</comment>

<class>
<name>LDI</name>
<environment>Smalltalk</environment>
<super>Instruction</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<comment>
<class-id>LDI</class-id>
<body>This class is responsible to load the integer value into the accumulator register. The value could be negative but must be in the range of 16-bit 2’s complement numbers.</body>
</comment>

<methods>
<class-id>Instruction class</class-id> <category>instance creation</category>

<body package="CS474" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Instruction</class-id> <category>accessing</category>

<body package="CS474" selector="salHardware">salHardware	^salHardware</body>

<body package="CS474" selector="salHardware:">salHardware: anObject	salHardware := anObject</body>
</methods>

<methods>
<class-id>Instruction</class-id> <category>testing</category>

<body package="CS474" selector="isEmptyInstruction:">isEmptyInstruction: index	"checking if programMemory have any instruction in the given index"	"index have to be &gt; =0"	(index &lt; 0)		ifTrue: 			[Dialog warn: 'Number must have to be greater than zero'.			^false].	( ((salHardware programMemory) at: (index+1)) = nil)		ifTrue: 			[Dialog warn: 'No instruction found at address' , index printString.			^false].	^true</body>
</methods>

<methods>
<class-id>Instruction</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Each of its concrete subclass is responsible to execute a single instruction"	^self subclassResponsibility</body>
</methods>

<methods>
<class-id>Instruction</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"As this is an abstract class. creating instance of this class is prevented"	^ self error: 'As this is an abstract class, creating instance of this class is prevented'.	"^self subclassResponsibility"</body>
</methods>


<methods>
<class-id>JVS</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given JVS instruction"	"Transfers control to instruction at address number if the overflow bit is set."	| number |	number := currentInstruction at: 2.	((self isEmptyInstruction: number) = false) ifTrue: [^false].	salHardware overflowBit = 0		ifTrue: 			[Dialog warn: 'Overflow bit is not set'.			^true].	salHardware executeInstructionAt: (number+1).	^true</body>
</methods>

<methods>
<class-id>JVS</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>
</methods>


<methods>
<class-id>JMP</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given JMP instruction"	"Transfers control to instruction at address number in program memory."	| number |	number := currentInstruction at: 2.	((self isEmptyInstruction: number) = false) ifTrue: [^false].	salHardware executeInstructionAt: (number +1).	^true</body>
</methods>

<methods>
<class-id>JMP</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>
</methods>


<methods>
<class-id>ADD</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given ADD instruction"	"Adds the content of registers A and B. The sum is stored in A."	"The overflow and zero-result bits are set or cleared as needed."	| sum  max16Bit|	salHardware overflowBit: 0.	salHardware zeroResultBit: 0.	sum := salHardware a + salHardware b.	max16Bit := 65536.	"Overflow"	"Overflow will result an incorrect sum. Storing (sum - 2^16) in A if sum &gt; max OR  (sum+2^16) in A if sum &gt; min )"	sum &gt; salHardware max		ifTrue: 			[salHardware overflowBit: 1.			Dialog				warn: 'Overflow!!! Addition will produce incorrect result. Storing (sum - 2^16) in A'.			salHardware a: sum - max16Bit.			^true].	sum &lt; salHardware min		ifTrue: 			[salHardware overflowBit: 1.			Dialog				warn: 'Overflow!!! Addition will produce incorrect result. Storing (sum + 2^16) in A'.			salHardware a: sum + max16Bit.			^true].	"Zero Result"	sum = 0		ifTrue: 			[salHardware zeroResultBit: 1.			salHardware a: 0.			^true].	"Normal Addition"	salHardware a: sum.	^true</body>
</methods>

<methods>
<class-id>ADD</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>
</methods>


<methods>
<class-id>SALHardware class</class-id> <category>instance creation</category>

<body package="CS474" selector="new">new	"Answer a newly created and initialized instance."	| temp |	temp := super new initialize.	temp initializeAll.	^temp.</body>
</methods>


<methods>
<class-id>SALHardware</class-id> <category>accessing</category>

<body package="CS474" selector="overflowBit:">overflowBit: anObject	overflowBit := anObject</body>

<body package="CS474" selector="b">b	^b</body>

<body package="CS474" selector="min">min	^min</body>

<body package="CS474" selector="a">a	^a</body>

<body package="CS474" selector="programMemory:">programMemory: anObject	programMemory := anObject</body>

<body package="CS474" selector="pc:">pc: anObject	pc := anObject</body>

<body package="CS474" selector="zeroResultBit:">zeroResultBit: anObject	zeroResultBit := anObject</body>

<body package="CS474" selector="overflowBit">overflowBit	^overflowBit</body>

<body package="CS474" selector="b:">b: anObject	b := anObject</body>

<body package="CS474" selector="zeroResultBit">zeroResultBit	^zeroResultBit</body>

<body package="CS474" selector="programMemory">programMemory	^programMemory</body>

<body package="CS474" selector="a:">a: anObject	a := anObject</body>

<body package="CS474" selector="min:">min: anObject	min := anObject</body>

<body package="CS474" selector="max:">max: anObject	max := anObject</body>

<body package="CS474" selector="dataMemory:">dataMemory: anObject	dataMemory := anObject</body>

<body package="CS474" selector="max">max	^max</body>

<body package="CS474" selector="pc">pc	^pc</body>

<body package="CS474" selector="dataMemory">dataMemory	^dataMemory</body>
</methods>

<methods>
<class-id>SALHardware</class-id> <category>testing</category>

<body package="CS474" selector="isRegisterValueInRange:">isRegisterValueInRange: aValue	"Checking if the given signed integer falls in the range of 16 bit number"	"Max = 2^(16-1) - 1 = 32767"	"Min = -2^(16-1) = -32768"	aValue &gt; max ifTrue: [^false].	aValue &lt; min ifTrue: [^false].	^true</body>

<body package="CS474" selector="isValidCommand:">isValidCommand: command	"Testing is the command is valid or not"		| validCommandNames validCommandLengths  |	"Checking if the command have more than two commands"	(command size) &gt; 2 ifTrue: [^false].	"Checking if the command contains any of the supported name and length"	validCommandNames := #('LDI' 'LDA' 'LDB' 'ST' 'JMP' 'JZS' 'JVS' 'ADD' 'XCH' 'HLT').	validCommandLengths := #(2 2 2 2 2 2 2 1 1 1).	(1 to: validCommandNames size) do: 			[:i |			(((command at: 1) asString findString: (validCommandNames at: i)				startingAt: 1) &gt; 0				&amp; command size) = (validCommandLengths at: i)				ifTrue: [^true]].		^false</body>
</methods>

<methods>
<class-id>SALHardware</class-id> <category>conversions</category>

<body package="CS474" selector="decimalToBinary:">decimalToBinary: decimal	"Converts a given decimal number to 16 bit binary"	"Returns a OrderedCollection with binary bits"	| binary temp|	binary := OrderedCollection new.	temp := decimal.	[temp = 0] whileFalse: 			[(temp \\ 2 = 0) 				ifTrue: [binary addFirst: 0]				ifFalse: [binary addFirst: 1].			temp := temp // 2.].		(16 - binary size) timesRepeat: [ binary addFirst: 0].	^binary</body>

<body package="CS474" selector="orderedCollectionToString:">orderedCollectionToString: oc	"converts an OrderedCollection to String"	| mystream delimiter |	mystream := WriteStream on: (String new: 500).	delimiter := ''.	oc do: 			[:item |			mystream				nextPutAll: item printString;				nextPutAll: delimiter].	mystream position: mystream position - delimiter size.	^mystream contents</body>

<body package="CS474" selector="binaryToDecimal:">binaryToDecimal: binary	"Converts given binary number (OrderedCollection) to decimal"	| decimal |	decimal := 0.	(1 to: binary size) do: 			[:i |			(binary at: i) = 1				ifTrue: [decimal := decimal + (2 raisedTo: binary size - i)]].	^decimal</body>

<body package="CS474" selector="binaryAdd:with:">binaryAdd: binary1 with: binary2	"Adds two binary number binary1 and binary1"	| sum temp1 temp2 carry |	temp1 := binary1 reverse.	temp2 := binary2 reverse.	sum := OrderedCollection new.	carry := 0.	(1 to: 16) do: 			[:i |			| s |			s := (temp1 at: i) + (temp2 at: i) + carry.			s &lt;= 1				ifTrue: 					[sum addFirst: s.					carry := 0]				ifFalse: 					[sum addFirst: 0.					carry := 1]].	^sum</body>

<body package="CS474" selector="binaryAddOne:">binaryAddOne: binary	"Add one (1) with the given binary number"	| sum carry |	sum := OrderedCollection new.	carry := 1.	(16 to: 1 by: -1) do: 			[:i |			| s |			s := (binary at: i) + carry.			s &lt;= 1				ifTrue: 					[sum addFirst: s.					carry := 0]				ifFalse: 					[sum addFirst: 0.					carry := 1]].	^sum</body>

<body package="CS474" selector="decimalTo2sComplement:">decimalTo2sComplement: decimal	"Converts a given decimal to its equivalent 2's complement"	"If positive just return the binary representation of the number"	| complement binary temp |	decimal &gt;= 0 ifTrue: [^self decimalToBinary: decimal].	"If negative then first invert the digits and then add 1"	temp := decimal * -1.	binary := self decimalToBinary: temp.	complement := OrderedCollection new.	binary do: 			[:each |			each = 0 ifTrue: [complement addLast: 1] ifFalse: [complement addLast: 0]].	^self binaryAddOne: complement</body>

<body package="CS474" selector="decimalToHexaDecimal:">decimalToHexaDecimal: decimal	"Converts decimal to hexadecimal"	| hexaDecimal hexDigits temp binary2s d |		hexDigits := #(0 1 2 3 4 5 6 7 8 9 'A' 'B' 'C' 'D' 'E' 'F').	"decimal &gt;= 0 ifTrue: [ ^ ( (decimal printStringRadix: 16) asOrderedCollection)]."	hexaDecimal := OrderedCollection new.	binary2s := self decimalTo2sComplement: decimal.	temp := OrderedCollection new.	1 to: binary2s size		do: 			[:i |			temp addLast: (binary2s at: i).			i \\ 4 = 0				ifTrue: 					[d := self binaryToDecimal: temp.					d = 0 &amp; (hexaDecimal size = 0)						ifTrue: []						ifFalse: [hexaDecimal addLast: (hexDigits at: d + 1)].					temp := OrderedCollection new]].	hexaDecimal size = 0 ifTrue: [hexaDecimal addLast: 0].	^hexaDecimal</body>
</methods>

<methods>
<class-id>SALHardware</class-id> <category>getter</category>

<body package="CS474" selector="getAccumulator">getAccumulator	"Returns the content of Accumulator (Register A), returns nil is there is nothing in it"	self a isNil ifTrue: [^a printString].	^self getStringRepOfRegister: self a</body>

<body package="CS474" selector="getDataMemory">getDataMemory	"Returns all the valid data values from the data memory in the following format:"	"Position: Integer / 2's Complement /  Hexadecimal"	| newLine returnString counter |	newLine := String with: Character cr.	returnString := String new.	counter := 0.	dataMemory do: 			[:each |			| str |			each isNil				ifFalse: 					[str := self getStringRepOfRegister: each.					returnString := returnString , counter printString , ': ' , str , newLine].			counter := counter + 1].	^returnString</body>

<body package="CS474" selector="getProgramMemory">getProgramMemory	"Returns all  the valid instructions from program memory separated by carriage return"		| newLine returnString counter append|		newLine := String with: Character cr.	returnString := String new.	counter := 0.	append := ''.	programMemory do: 			[:each |			each isNil				ifFalse: 					[ 						(counter = pc) ifTrue: [ append := '  &lt;-- ']									   ifFalse: [append := ''].					returnString := returnString, counter printString , ': ' , each, append, newLine].			counter := counter + 1].	^returnString	"^programMemory inject: ''		into: [:text :each | text , each asString , newLine]"</body>

<body package="CS474" selector="getStringRepOfRegister:">getStringRepOfRegister: anInteger	"Return a string representation of a register in the format: integer / 2's Complement / Hexadecimal "	| complement hexa |	complement := self				orderedCollectionToString: (self decimalTo2sComplement: anInteger).	hexa := self				orderedCollectionToString: (self decimalToHexaDecimal: anInteger).	^anInteger printString , ' / ' , complement , ' / 0x' , hexa</body>

<body package="CS474" selector="getExtraRegister">getExtraRegister	"Returns the content of Register B, returns nil is there is nothing in it"	self b isNil ifTrue: [^b printString].	^self getStringRepOfRegister: self b</body>
</methods>

<methods>
<class-id>SALHardware</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	| temp |	temp := super initialize.	temp initializeAll.	^temp</body>

<body package="CS474" selector="initializeAll">initializeAll	"Initializes all the instance variables of  SALHardware"	"Data Memory is a 16-bit, word-addressable memory (RAM) for data. It can store 64 words (signed integer in 2’s complement notation)"	dataMemory := Array new: 64.	"Program Memory can store up to 256  SAL instructions"	programMemory := Array new: 256.	"programMemory := OrderedCollection new."		"A 16-bit Accumulator register"	a := nil.	"A 16-bit Extra register"	b := nil.		"An 8-bit program counter (PC), holds the address of program memory indicating the next instruction to be executed"	pc := 0.		"This bit is set(1) if the last ADD instruction produced an overflow, otherwise cleared (0)"	overflowBit := 0.		"This bit is set(1) if the last ADD instruction produced a zero result, otherwise cleared (0)"	zeroResultBit := 0.	"Maximum positive integer  than can fit into 16 bit registers"	" 2^(16-1) - 1 = 32767"	max := 32767.	   	"Maximum negative integer  than can fit into 16 bit registers"	" -2^(16-1) = -32768"	min :=  -32768.	"Used to detect loop"	instructionCount := 0.	maxInstructionCount := 10.		^self</body>
</methods>

<methods>
<class-id>SALHardware</class-id> <category>parsing</category>

<body package="CS474" selector="parseInstruction:">parseInstruction: singleInstruction	"Parsing a single instruction"	"Checking the validity of the instruction (if it contains right command and length)"	"If not valid returning false, otherwise returning the space tokenized commands"	| parts command |	parts := singleInstruction tokensBasedOn: Character space.	"Separating commands from the given instruction. Ignoring multiple empty spaces from the instruction"	command := OrderedCollection new.	(1 to: parts size)		do: [:index | (parts at: index) isEmpty ifFalse: [command addLast: (parts at: index)]].		((self isValidCommand: command)= false) ifTrue: [^false].		command size = 2 ifTrue: [command at: 2 put: (command at: 2) asNumber].	^command</body>
</methods>

<methods>
<class-id>SALHardware</class-id> <category>execute</category>

<body package="CS474" selector="executeInstructionAt:">executeInstructionAt: index	"Exceutes the instruction from program memory at index ."	"Execute the instruction by choosing the appropriate class based on the command and returns true"	"Also handles the possible loop, loop can be occured beacuse of tranferring between same jump instruction executing mutiple times"	| command command1 | 		command := self parseInstruction: (programMemory at: index).	(command = false) ifTrue: [ Dialog warn: 'Invalid SAL Instruction at position ', (index-1) printString.  ^false].	"Handling loop"	(instructionCount &gt; maxInstructionCount) ifTrue:			[Dialog warn: 'Possible infinite loop in the program because of the instruction: ', command printString, '  --&gt; This instruction already executed ', maxInstructionCount printString, ' times.'.			^false]			ifFalse: [instructionCount := instructionCount +1].			command1 := (command at: 1).		(command1 = 'LDI') ifTrue: [ anInstruction := LDI new].	(command1 = 'LDA') ifTrue:  [ anInstruction := LDA new].	(command1 = 'LDB') ifTrue:  [ anInstruction := LDB new].	(command1 = 'ST') ifTrue:  [ anInstruction := ST new].	(command1 = 'JMP') ifTrue:  [anInstruction := JMP new ].	(command1 = 'JZS') ifTrue:  [ anInstruction := JZS new].	(command1 = 'JVS') ifTrue:  [ anInstruction := JVS new ].	(command1 = 'ADD') ifTrue:  [anInstruction := ADD new].	(command1 = 'XCH') ifTrue:  [ anInstruction := XCH new].	(command1 = 'HLT') ifTrue:  [ anInstruction := HLT new].		"initializing instruction with a reference of this class"	anInstruction initialize: self.	"executng the current instruction"	^anInstruction executeInstruction: command.</body>

<body package="CS474" selector="executeInstruction">executeInstruction	"Exceutes the given single line instruction. Return false if the instruction is not valid."	| status | 		instructionCount := 0.	status := self executeInstructionAt: (pc+ 1).	(status = true)  ifTrue: [   pc:= pc +1].	^status</body>
</methods>

<methods>
<class-id>SALHardware</class-id> <category>updating</category>

<body package="CS474" selector="updateProgramMemory:at:">updateProgramMemory: instruction at: position	"Adding instructions to program memory"		(position &gt;= 255) ifTrue: [^self error: 'Program Memory Overflow'.].	programMemory at: (position) put: instruction.		^true</body>
</methods>


<methods>
<class-id>XCH</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given XCH instruction"	"Exchanges the content of registers A and B."	|  temp |	temp := salHardware a.	salHardware a: salHardware b.	salHardware b: temp.	^true</body>
</methods>

<methods>
<class-id>XCH</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>
</methods>


<methods>
<class-id>LDB</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given LDB instruction"	"Loads byte at data memory address number into B."	| number |	number := currentInstruction at: 2.	number &gt; 63		ifTrue: 			[Dialog				warn: 'Invalid instruction. Data Memory address should be between 0 to  63'.			^false].	(salHardware dataMemory at: number + 1) isNil		ifTrue: 			[Dialog				warn: 'No data found in the Data Memory at the given address to load into B'.			^false].	salHardware b: (salHardware dataMemory at: number + 1).	^true</body>
</methods>

<methods>
<class-id>LDB</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>
</methods>


<methods>
<class-id>ST</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given ST instruction"	"Stores content of accumulator into data memory at address number."	| number |	number := currentInstruction at: 2.	number &gt; 63		ifTrue: 			[Dialog warn: 'Data memory address should between 0 to 63'.			^false].	salHardware dataMemory at: number + 1 put: salHardware a.	^true</body>
</methods>

<methods>
<class-id>ST</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>
</methods>


<methods>
<class-id>JZS</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given JZS instruction"	"Transfers control to instruction at address number if the zero-result bit is set."	| number |	number := currentInstruction at: 2.	((self isEmptyInstruction: number) = false) ifTrue: [^false].		salHardware zeroResultBit = 0		ifTrue: 			[Dialog warn: 'Zero Result bit is not set'.			^true].	salHardware executeInstructionAt: (number+1).	^true</body>
</methods>

<methods>
<class-id>JZS</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>
</methods>


<methods>
<class-id>LDI</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given LDI instruction"		(salHardware isRegisterValueInRange: (currentInstruction at: 2) )		ifFalse: 			[Dialog				warn: 'Given number does not fit in the 16 bit signed integer range (-32768 to 32767). '.			^false].	salHardware a:  (currentInstruction at: 2).	^true</body>
</methods>

<methods>
<class-id>LDI</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>
</methods>


<methods>
<class-id>ALEGUI class</class-id> <category>interface specs</category>

<body package="CS474" selector="windowSpec">windowSpec	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"	&lt;resource: #canvas&gt;	^#(#{UI.FullSpec} 		#window: 		#(#{UI.WindowSpec} 			#label: 'ALE' 			#min: #(#{Core.Point} 20 20 ) 			#max: #(#{Core.Point} 0 0 ) 			#bounds: #(#{Graphics.Rectangle} 440 275 1240 775 ) ) 		#component: 		#(#{UI.SpecCollection} 			#collection: #(				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 14 46 ) 					#name: #SALInstructionsLabel 					#label: 'SAL Instructions' ) 				#(#{UI.TextEditorSpec} 					#layout: #(#{Graphics.Rectangle} 12 67 212 357 ) 					#name: #SALInput 					#model: #SALInput 					#tabRequiresControl: true ) 				#(#{UI.ActionButtonSpec} 					#layout: #(#{Graphics.Rectangle} 19 381 116 399 ) 					#name: #exeuteLineButton 					#model: #executeLine 					#label: '&amp;Execute Line' 					#defaultable: true ) 				#(#{UI.ActionButtonSpec} 					#layout: #(#{Graphics.Rectangle} 18 413 115 431 ) 					#name: #executeWholeButton 					#model: #executeWhole 					#label: 'Execute Whole' 					#defaultable: true ) 				#(#{UI.TextEditorSpec} 					#layout: #(#{Graphics.Rectangle} 223 70 600 356 ) 					#name: #dataMemoryOutput 					#model: #dataMemoryOutput 					#helpText: '' 					#isReadOnly: true 					#tabRequiresControl: true ) 				#(#{UI.TextEditorSpec} 					#layout: #(#{Graphics.Rectangle} 610 70 790 356 ) 					#name: #programMemoryOutput 					#model: #programMemoryOutput 					#isReadOnly: true 					#tabRequiresControl: true ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 228 47 ) 					#name: #dataMemoryLabel 					#label: 'Data Memory ( Integer / 2''s Complement / Hexadecimal)' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 646 40 ) 					#name: #programMemeoryLabel 					#label: 'Program Memory' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 658 392 ) 					#name: #Label2 					#label: 'PC:' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 166 411 ) 					#name: #Label3 					#label: 'Accumulator:' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 166 438 ) 					#name: #Label4 					#label: 'Extra Register:' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 695 392 ) 					#name: #pcLabel 					#label: 					#(#{Kernel.UserMessage} 						#key: #pcLabel 						#defaultString: '0' ) ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 259 411 ) 					#name: #accumulatorLabel 					#label: 'nil' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 259 438 ) 					#name: #extraLabel 					#label: 'nil' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 304 11 ) 					#name: #Label5 					#label: 'Assembly Language Emulator' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 258 386 ) 					#name: #Label1 					#label: 'Integer / 2''s Complement / Hexadecimal' ) 				#(#{UI.ActionButtonSpec} 					#layout: #(#{Graphics.Rectangle} 17 443 117 467 ) 					#name: #resetButton 					#model: #reset 					#label: 'Reset' 					#defaultable: true ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 656 412 ) 					#name: #Label6 					#label: 'Zero Result Bit:' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 658 430 ) 					#name: #Label7 					#label: 'Overflow Bit:' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 762 412 ) 					#name: #zeroLabel 					#label: '0' ) 				#(#{UI.LabelSpec} 					#layout: #(#{Core.Point} 763 430 ) 					#name: #overFlowLabel 					#label: '0' ) ) ) )</body>
</methods>


<methods>
<class-id>ALEGUI</class-id> <category>aspects</category>

<body package="CS474" selector="programMemoryOutput">programMemoryOutput	"This method was generated by UIDefiner.  Any edits made here	may be lost whenever methods are automatically defined.  The	initialization provided below may have been preempted by an	initialize method."	^programMemoryOutput isNil		ifTrue:			[programMemoryOutput := String new asValue]		ifFalse:			[programMemoryOutput]</body>

<body package="CS474" selector="SALInput">SALInput	"This method was generated by UIDefiner.  Any edits made here	may be lost whenever methods are automatically defined.  The	initialization provided below may have been preempted by an	initialize method."	^SALInput isNil		ifTrue:			[SALInput := String new asValue]		ifFalse:			[SALInput]</body>

<body package="CS474" selector="dataMemoryOutput">dataMemoryOutput	"This method was generated by UIDefiner.  Any edits made here	may be lost whenever methods are automatically defined.  The	initialization provided below may have been preempted by an	initialize method."	^dataMemoryOutput isNil		ifTrue:			[dataMemoryOutput := String new asValue]		ifFalse:			[dataMemoryOutput]</body>
</methods>

<methods>
<class-id>ALEGUI</class-id> <category>updating</category>

<body package="CS474" selector="updateWidget">updateWidget	"Updatng the widgets"		(self widgetAt: #pcLabel) labelString: ((salHardware pc) printString).	(self widgetAt: #accumulatorLabel) labelString: ((salHardware getAccumulator) ).	(self widgetAt: #extraLabel) labelString: ((salHardware getExtraRegister) ).	(self widgetAt: #zeroLabel) labelString: ((salHardware zeroResultBit) printString ).	(self widgetAt: #overFlowLabel) labelString: ((salHardware overflowBit) printString ).		programMemoryOutput  value: (salHardware getProgramMemory).	dataMemoryOutput  value: (salHardware getDataMemory).</body>
</methods>

<methods>
<class-id>ALEGUI</class-id> <category>actions</category>

<body package="CS474" selector="executeWhole">executeWhole	"Executes all the instructions starting from PC"	| lines status|	"Parsing the inputs"	lines := self parseInput.	lines isNil ifTrue: [^self].	1 to: lines size do: [ :i | salHardware updateProgramMemory: (lines at: (i)) at: i].	salHardware pc + 1 to: (lines size)  do: [ :i | 			status := salHardware	executeInstruction.			(status = true)  ifTrue: [  self updateWidget]						  ifFalse: [^false] ].</body>

<body package="CS474" selector="reset">reset	"Reset the ALE to the initial position"	salHardware initializeAll.	self SALInput value: nil.	self updateWidget</body>

<body package="CS474" selector="executeLine">executeLine	"Executes instructions at the current PC"	| lines status |		"Parsing the inputs"	lines := self parseInput.	lines isNil ifTrue: [^self].	1 to: lines size do: [ :i | salHardware updateProgramMemory: (lines at: (i)) at: i].		status := salHardware	executeInstruction.	(status = true)  ifTrue: [  self updateWidget].	^status.</body>
</methods>

<methods>
<class-id>ALEGUI</class-id> <category>parsing</category>

<body package="CS474" selector="parseInput">parseInput	"Checks the input validation and if valid then returns instructions in an OrderedCollection"	"First checking if the input field is empty"	| lines input |	((self SALInput value) isEmpty)		ifTrue: 			[Dialog warn: 'Please enter an instruction'.			^nil].	"Tokenizing the instructions based on newline (cr)"	lines := self SALInput value tokensBasedOn: Character cr.	"Ignoring empty lines from the input"	input := OrderedCollection new.	1 to: lines size		do: 			[:index |			((lines at: index) isEmpty)				ifFalse: [input addLast: (lines at: index) asString]].	"Checking if the program counter is greater than the number of instructions"	((input size) &lt; (salHardware pc + 1))		ifTrue: 			[Dialog warn: 'No instruction to execute at current PC'.			^nil].	"Returning the inputs"	^input</body>
</methods>

<methods>
<class-id>ALEGUI</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Creates an instance of SALHardware"	"The reference of this instance will be sent to each Instruction 	(ADD, LDI,,) based on the command in the program memory"	salHardware := SALHardware new.</body>
</methods>


<methods>
<class-id>HLT</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given HLT instruction"	"Terminates program execution."		| stop |	stop := false.	[stop = false] whileTrue: 			[Window activeController = nil				ifTrue: [stop := true]				ifFalse: [Window activeController view close]]	"(Dialog confirm: 'Do you really want to exit Application?') ifTrue: [  Window  currentWindow close]."</body>
</methods>

<methods>
<class-id>HLT</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>
</methods>


<methods>
<class-id>LDA</class-id> <category>executing</category>

<body package="CS474" selector="executeInstruction:">executeInstruction: currentInstruction	"Exceutes the given LDA instruction"	| number |	number := currentInstruction at: 2.	number &gt; 63		ifTrue: 			[Dialog				warn: 'Invalid instruction. Data Memory address should be between 0 to  63'.			^false].	(salHardware dataMemory at: number + 1) isNil		ifTrue: 			[Dialog				warn: 'No data found in the Data Memory at the given address to load in A'.			^false].	currentInstruction a: (currentInstruction dataMemory at: number + 1).	^true</body>
</methods>

<methods>
<class-id>LDA</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize:">initialize: aSalHardware	"Initialize a newly created instance. This method must answer the receiver."	salHardware := aSalHardware.	^self</body>

<body package="CS474" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	salHardware := nil.	^self</body>
</methods>



</st-source>
