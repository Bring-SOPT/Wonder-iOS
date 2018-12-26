#include <stdio.h>
#define MAX_SIZE 5
typedef int element;
typedef struct {
    element queue[MAX_SIZE];
    int front, rear;
} DequeType;
void init(DequeType * dq);
int is_empty(DequeType * dq);
int is_full(DequeType * dq);
void add_front(DequeType * dq, element item); element del_front(DequeType * dq);
element get_front(DequeType * dq);
void add_rear(DequeType * dq, element item); element del_rear(DequeType * dq);
element get_rear(DequeType * dq);
void display(DequeType * dq);
int main(){
    element result;
    DequeType dq;
    init(&dq);
    // Test add_front, del_front, get_front, add_rear, del_rear, get_rear and display
    add_front(&dq,7);
    add_rear(&dq,6);
    add_front(&dq,3);
    
    result = get_front(&dq);
    printf("%d ",result);
    
    result = get_rear(&dq);
    printf("%d ",result);
    
    result = del_front(&dq);
    printf("%d ",result);
    
    
    result =del_rear(&dq);
    printf("%d ",result);
    
    add_front(&dq,1);
    
    display(&dq);
    
    
    //파트1
    return 0;
}
void init(DequeType *dq){
    //initialize dq
    //파트2
    dq->front =0;
    dq->rear = 0;
}
int is_empty(DequeType*dq){
    return (dq->front == dq->rear);
    //check whether dq is empty
    //파트3
}
int is_full(DequeType*dq){
    return ((dq->rear+1)%MAX_SIZE== dq->front);
    //check whether dq is full
    //파트4
}
void add_front(DequeType*dq,element item){
    if(is_full(dq)){
        printf("넣을 수 없습니다");
    }
    else{
        if(dq->front == 0)
        {dq->queue[dq->front] = item;
            dq->front = 4;}
        else
        {dq->queue[dq->front] = item;
            dq->front = dq->front-1;}}
    //add item to front of dq
    //파트5
}
element del_front(DequeType * dq) {
    if( is_empty(dq) )
        printf("공백입니다");
    else{
        dq->front = (dq->front+1) % MAX_SIZE;
        
    }
    // delete and return item from front of dq
    // 파트6
    return dq->queue[dq->front];}



element get_front(DequeType * dq) {
    // return item from front of dq
    // 파트7
    return dq->queue[(dq->front+1)%MAX_SIZE];
    
}
void add_rear(DequeType * dq, element item) {
    // add item to rear of dq
    //파트8
    if(is_full(dq)){
        printf("넣을 수 없습니다");
    }
    else{
        dq->rear = (dq->rear + 1)% MAX_SIZE;
        dq->queue[dq->rear] = item;
    }
}
element del_rear(DequeType * dq) {
    // delete and return item from rear of dq
    // 파트9
    
    if(is_empty(dq)){
        return printf("지울 수 없습니다"); }
    else{
        
        dq->rear = ((dq->rear+MAX_SIZE-1)%MAX_SIZE);
        
        return dq->queue[(dq->rear+1)%MAX_SIZE];
        
    }
}
element get_rear(DequeType * dq) {
    // return item from rear of dq
    // 파트10
    return dq->queue[dq->rear];
}
void display(DequeType * dq) {//front가 rear보다 앞에 있는 경우와 뒤에 있는 경우를 if문으로 나눔
    int i;
    printf("\n");
    
    if((dq->front+1)%MAX_SIZE < dq->rear){
        for(i=(dq->front+1)%MAX_SIZE;i<=(dq->rear);i++)
            printf("%3d ",dq->queue[i]);}
    
    else if((dq->front+1)%MAX_SIZE > (dq->rear)){
        for(i=(dq->front+1)%MAX_SIZE;i<MAX_SIZE;i++)
            printf("%3d ",dq->queue[i]);}
    for(i=0;i<=(dq->rear);i++)
        printf("%3d ",dq->queue[i]);
}
// print dq from front to rear
// 파트11
