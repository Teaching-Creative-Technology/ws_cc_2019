// 设置一些常量  

import ddf.minim.*;

Minim minim;
AudioPlayer groove;


final int MAX_CIRCLE_CNT = 2500, MIN_CIRCLE_CNT = 100,  
MAX_VERTEX_CNT = 30, MIN_VERTEX_CNT = 3;  
  
  float r = random(0,255),  
g = random(0,255),  
b = random(0,255);
// 设置两个全局变量：画面中圆的个数、以及构成圆的顶点的数  
int circleCnt, vertexCnt;  
void setup() {  
size(700, 700);  

 minim = new Minim(this);
  //groove = minim.loadFile("jingle.mp3", 1024);
  groove = minim.loadFile("1.mp3", 1024);
  groove.loop();
}  
  
void draw() {  
background(0);  
translate(width / 2, height / 2);  
  
// 根据鼠标更新圆的个数、构成圆的顶点数 
float SoundL = groove.left.level()*100;
float SoundR = groove.right.level()*100;
updateCntBySound(SoundL,SoundR);  
  


// 渲染每一个圆  
for (int i = 0; i < circleCnt; i++) {  
displayCircle(i,r,g,b);  
}  
}  

void updateCntBySound(float l,float r) {  
float xoffset = abs(l*width - width / 2), 
yoffset = abs(r*width - height / 2);  
circleCnt = int(map(xoffset, 0, width / 2, MAX_CIRCLE_CNT, MIN_CIRCLE_CNT));  
vertexCnt = int(map(yoffset, 0, height / 2, MAX_VERTEX_CNT, MIN_VERTEX_CNT));  
}  

void displayCircle(int ci,float r,float g,float b) {  
// 分别控制圆圈的移动速度、分布、大小  
float time = float(frameCount) / 20,  
thetaC = map(ci, 0, circleCnt, 0,  TAU),  
scale = 300;

  
// 获得每一个圆的圆心、半径、颜色  
PVector circleCenter = getCenterByTheta(thetaC, time, scale);  
float circleSize = getSizeByTheta(thetaC, time, scale);  
//color c = getColorByTheta(thetaC, time);  
color c = getColorByTheta(r,g,b);  
  
// 绘制每一个圆的所有顶点  
stroke(c);  
noFill();  
beginShape();  
for (int vi = 0; vi < vertexCnt; vi++) {  
float thetaV = map(vi, 0, vertexCnt, 0, TAU);  
float x = circleCenter.x + cos(thetaV) * circleSize;  
float y = circleCenter.y + sin(thetaV) * circleSize;  
vertex(x, y);  
}  
endShape(CLOSE);  
}  

PVector getCenterByTheta(float theta, float time, float scale) {  
PVector direction = new PVector(cos(theta), sin(theta));  
float distance = 0.6 + 0.2 * cos(theta * 6.0 + cos(theta * 8.0 + time));  
PVector circleCenter = PVector.mult(direction, scale * distance);  
return circleCenter;  
}  

float getSizeByTheta(float theta, float time, float scale) {  
float offset = 0.2 + 0.12 * cos(theta * 9.0 - time * 2.0);  
float circleSize = offset * scale;  
return circleSize;  
}  

color getColorByTheta(float r,float g,float b) {  
/*float th = 8.0 * theta + time * 2.0;  
float r = 0.6 + 0.4 * cos(th),  
g = 0.6 + 0.4 * cos(th - PI / 3),  
b = 0.6 + 0.4 * cos(th - PI * 2.0 / 3.0), */ 
float alpha = map(circleCnt, MIN_CIRCLE_CNT, MAX_CIRCLE_CNT, 150, 30);  
return color(r , g , b , alpha);  
}  
