//Task 1
//A system logs user events, but the data became too large due to repeated consecutive actions. The company wants to compress 
// the logs by grouping consecutive identical events and counting how many times they occurred.
console.log("------------Task 1-------------");
let array=[
  { event:"click", time:1 },
  { event:"click", time:2 },
  { event:"scroll", time:3 },
  { event:"scroll", time:4 },
  { event:"click", time:5 },
  { event:"hover", time:6 }
];

function logsUserEvent(arr){
 let newArray=[{event :arr[0]["event"],count:1}];
for(let i=1;i<arr.length;i++){
    let lastAdded = newArray[newArray.length-1]
    if(arr[i]["event"]=== lastAdded.event){
       lastAdded.count++;
    }else{
        newArray.push({event :arr[i]["event"],count:1});
    }
}       
return newArray;
}
console.log(logsUserEvent(array));
// Task 2
// A finance system records daily expenses. The management wants to know if there is a continuous period where the total
//  expense equals a specific target.Task ==> Return the start and end indices of the subarray
console.log("------------Task 2-------------");
function catchTheTarget(arr,target){
    
for(let i =0; i< arr.length;i++){
    let sum=0;
    // عشان يبلش جمع من محل ما انا واقف 
    for(let j=i ; j< arr.length;j++){
       sum+=arr[j];
        if(sum === target){
            return`start = ${i} end = ${j}`
        }
        if(sum> target){
            break;
        }
    } 
}
return -1;
}

console.log(catchTheTarget([1,4,20,3,10,5],33));
//Task 3
//You are tracking stock prices over time. You can buy once and sell once (after buying). Your goal is to maximize profit.
console.log("------------Task 3-------------");
function catchTheMaxProfit(arr){
     let minPrice = arr[0];
     let maxProfit = 0;
    for(let i =1;i<arr.length;i++){
       
        if(arr[i] < minPrice){
            minPrice=arr[i];
        }if(arr[i]-minPrice>maxProfit){
            maxProfit = arr[i]-minPrice;
        }
    }
    return maxProfit;
}

console.log(catchTheMaxProfit([7,1,5,3,6,4]));
//Task 4
//Buildings have different heights, and when it rains, water gets trapped between them.
//  You need to calculate how much water is stored.
console.log("------------Task 4-------------");
function trapWater(arr){
    let leftMax =[];
    let rightMax =[];
    
    let currentLeftMax=0
for(let i=0; i<arr.length;i++){
if(currentLeftMax < arr[i]){
    currentLeftMax=arr[i]
}
leftMax[i]=currentLeftMax;
}
let currentRightMax = 0;
for(let i=arr.length-1; i>=0;i--){

if(currentRightMax < arr[i]){
   currentRightMax=arr[i]
}
rightMax[i]=currentRightMax
}
let totalWater=0;
for(let i =0;i<arr.length;i++){
let min = Math.min(leftMax[i],rightMax[i]);
totalWater += (min - arr[i]);
}
return totalWater;
}

console.log(trapWater([0,1,0,2,1,0,1,3,2,1,2,1]));
//Task 5
//A user browsing log is recorded. You need to find the longest continuous period where no value is repeated.
console.log("------------Task 5-------------");

function  longestUniqueSubarray(arr){

let maxLength=0;

for(let i=0;i<arr.length;i++){
    let current=[];
    // برضو بدي ابلش مكان ما انا واقفة
for(let j= i;j<arr.length ;j++){
    if(current.includes(arr[j])){
        break;
    }
        current.push(arr[j])
    if(current.length > maxLength){
        maxLength = current.length
    }
}
}
return maxLength;
}

console.log(longestUniqueSubarray([1,2,3,1,2,3,4,5]));
//Task 6
//Each number should be replaced by the product of all other numbers in the array (excluding itself).
//  Division is not allowed.
console.log("------------Task 6-------------");
function ProductofArrayExceptSelf (arr){
    //nested loop method
//     let producArray=[];
// for(let i=0;i<arr.length;i++){
// let product=1;
// for(let j =0;j<arr.length;j++){
//     if(i!==j){
// product*=arr[j]
//     }

// }
// producArray.push(product)

// }
// return producArray;

//without nested loop
let result =[];
let leftProduct=1;
 for(let i=0;i<arr.length;i++){
     result[i] = leftProduct;
     leftProduct *=arr[i];
     //result =[1,1,2,6] هيك بصير شكلها
 }
 let rightProduct =1;
 for(let i = arr.length-1;i>=0 ;i--){
    //بنضرب اليسار بالقيمة الي اصلا موجودة باليمين
    // result =[24,12,4,4]بس من اليمين قبل ما اضربها
    result[i] *= rightProduct;
    rightProduct *=arr[i];
 }
 return result
}
console.log(ProductofArrayExceptSelf([1,2,3,4]));
//Task 7
//A robot moves in a spiral path inside a grid and collects numbers along the way.
// ```
// [
//   [1,2,3],
//   [4,5,6],
//   [7,8,9]
// ]
// ```

// 🎯 **Task:**

// ```
// [1,2,3,6,9,8,7,4,5]
// ```
console.log("------------Task 7-------------");
function spiralPath(matrix) {
 return `not solved yet`
}

console.log(spiralPath([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
])); 
//Task 8
//You have a list of purchased items, and a target list of required items.
//  Find the smallest continuous part that contains all required items.
// arr= [1,2,2,3,1,2,3]
// target= [1,2,3]
console.log("------------Task 8-------------");
function minWindowSubarray(arr, target) {
    let minLen = Infinity;
    let result = [];


    return `not solved yet`;
}

console.log(minWindowSubarray([1, 2, 2, 3, 1, 2, 3], [1, 2, 3]));