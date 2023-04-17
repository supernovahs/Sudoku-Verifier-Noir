use dep::std;

// Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

//     "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
//                                                                                    [0, 0, 1, 0]
//                                                                                    [0, 0, 0, 3]
//                                                                                    [2, 0, 0, 0]

//     "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
//                                                                                    [3, 2, 1, 4]
//                                                                                    [4, 1, 2, 3]
//                                                                                    [2, 3, 4, 1]

fn main(question: pub [Field;16], answer :  [Field;16]) {
       
    // Verifying the Question
    for i in 0..16 {
        let mut a = question[i] == answer[i];
        let mut b = question[i] == 0;
        let c = a | b;
        constrain c == true;
    }

// Check first row has 3 inputs as 0 and 1 input as non zero
    let mut m:[Field;16] = [0;16];
    for i in 0..4 {
    let mut a = question[i] ;
    constrain a == question[i];
    let mut b = 0;
    constrain b == 0;
    let c =  a==b; 
    m[i] = c as Field;
    }
    constrain 3 == (m[0] + m[1] +m[2] + m[3]);

// Check second row has 3 inputs as 0 and 1 input as non zero

    for i in 4..8 {
    let mut a = question[i] ;
    constrain a == question[i];
    let mut b = 0;
    constrain b == 0;
    let c =  a==b; 
    m[i] = c as Field;
    }
    constrain 3 == (m[4] + m[5] +m[6] + m[7]);

// Check third row has 3 inputs as 0 and 1 input as non zero

    for i in 8..12 {
    let mut a = question[i] ;
    constrain a == question[i];
    let mut b = 0;
    constrain b == 0;
    let c =  a==b; 
    m[i] = c as Field;
    }
    constrain 3 == (m[8] + m[9] +m[10] + m[11]);

// Check fourth row has 3 inputs as 0 and 1 input as non zero

    for i in 12..16 {
    let mut a = question[i] ;
    constrain a == question[i];
    let mut b = 0;
    constrain b == 0;
    let c =  a==b; 
    m[i] = c as Field;
    }
    constrain 3 == (m[12] + m[13] +m[14] + m[15]);    

    // Solution Starts Here ..

    let mut s:[Field;128] = [0;128];
    let mut iter = 0;

    for m in 0..4{
        let z = m *4;
        constrain z ==m*4;
    for j in 0..4 {
    for i in 1..5 {
            
           let  ans:Field = answer[z+j];
            constrain ans ==  answer[z+j];
            let val:Field = i as Field;
            constrain val == i;
            let c = ans == val;
            s[iter] = c as Field;
            iter +=1;
        }
        // Check the respective row  has unique elements
       constrain  1 == s[iter -4] + s[iter-3] + s[iter -2] + s[iter-1];
    }
    
}

for z in 0..4{
    for i in  1..5{
         for m in 0..4{
            let j = m*4;
            constrain j==m*4;
            let  ans:Field = answer[z+j];
            constrain ans ==  answer[z+j];
            let val:Field = i as Field;
            constrain val == i;
            let c = ans == val;
            s[iter] = c as Field;
            iter +=1;
         } 
            
        // Check the respective column has unique elements
        constrain 1 == s[iter-4] + s[iter-3] + s[iter -2] + s[iter-1];
    }
}

// Check the input is in the specified range i.e [1,5] where 5 is exclusive
for i in 0..16{
    let mut a = answer[i];
    constrain a == answer[i];
    constrain a as u32 > 0 ;
    constrain a as u32 < 5 ;
}

}


