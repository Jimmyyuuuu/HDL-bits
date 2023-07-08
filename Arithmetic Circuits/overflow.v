//法1
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    assign s = a+b;
    //overflow 也就是 比如說 3+2=5=>0011+0010=0101(correct),但如果是 5+7=12 => 0101+0111 = 1100(overflow ，我的sign 變負的)
    //所以就看a,b的最高位兩個 跟加完後的s最高位有沒有一樣，不一樣就是overflow，也就是if a[7]=b[7]= 0 ，s[7]=1 這樣就overflow
    assign overflow = (a[7]&b[7]&~s[7])|(~a[7]&~b[7]&s[7]);
    //這裡的意思就是 當 a[7]=b[7]= 1 ,s[7]=0 OR a[7]=b[7]= 0 ，s[7]=1， overflow就會有值跑出來!也就是產生了overflow
endmodule
//法2 當cout[7]~=cout[6]時，為Overflow，因為最高位通常為sign-bit，如果跟前一個不一樣代表溢位進位了

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    wire cout[7:0];
    assign overflow = cout[7]^cout[6];
    overflow_add add0(a[0],b[0],1'b0,s[0],cout[0]);
    overflow_add add1(a[1],b[1],cout[0],s[1],cout[1]);
    overflow_add add2(a[2],b[2],cout[1],s[2],cout[2]);
    overflow_add add3(a[3],b[3],cout[2],s[3],cout[3]);
    overflow_add add4(a[4],b[4],cout[3],s[4],cout[4]);
    overflow_add add5(a[5],b[5],cout[4],s[5],cout[5]);
    overflow_add add6(a[6],b[6],cout[5],s[6],cout[6]);
    overflow_add add7(a[7],b[7],cout[6],s[7],cout[7]);
    endmodule

module overflow_add(input a,input b,input cin,output s,output cout); 
    assign s=a^b^cin; 
    assign cout=a&b|b&cin|a&cin;
endmodule