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
  {event:"hover",time:6}
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


console.log("not solved yet");
//Task 5
//A user browsing log is recorded. You need to find the longest continuous period where no value is repeated.
console.log("------------Task 5-------------");

function  longestUniqueSubarray(arr){

let maxLength=0;
 let current=[];
for(let i=0;i<arr.length;i++){
   
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
return current;
}

console.log(longestUniqueSubarray([1,2,3,1,2,3,4,5]));
