

float counter = 0;
int steps = 100;
float dt = 1.0 / (float)steps;

ArrayList<ControlPoint> controlPointList;

void setup(){
  size(800, 450, OPENGL);
  
  hint(DISABLE_OPTIMIZED_STROKE);
  
  // 画像が滑らかになるらしいので書いておく
  smooth();
  
  // HSBで表示するための設定
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  controlPointList = new ArrayList<ControlPoint>();
  controlPointList.add(new ControlPoint(-200, -100));
  controlPointList.add(new ControlPoint(0, -200));
  controlPointList.add(new ControlPoint(200, 0));
  controlPointList.add(new ControlPoint(0, 200));
  controlPointList.add(new ControlPoint(-200, 100));
  
  counter = 0;
}

void draw(){
  background(0);

  translate(width / 2, height / 2);

  strokeWeight(1);
  noFill();

  stroke(0, 100, 100);
  line(width / 2, 0, - width / 2, 0);
  stroke(240, 100, 100);
  line(0, height / 2, 0, - height / 2);
 
  stroke(0, 0, 100);
  noFill();
  drawBezierCurve(controlPointList, steps, counter * (1.0 / (float)steps));
  if(counter < steps){
    counter++;
  }else{
    counter = 0;
  }
  noStroke();
  fill(200, 100, 100);
  for(int i = 0; i < controlPointList.size(); i++){
    ellipse(controlPointList.get(i).x, controlPointList.get(i).y, 10, 10);
  }
}

boolean drawBezierCurve(ArrayList<ControlPoint> controlPointList, int steps, float t){
    print("steps:" + steps);
    println(", t:" + t);
  if((controlPointList.size() > 2) && (0 < steps)){

    stroke(180, 100, 100);
    _drawControlPoint2(controlPointList, t, 6);

    //_drawBezierCurve(controlPointList, t);
  }else{
    println("invalied control point list size");
    return false;
  }
  
  return true;
}

boolean _drawBezierCurve(ArrayList<ControlPoint> controlPointList, float t){
  // ベジエ曲線の制御点の計算
  // 次数は最初にコールされた本関数のcontrolPointListのsize() - 1に等しい
  
  stroke(120, 100, 100);
  
  if(controlPointList.size() > 2){
    // 制御点リストの生成
    ArrayList<ControlPoint> controlPointListChild = new ArrayList<ControlPoint>();
    
    for(int id = 0; id < controlPointList.size() - 1; id++){
     controlPointListChild.add(new ControlPoint((1 - t) * controlPointList.get(id).x + t * controlPointList.get(id + 1).x, 
                                                 (1 - t) * controlPointList.get(id).y + t * controlPointList.get(id + 1).y));
    }
    _drawBezierCurve(controlPointListChild, t);
    
  }else{
    println("ellipse:drawing[x]=" + ((1 - t) * controlPointList.get(0).x + t * controlPointList.get(1).x)
                         + "[y]=" + ((1 - t) * controlPointList.get(0).y + t * controlPointList.get(1).y));
    //vertex((1 - t) * controlPointList.get(0).x + t * controlPointList.get(1).x, (1 - t) * controlPointList.get(0).y + t * controlPointList.get(1).y);
    ellipse((1 - t) * controlPointList.get(0).x + t * controlPointList.get(1).x, (1 - t) * controlPointList.get(0).y + t * controlPointList.get(1).y, 10, 10);
  }
  
  return true;
}

boolean _drawControlPoint(ArrayList<ControlPoint> controlPointList, float t, int degree){
  // ベジエ曲線の制御点の計算
  // 次数は最初にコールされた本関数のcontrolPointListのsize() - 1に等しい
  
  //stroke(0, 0, map(controlPointList.size(), 3, degree, 20, 100));
  stroke(255);
  if(controlPointList.size() > 3){
    // 制御点リストの生成
    ArrayList<ControlPoint> controlPointListChild = new ArrayList<ControlPoint>();
    
    for(int id = 0; id < controlPointList.size() - 2; id++){
      line((1 - t) * controlPointList.get(id).x + t * controlPointList.get(id + 1).x, 
           (1 - t) * controlPointList.get(id).y + t * controlPointList.get(id + 1).y,
           (1 - t) * controlPointList.get(id + 1).x + t * controlPointList.get(id + 2).x, 
           (1 - t) * controlPointList.get(id + 1).y + t * controlPointList.get(id + 2).y);
    }

    for(int id = 0; id < controlPointList.size() - 1; id++){
      controlPointListChild.add(new ControlPoint((1 - t) * controlPointList.get(id).x + t * controlPointList.get(id + 1).x, 
                                                 (1 - t) * controlPointList.get(id).y + t * controlPointList.get(id + 1).y));
    }
    _drawControlPoint(controlPointListChild, t, degree);
  }else{
      line((1 - t) * controlPointList.get(0).x + t * controlPointList.get(1).x, 
           (1 - t) * controlPointList.get(0).y + t * controlPointList.get(1).y,
           (1 - t) * controlPointList.get(1).x + t * controlPointList.get(2).x, 
           (1 - t) * controlPointList.get(1).y + t * controlPointList.get(2).y);
  }
  
  return true;
}

boolean _drawControlPoint2(ArrayList<ControlPoint> controlPointList, float t, int degree){
  // ベジエ曲線の制御点の計算
  // 次数は最初にコールされた本関数のcontrolPointListのsize() - 1に等しい
  
  stroke(map(t, 0, 1, 0, 360), 100, map(degree, 1, controlPointList.size(), 40, 100));
  
  for(int id = 0; id < controlPointList.size(); id++){
  int idTmp1, idTmp2;
  idTmp1 = (id + 1) % controlPointList.size();
  idTmp2 = (id + 2) % controlPointList.size();
  line((1 - t) * controlPointList.get(id).x + t * controlPointList.get(idTmp1).x, 
       (1 - t) * controlPointList.get(id).y + t * controlPointList.get(idTmp1).y,
       (1 - t) * controlPointList.get(idTmp1).x + t * controlPointList.get(idTmp2).x, 
       (1 - t) * controlPointList.get(idTmp1).y + t * controlPointList.get(idTmp2).y);
  }
  
  if(degree > 1){
    // 制御点リストの生成
    ArrayList<ControlPoint> controlPointListChild = new ArrayList<ControlPoint>();
    
    for(int id = 0; id < controlPointList.size(); id++){
      int idTmp1 = (id + 1) % controlPointList.size();
      controlPointListChild.add(new ControlPoint((1 - t) * controlPointList.get(id).x + t * controlPointList.get(idTmp1).x, 
                                                 (1 - t) * controlPointList.get(id).y + t * controlPointList.get(idTmp1).y));
    }
    _drawControlPoint2(controlPointListChild, t, degree - 1);
  }else{
      line((1 - t) * controlPointList.get(0).x + t * controlPointList.get(1).x, 
           (1 - t) * controlPointList.get(0).y + t * controlPointList.get(1).y,
           (1 - t) * controlPointList.get(1).x + t * controlPointList.get(2).x, 
           (1 - t) * controlPointList.get(1).y + t * controlPointList.get(2).y);
  }
  
  return true;
}