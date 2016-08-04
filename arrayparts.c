#include<stdio.h>

#define size 15


int main()
{

int n=size;

int array[size]={23,12,4,34,4,54,55,45,3,12,4,11,32,12,12};

int y=5;
int i=0;
int k=0;
int l=y;
int sum=0;
int m=0;
int j=0;
float average[]={0};

for(i=1;i<=(n/y);i++)
{

	for(k=m;k<l;k++)
	{
		sum=sum+array[k];

	}

	average[i]=(double)sum/y;

m=l;
l=y*(i+1);
sum=0;

}
float maximum=0;

for(j=1;j<=(n/y);j++)
{
printf("The averages are:\n");
printf("%.2f\n",average[j]);

if(average[j]>maximum)
{
    maximum=average[j];
}


}

printf("The maximum value is :%.2f\n", maximum);


return 0;


}
