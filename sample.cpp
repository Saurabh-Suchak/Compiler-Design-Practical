#include <iostream>
#include <bits/stdc++.h>

using namespace std;


int main() {
    int n;
    cin>>n;
    int bud;
    cin>>bud;
    
    vector<int>val;
    for(int i=0;i<n;i++){
        int num;
        cin>>num;
        val.push_back(num);
    }
    
    sort(val.begin(),val.end());
    
    int l = 0, r = n - 1;
   
    int ind1, ind2;
   
      
    int minDiff = INT_MAX;
 
      
    for (int i = 0; i < n; i++) {
        int e = val[i];
         
        int left = i + 1, right = n - 1;
        while (left <= right) {
            int mid = (left + right) / 2;
 
            if (val[mid] + e == bud) {
                ind1 = i;
                ind2 = mid;
                minDiff = 0;
                break;
            }
             
            
            if (abs(val[mid] + e - bud) < minDiff) {
                minDiff = abs(val[mid] + e - bud);
                ind1 = i;
                ind2 = mid;
            }
 
            if (val[mid] + e < bud) {
                left = mid + 1;
            }
             
            else {
                right = mid - 1;
            }
        }
    }

    cout<<min(val[ind1],val[ind2])<<endl;
    cout<<max(val[ind2],val[ind1])<<endl;


    return 0;
}