'''
Created on Jun 1, 2020

@author: vermnimi
'''
def countingNumbers(N):
    
    for i in range(100,0,-1):
        if(i%5==0 and i%3==0):
            print("Testing")
        elif(i%3==0):
            print("Software")
        elif(i%5==0):
            print("Agile")
        else:
            print(i)
            
if __name__=="__main__":
    countingNumbers(100)