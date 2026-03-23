console.log("----------------------Task 1-------------------");
/*
 * Exercise 1
 *
 * Double each number in the array
 *
 * Test Case:
 * console.log(doubleNumbers([1,2,3]))
 *
 * Result:
 * [2,4,6]
*/
function doubleNumbers(arr){
    let doubledArray =arr.map(x=>x*2);
   return doubledArray;
}
  console.log(doubleNumbers([1,2,3]));
  console.log("----------------------Task 2-------------------");
/*
 * Exercise 2
 *
 * Convert numbers to strings
 *
 * Test Case:
 * console.log(numbersToStrings([1,2,3]))
 *
 * Result:
 * ["1","2","3"]
*/
function numbersToStrings(arr){
  let stringedArray = arr.map(x=> x.toString());
  return stringedArray;
}

console.log(numbersToStrings([1,2,3]));

console.log("----------------------Task 3-------------------");
/*
 * Exercise 3
 *
 * Make all names uppercase
 *
 * Test Case:
 * console.log(upperCaseNames(["ali","sara"]))
 *
 * Result:
 * ["ALI","SARA"]
*/
function upperCaseNames(arr){
   return arr.map(x=>x.toUpperCase());
   
}


 console.log(upperCaseNames(["ali","sara"]))
console.log("----------------------Task 4-------------------");
/*
 * Exercise 4
 *
 * Add 5 to each number
 *
 * Test Case:
 * console.log(addFive([10,20,30]))
 *
 * Result:
 * [15,25,35]
*/
function addFive(arr){
 let addArray =arr.map(x=>x+5);
   return addArray;
};

console.log(addFive([10,20,30]))
console.log("----------------------Task 5-------------------");
/*
 * Exercise 5
 *
 * Get only the name from objects
 *
 * Test Case:
 * console.log(getNames([
 * {name:"Ali",age:20},
 * {name:"Sara",age:25}
 * ]))
 *
 * Result:
 * ["Ali","Sara"]
*/
function getNames(arr){
   return arr.map(z=>z.name);
};

console.log(getNames([
  {name:"Ali",age:20},
  {name:"Sara",age:25} ]));

  console.log("----------------------Task 6-------------------");
  /*
 * Exercise 6
 *
 * Return the length of each word
 *
 * Test Case:
 * console.log(wordLengths(["apple","dog"]))
 *
 * Result:
 * [5,3]
*/
function wordLengths(arr){
     return arr.map(z=>z.length);
}
 console.log(wordLengths(["apple","dog"]));
 console.log("----------------------Task 7-------------------");

 /*
 * Exercise 7
 *
 * Multiply each number by its index
 *
 * Test Case:
 * console.log(valTimesIndex([2,3,4]))
 *
 * Result:
 * [0,3,8]
*/
function valTimesIndex(arr){
 
   return   arr.map(function(element,index){
    return element * index;
   })
}
 console.log(valTimesIndex([2,3,4]));
console.log("----------------------Task 8-------------------");

/*
 * Exercise 8
 *
 * Create array of usernames starting with "@"
 *
 * Test Case:
 * console.log(makeUsernames([
 * {username:"ahmad"},
 * {username:"sara"}
 * ]))
 *
 * Result:
 * ["@ahmad","@sara"]
*/
function makeUsernames(arr){

return arr.map(x=>"@"+ x.username);
}
console.log(makeUsernames([
  {username:"ahmad"},
 {username:"sara"}
  ]));
  console.log("----------------------Task 9-------------------");

  /*
 * Exercise 9
 *
 * Create array of squares
 *
 * Test Case:
 * console.log(squareNumbers([2,3,4]))
 *
 * Result:
 * [4,9,16]
*/
function squareNumbers(arr){
   return arr.map(z=>Math.pow(z,2));
}
console.log(squareNumbers([2,3,4]));
console.log("----------------------Task 10-------------------");

/*
 * Exercise 10
 *
 * Convert words to their first letter
 *
 * Test Case:
 * console.log(firstLetters(["Ali","Sara"]))
 *
 * Result:
 * ["A","S"]
*/
function firstLetters(arr){
 return   arr.map(w=>w.charAt(0));
}
console.log(firstLetters(["Ali","Sara"]));
console.log("----------------------Task 11-------------------");

/*
 * Exercise 11
 *
 * Count total sum using forEach
 *
 * Test Case:
 * console.log(sumNumbers([10,20,30]))
 *
 * Result:
 * 60
*/
function sumNumbers(arr){
   //with reduce
//  return arr.reduce(function(acc,current){
//     return acc+current;

//   },0);
//  with foreach
 let sum=0;
arr.forEach(x=>{
  sum+=x;
});
return sum;
}
console.log(sumNumbers([10,20,30]));
console.log("----------------------Task 12-------------------");

/*
 * Exercise 12
 *
 * Count how many numbers are even
 *
 * Test Case:
 * console.log(countEven([1,2,3,4]))
 *
 * Result:
 * 2
*/
function countEven(arr){
  return arr.filter(z=> z % 2===0).length;
  }
console.log(countEven([1,2,3,4]));
console.log("----------------------Task 13-------------------");
/*
 * Exercise 13
 *
 * Create array where each number becomes number * 10
 *
 * Test Case:
 * console.log(timesTen([1,2,3]))
 *
 * Result:
 * [10,20,30]
*/
function timesTen(arr){
   return arr.map(z=>z*10);
};
console.log(timesTen([1,2,3]));
console.log("----------------------Task 14-------------------");

/*
 * Exercise 14
 *
 * Add property "adult" depending on age
 *
 * Test Case:
 * console.log(addAdult([
 * {name:"Ali",age:20},
 * {name:"Sara",age:15}
 * ]))
 *
 * Result:
 * [
 * {name:"Ali",age:20,adult:true},
 * {name:"Sara",age:15,adult:false}
 * ]
*/
function addAdult(arr){
return arr.map(x=>{
   if(x.age < 18){
      x.adult=false;
   }else{
      x["adult"]=true;
   }
   return x;
 })
}
console.log(addAdult([
  {name:"Ali",age:20},
 {name:"Sara",age:15}
  ]));
console.log("----------------------Task 15-------------------");

/*
 * Exercise 15
 *
 * Create array of prices after adding 10 tax
 *
 * Test Case:
 * console.log(addTax([100,200]))
 *
 * Result:
 * [110,210]
*/
function addTax(arr){
 return arr.map(x=>x +10);
}
console.log(addTax([100,200]));
console.log("----------------------Task 16-------------------");

/*
 * Exercise 16
 *
 * Count how many numbers are greater than 50
 *
 * Test Case:
 * console.log(countBig([20,60,80]))
 *
 * Result:
 * 2
*/
function countBig(arr){
 return arr.filter(x=>x>50).length;
}
console.log(countBig([20,60,80]));
console.log("----------------------Task 17-------------------");

/*
 * Exercise 17
 *
 * Convert numbers to "Number: X"
 *
 * Test Case:
 * console.log(labelNumbers([5,10]))
 *
 * Result:
 * ["Number: 5","Number: 10"]
*/
function labelNumbers(arr){
  return arr.map(x=>`Number: ${x} `);
}
console.log(labelNumbers([5,10]));
console.log("----------------------Task 18-------------------");

/*
 * Exercise 18
 *
 * Get product names
 *
 * Test Case:
 * console.log(productNames([
 * {product:"Laptop",price:1000},
 * {product:"Phone",price:500}
 * ]))
 *
 * Result:
 * ["Laptop","Phone"]
*/
function productNames(arr){
 
 return arr.map(e=>e.product);
}
console.log(productNames([
  {product:"Laptop",price:1000},
  {product:"Phone",price:500}
  ]))
 console.log("----------------------Task 19-------------------");

 /*
 * Exercise 19
 *
 * Create array where each number becomes number + index
 *
 * Test Case:
 * console.log(addIndex([5,5,5]))
 *
 * Result:
 * [5,6,7]
*/
function addIndex(arr){
  return arr.map(function(ele,index){
       return ele + index;
   })
}
console.log(addIndex([5,5,5]))
console.log("----------------------Task 20-------------------");
/*
 * Exercise 20
 *
 * Create array of boolean values (true if even)
 *
 * Test Case:
 * console.log(isEvenArray([1,2,3,4]))
 *
 * Result:
 * [false,true,false,true]
*/
function isEvenArray(arr){
  return  arr.map(function(ele){
      if(ele % 2===0){
         return true;
      }else{
         return false;
      }
    });

};
console.log(isEvenArray([1,2,3,4]));