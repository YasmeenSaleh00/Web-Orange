//Create a function that returns an array containing only the first and last elements.
document.write("Task 1");
document.write("<br>");
let arr1 =[1,2,3,4,5];
function firstAndLast(array) {
  return [ array.slice(0,1), array[array.length - 1] ].flat();
}
document.write(firstAndLast(arr1));
document.write("<br>");
document.write("<br>");
//Create a function that removes the middle element from an array.
document.write("Task 2");
document.write("<br>");
function removeMiddle(array) {
  Math.floor(array.splice(array.length / 2,1))  ;
   return array
}
document.write(removeMiddle(arr1));
document.write("<br>");
document.write("<br>");
//Create a function that swaps the first and last elements.
document.write("Task 3");
document.write("<br>");
let arr2 = [1,2,3,4,5]
function swapFirstLast(array) {
let first = array.shift();
let last = array.pop();
array.unshift(last);
array.push(first);
return array;
}
document.write(swapFirstLast(arr2)); 
document.write("<br>");
document.write("<br>");
//Insert a value in the middle of the array.
document.write("Task 4");
document.write("<br>");
let arr3=[1,2,3,4];
function insertAtMiddle(array,value){
    let middleIndex = Math.floor(array.length / 2);
  array.splice(middleIndex,0,value);
  return array;
}
document.write(insertAtMiddle(arr3,10)); 
document.write("<br>");
document.write("<br>");
//Create a function that duplicates the array content.
document.write("Task 5");
document.write("<br>");
let arr4=[1,2,3];
function duplicateArray(array){

  return array.concat(array);
}
document.write(duplicateArray(arr4)); 
document.write("<br>");
document.write("<br>");
//Create a function that removes duplicate numbers.
document.write("Task 6");
document.write("<br>");
let arr5=[1,2,2,3,4,4,5];

function removeDuplicates(array){
    let newArr=[]
for(let i=0;i<array.length;i++){
    if(!newArr.includes(array[i])){
        newArr.push(array[i]);
    }
}
return newArr;
  
}
document.write(removeDuplicates(arr5)); 
document.write("<br>");
document.write("<br>");
//Return the second largest number.
document.write("Task 7");
document.write("<br>");
let arr6=[4,9,2,10,6];
function findSecondLargest(array){
let uniqueArray = removeDuplicates(array);
uniqueArray.sort((a, b) => a - b);
    return uniqueArray[uniqueArray.length - 2]
  
}
document.write(findSecondLargest(arr6)); 
document.write("<br>");
document.write("<br>");
//Return the second smallest number.
document.write("Task 8");
document.write("<br>");
let arr7=[4,9,2,10,6];
function findSecondSmallest(array){
let uniqueArray = removeDuplicates(array);
uniqueArray.sort((a, b) => a - b);
    return uniqueArray[1]
  
}
document.write(findSecondSmallest(arr7)); 
document.write("<br>");
document.write("<br>");
//Return a new array without numbers greater than a given value.
document.write("Task 9");
document.write("<br>");
let arr8=[10,5,20,3,8];
function removeGreaterThan(array,value){
let newArr=[];
    for(let i=0;i<array.length;i++){
        if(array[i] < value){
           newArr.push(array[i]);
        }
    }
    return newArr;
  
}
document.write(removeGreaterThan(arr8,10)); 
document.write("<br>");
document.write("<br>");
//Return numbers greater than or equal to the value.
document.write("Task 10");
document.write("<br>");
let arr9=[10,5,20,3,8];
function removeLessThan(array,value){
    return   array.filter(x=>x >= value)
  
}
document.write(removeLessThan(arr9,10)); 
document.write("<br>");
document.write("<br>");
//Return how many times a value appears.
document.write("Task 11");
document.write("<br>");
let arr10=[1,2,3,2,4,2]
function countOccurrences(array,value){
  let filteredArray = array.filter(x=>x == value);
  return filteredArray.length
}
document.write(countOccurrences(arr10,2)); 
document.write("<br>");
document.write("<br>");
//Return elements that exist in both arrays.
document.write("Task 12");
document.write("<br>");
let arr11=[1,2,3,4];
let arr12 =[3,4,5,6];
function arrayIntersection(array1,array2){
   return array1.filter(x => array2.includes(x));
}
document.write(arrayIntersection(arr11,arr12)); 
document.write("<br>");
document.write("<br>");
//Return values that exist in arr1 but not in arr2.
document.write("Task 13");
document.write("<br>");
let arr13=[1,2,3,4];
let arr14=[3,4];
function arrayDifference(array1,array2){
   return array1.filter( x => ! (array2.includes(x)));
}
document.write(arrayDifference(arr13,arr14)); 
document.write("<br>");
document.write("<br>");
//Merge two arrays and remove duplicates.
document.write("Task 14");
document.write("<br>");
let arr15=[1,2,3];
let arr16=[3,4,5];
function uniqueMerge(array1,array2){
   let newArr = arr15.concat(arr16);
   let uniqueArr = [];
   //استخدام الfunction الي بانيته من قبل
//   newArr= removeDuplicates(newArr);
//    return newArr;
// او من الصفر
for(let i =0;i<newArr.length;i++){
    if(! uniqueArr.includes(newArr[i])){
        uniqueArr.push(newArr[i]);
    }
}
return uniqueArr;
}
document.write(uniqueMerge(arr15,arr16)); 
document.write("<br>");
document.write("<br>");
//Remove all negative numbers.
document.write("Task 15");
document.write("<br>");
let arr17=[5,-2,10,-3,7];
function removeNegativeNumbers(array){
    return array.filter(x=> x>=0);
}
document.write(removeNegativeNumbers(arr17)); 
document.write("<br>");
document.write("<br>");
//Return words longer than a specific length.
document.write("Task 16");
document.write("<br>");
let names=["alex","mohammad","ali","sara"];
function wordsLongerThan(arr,length){
    return arr.filter(x=> x.length > length)
}
document.write(wordsLongerThan(names,4)); 
document.write("<br>");
document.write("<br>");
//Count how many words contain a specific letter.
document.write("Task 17");
document.write("<br>");
let fruits=["apple","banana","car","dog"];
function countLetterInWords(arr,letter){
    arr= arr.filter(x=> x.includes(letter))
    return arr.length
}
document.write(countLetterInWords(fruits,"a")); 
document.write("<br>");
document.write("<br>");
//Remove words shorter than a specific length.
document.write("Task 18");
document.write("<br>");
function removeShortWords(arr,length){
    
    return arr.filter(x=> x.length > length);
}
document.write(removeShortWords(fruits,3)); 
document.write("<br>");
document.write("<br>");
//Return the longest word in the array.
document.write("Task 19");
document.write("<br>");
function findLongestWord(arr){
    
// let longest = arr[0]; 

//     for (let word of arr) {
//         if (word.length > longest.length) {
//             longest = word; 
//         }
//     }
//     return longest;
 arr.sort((a,b)=> b.length - a.length);
 return arr[0]
}
document.write(findLongestWord(fruits)); 
document.write("<br>");
document.write("<br>");
//Return the shortest  word in the array.
document.write("Task 20");
document.write("<br>");
function findShortestWord(arr){
    
// let shortest = arr[0]; 

//     for (let word of arr) {
//         if (word.length < shortest.length) {
//             shortest = word; 
//         }
//     }
//     return shortest;
 arr.sort((a,b)=> a.length - b.length);
 return arr[0]
}
document.write(findShortestWord(fruits)); 
document.write("<br>");
document.write("<br>");
//Sort words by their length.
document.write("Task 21");
document.write("<br>");
let mixed =["apple","hi","banana"]
function sortByLength(arr){
  return  arr.sort((a,b)=> a.length - b.length);

}
document.write(sortByLength(mixed)); 
document.write("<br>");
document.write("<br>");
//Remove every second element from the array.
document.write("Task 22");
document.write("<br>");
let numbers =[1,2,3,4,5,6];
function removeEverySecond(arr){
 return arr.filter((x, i) => i % 2 === 0);

}
document.write(removeEverySecond(numbers)); 
document.write("<br>");
document.write("<br>");
//Return the sum of even numbers.
document.write("Task 23");
document.write("<br>");
function sumEvenNumbers(arr){
 return arr.filter( x=> x % 2 === 0).reduce(function(acc,current){
        

    return acc+current;
 },0);

}
document.write(sumEvenNumbers(numbers)); 
document.write("<br>");
document.write("<br>");
//Return the sum of numbers in odd indexes.
document.write("Task 24");
document.write("<br>");
function sumOddIndex(arr){
 return arr.filter( (x,i)=> i % 2 !== 0).reduce(function(acc,current){
    return acc+current;
 },0);

}
document.write(sumOddIndex(numbers)); 
document.write("<br>");
document.write("<br>");
//Reverse the array without using reverse().
document.write("Task 25");
document.write("<br>");
function reverseWithoutReverse(arr){
    let reversedArray=[]
for(let i = 0; i< arr.length ; i++){
   reversedArray.unshift(arr[i]);
}
return reversedArray;

}
document.write(reverseWithoutReverse(numbers)); 
document.write("<br>");
document.write("<br>");
//The array contains numbers from 1 to N, but one number is missing.
document.write("Task 26");
document.write("<br>");
let missdArray =[1,2,3,5,6];
function findMissingNumber(arr){
 arr.sort((a, b) => a - b);
 for (let i = 0; i < arr.length; i++) {
    if (arr[i] !== i + 1) {
      return i + 1;
    }
  }

  return arr.length + 1;
}
document.write(findMissingNumber(missdArray)); 
document.write("<br>");
document.write("<br>");
//TReturn two numbers that sum to target.
document.write("Task 27");
document.write("<br>");
let array =[2,7,11,15];
function pairSum(arr,target){
for (let i = 0; i < arr.length; i++) {
        for (let j = i+1; j < arr.length; j++) {
      
      if (arr[i] + arr[j] === target) {
        return [arr[i], arr[j]]; 
      }
    }
  }
  return "No pair found"; 

}
document.write(pairSum(array,9)); 
document.write("<br>");
document.write("<br>");
//Rotate the array to the right by N steps.
document.write("Task 28");
document.write("<br>");
let array1 =[1,2,3,4,5];
function rotateArray(arr,steps){

  
  let end = arr.slice(-steps);       
  let start = arr.slice(0, -steps);  
  
  return end.concat(start);
}
document.write(rotateArray(array1,2)); 
document.write("<br>");
document.write("<br>");
//Split the array into smaller arrays of size N.
document.write("Task 29");
document.write("<br>");
let array2 =[1,2,3,4,5,6];
function chunkArray(arr,size){
    let result = []; 
  for (let i = 0; i < arr.length; i += size) {
    let chunk = arr.slice(i, i + size);
    result.push(chunk);
  }
  console.log(result)

  return result;
}
document.write(chunkArray(array2,2)); 
document.write("<br>");
document.write("<br>");
//Group words by their length..
document.write("Task 30");
document.write("<br>");
let array3 =["hi","cat","dog","apple"];
function groupByLength(arr){
 
  let result = {};
  for(let i =0; i< arr.length;i++){
let word = arr[i];
    let len = word.length;
    if (!result[len]) {
      result[len] = [];
    }
    result[len].push(word);
  }
  console.log(result)
return result;}
document.write(groupByLength(array3)); 