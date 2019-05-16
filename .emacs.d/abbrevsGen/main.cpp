#include <iostream>
#include <cstring>
#include <fstream>
#include <vector>
using namespace std;

int main()
{
    //ifstream infile;
    ofstream outfile;
    outfile.open("LATEX_subscripted_numbers_letters.el");

    //65-90
    //97-122
    char tst = 0;
    std::vector<std::string> greeks;
    greeks.push_back("\\\\alpha");
    greeks.push_back("\\\\beta");
    greeks.push_back("\\\\gamma");
    greeks.push_back("\\\\delta");
    greeks.push_back("\\\\zeta");
    greeks.push_back("\\\\eta");
    greeks.push_back("\\\\sigma");
    greeks.push_back("\\\\theta");
    greeks.push_back("\\\\iota");
    greeks.push_back("\\\\kappa");
    greeks.push_back("\\\\lambda");
    greeks.push_back("\\\\mu");
    greeks.push_back("\\\\nu");
    greeks.push_back("\\\\xi");
    greeks.push_back("\\\\omicron");
    greeks.push_back("\\\\pi");
    greeks.push_back("\\\\rho");
    greeks.push_back("\\\\tau");
    greeks.push_back("\\\\upsilon");
    greeks.push_back("\\\\phi");
    greeks.push_back("\\\\chi");
    greeks.push_back("\\\\psi");
    greeks.push_back("\\\\omega");
    greeks.push_back("\\\\Alpha");
    greeks.push_back("\\\\Beta");
    greeks.push_back("\\\\Gamma");
    greeks.push_back("\\\\Delta");
    greeks.push_back("\\\\Zeta");
    greeks.push_back("\\\\Eta");
    greeks.push_back("\\\\Sigma");
    greeks.push_back("\\\\Theta");
    greeks.push_back("\\\\Iota");
    greeks.push_back("\\\\Kappa");
    greeks.push_back("\\\\Lambda");
    greeks.push_back("\\\\Mu");
    greeks.push_back("\\\\Nu");
    greeks.push_back("\\\\Xi");
    greeks.push_back("\\\\Omicron");
    greeks.push_back("\\\\Pi");
    greeks.push_back("\\\\Rho");
    greeks.push_back("\\\\Tau");
    greeks.push_back("\\\\Upsilon");
    greeks.push_back("\\\\Phi");
    greeks.push_back("\\\\Chi");
    greeks.push_back("\\\\Psi");
    greeks.push_back("\\\\Omega");

    for(int i=0; i < greeks.size(); i++)
    {
        for(int j = 0; j <= 9; j++)
        {
            outfile << "(\"" << greeks[i].substr(2,2) << j << "\" \"" << greeks[i] << "_" << j << "\" nil 0)\n";
        }
        for(int j = 10; j <= 99; j++)
        {
            outfile << "(\"" << greeks[i].substr(2,2) << j << "\" \"" << greeks[i] << "_{" << j << "}\" nil 0)\n";
        }
    }

    for(int i = 65; i <= 90; i++)
    {
        for(int j = 0; j <= 9; j++)
        {
    	    outfile << "(\"" << (char)i << j << "\" \"" << (char)i << "_" << j << "\" nil 0)\n";
        }
        for(int j = 10; j <= 99; j++)
        {
    	    outfile << "(\"" << (char)i << j << "\" \"" << (char)i << "_{" << j << "}\" nil 0)\n";
        }
    }
    for(int i = 97; i <= 122; i++)
    {
        for(int j = 0; j <= 9; j++)
        {
    	    outfile << "(\"" << (char)i << j << "\" \"" << (char)i << "_" << j << "\" nil 0)\n";
        }
        for(int j = 10; j <= 99; j++)
        {
    	    outfile << "(\"" << (char)i << j << "\" \"" << (char)i << "_{" << j << "}\" nil 0)\n";
        }
    }

    //dots
    for(int i = 65; i <= 90; i++)
    {
        for(int j = 0; j <= 9; j++)
        {
    	    outfile << "(\"dot" << (char)i << j << "\" \"\\\\dot{" << (char)i << "}_" << j << "\" nil 0)\n";
        }
        for(int j = 10; j <= 99; j++)
        {
    	    outfile << "(\"dot" << (char)i << j << "\" \"\\\\dot{" << (char)i << "}_{" << j << "}\" nil 0)\n";
        }
    }
    for(int i = 97; i <= 122; i++)
    {
        for(int j = 0; j <= 9; j++)
        {
    	    outfile << "(\"dot" << (char)i << j << "\" \"\\\\dot{" << (char)i << "}_" << j << "\" nil 0)\n";
        }
        for(int j = 10; j <= 99; j++)
        {
    	    outfile << "(\"dot" << (char)i << j << "\" \"\\\\dot{" << (char)i << "}_{" << j << "}\" nil 0)\n";
        }
    }
    outfile.close();
    //char path[100]="";
    ////char b[3];
    //char CourseName[]="Group_Theory";
    //char ext[] = ".tex";
    //for(int j=1;j<=2;j++)
    //{
    //for(int k=1;k<=12;k++)
    //{
    //    strcpy(path,"/home/greg/Documents/MMath/Delete_Me_1_2_3/");
    //    if(k<10)
    //    {
    //        char Week[2]="";
    //        Week[0] = (char)(k+48);
    //        char Lecture[2]={(char)(j+48)};
    //        //strcpy(f,(char)(j+48));
    //        strcat(path,CourseName);
    //        strcat(path,Week);
    //        strcat(path,"_");
    //        strcat(path,Lecture);
    //        cout << strcat(path,ext)<<endl;
    //        outfile.open(path);
    //        outfile << "";
    //        outfile.close();

    //    }
    //    else{
    //            char Week[2]="";
    //            Week[0] = (char)(k+38);
    //            char Lecture[2]={(char)(j+48)};
    //            strcat(path,CourseName);
    //            strcat(path,"1");
    //            strcat(path,Week);
    //            strcat(path,"_");
    //            strcat(path,Lecture);
    //            cout << strcat(path,ext)<<endl;
    //            outfile.open(path);
    //            outfile << "";
    //            outfile.close();
    //        }
    //}
    //}
    ////b[0]=i;
    ////b[1]=i+1;
    ////strcat(path,b);
    ////cout << b[0];
    ////cout << b[1];
    ////strcat(path,b);
    ////cout << a;
    return 0;
}
