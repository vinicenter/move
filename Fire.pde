class Fire {
  int num = 120;
  float[][] fire = new float [num][12];
  
  void update() {
    for(int flame=0 ; flame<num ; flame++) {
      if(fire[flame][0]==1) {
        fire[flame][1]=fire[flame][1]+fire[flame][5]*cos(fire[flame][3]);
        fire[flame][2]=fire[flame][2]+fire[flame][5]*sin(fire[flame][3]);
      }
      fire[flame][7]+=1;
      if(fire[flame][7]>fire[flame][6]) {
        fire[flame][0]=0;
      }
    }
  }

  void show() {
    update();
    for(int flame=0 ; flame<num ; flame++) {
      if(fire[flame][0]==1) {
        fill(fire[flame][9],fire[flame][10],0,40);
        pushMatrix();
        translate(fire[flame][1],fire[flame][2]);
        rotate(fire[flame][8]);
        rect(0,0,fire[flame][4],fire[flame][4]);
        popMatrix();
      }
    }
  }
  
  void create() {
    for(int i=num-1; i>0; i--) {
      for(int fireprop=0;fireprop<11;fireprop++) {
        fire[i][fireprop]=fire[i-1][fireprop];
      }
      fire[0][0]=1;
      fire[0][1]=balls.x+width/30.857;
      fire[0][2]=balls.y;
      fire[0][3]=random(0,PI*2);
      fire[0][4]=random(5,15);
      fire[0][5]=random(1,2);
      fire[0][6]=random(10,40);
      fire[0][7]=0;
      fire[0][8]=random(0,TWO_PI);
      fire[0][9]=random(230,255);
      fire[0][10]=random(50,100);
    }
  }
}
