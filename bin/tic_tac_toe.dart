import 'dart:io';
void printArr(var arr){// print the board
  int num=0;
  for(int i=0; i<9; i++){
    if(num==3){
      num=0;
      print('');
      print('---+---+---');
    }
    if(num!=2){
      stdout.write(' ${arr.elementAt(i)} |');
    }
    else{
      stdout.write(' ${arr.elementAt(i)} ');
    }
    num++;
  }
  print('\n');
}

bool checkWinner(var arr){//method to check the winner, the method return true if there is 3 x/o lined
  bool win= false;
  for(int i=0; i<=6; i+=3){
    if((arr[i]==arr[i+1]) && (arr[i+1]==arr[i+2]) && (arr[i]=='X' || arr[i]=='O')){//check if 3 x/o linde in row
      win=true;
    }
  }
  for(int i=0; i<=2; i++){
    if((arr[i]==arr[i+3]) && (arr[i+3]==arr[i+6]) && (arr[i]=='X' || arr[i]=='O')){//check if 3 x/o linde in column
      win=true;
    }
  }
  for(int i=0; i<=0;i++){
    if((arr[i]==arr[i+4]) && (arr[i+4]==arr[i+8]) && (arr[i]=='X' || arr[i]=='O')){//check if 3 x/o linde diagonally from top left to bottom right
      win=true;
    }
  }
  for(int i=2; i<=2;i++){
    if((arr[i]==arr[i+2]) && (arr[i+2]==arr[i+4]) && (arr[i]=='X' || arr[i]=='O')){//check if 3 x/o linde diagonally from top right to bottom left
      win=true;
    }
  }
  return win;
}
void main(List<String> arguments) {
  var arr=['1','2','3','4','5','6','7','8','9'];//array with the board numbers
  var check=[];//array to check if the number of the square entered by the user is not used
  printArr(arr);
  int i=1;
  while(!checkWinner(arr) && i<=9){
    if(i%2==1){
      print('Player 1, please enter the number of the square where you want to place your X:');
      int input=int.parse(stdin.readLineSync()!);
      print('');
      if(input<10 && input>0 && check.indexOf(input)==-1){//check if the numbers entered are allowed
        check.add(input);//add the number of the square choosed by the user to the check array
        arr[input-1]='X';
      }else{
        continue;//if the number isn't allowed the user will have to enter another one
      }
    }else{
      print('Player 2, please enter the number of the square where you want to place your O:');
      int input=int.parse(stdin.readLineSync()!);
      print('');
      if(input<10 && input>0 && check.indexOf(input)==-1){
        check.add(input);
        arr[input-1]='O';
      }else{
        continue;
      }
    }
    printArr(arr);
    i++;
  }
  i--;
  if(i==9){
    print("Draw");//if the number = 9 that means the boared is full
  }else{//if any user won before the boared is full
    if(i%2==1){
      print('Player 1 wins');
    }else{
      print('Player 2 wins');
    }
  }
}
