//
//  ViewController.m
//  LSDrawTest
//
//  Created by linyoulu on 2017/2/7.
//  Copyright © 2017年 linyoulu. All rights reserved.
//

#import "ViewController.h"
#import "LSDrawView.h"

@interface ViewController ()
{
    LSDrawView *drawView;
    UIImageView *bgImgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    bgImgView = [UIImageView new];
    bgImgView.frame = self.view.bounds;
    
    bgImgView.image = [UIImage imageNamed:@"20130616030824963"];
    
//    [self.view addSubview:bgImgView];
    
    
    drawView = [[LSDrawView alloc] initWithFrame:self.view.bounds];
    drawView.brushColor = [UIColor blueColor];
    drawView.brushWidth = 3;
    drawView.shapeType = LSShapeCurve;
    
    drawView.backgroundImage = [UIImage imageNamed:@"20130616030824963"];
    
    [self.view addSubview:drawView];
    
    
    //工具栏
    
    
    
    
    UIButton *btnUndo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnUndo.backgroundColor = [UIColor orangeColor];
    btnUndo.frame = CGRectMake(20, 20, 60, 20);
    [btnUndo setTitle:@"撤销" forState:UIControlStateNormal];
    
    [btnUndo addTarget:self action:@selector(btnUndoClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnUndo];
    
    
    UIButton *btnRedo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRedo.backgroundColor = [UIColor orangeColor];
    btnRedo.frame = CGRectMake(100, 20, 60, 20);
    [btnRedo setTitle:@"重做" forState:UIControlStateNormal];
    
    [btnRedo addTarget:self action:@selector(btnRedoClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnRedo];
    
    
    UIButton *btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSave.backgroundColor = [UIColor orangeColor];
    btnSave.frame = CGRectMake(180, 20, 60, 20);
    [btnSave setTitle:@"保存" forState:UIControlStateNormal];
    
    [btnSave addTarget:self action:@selector(btnSaveClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnSave];
    
    UIButton *btnClean = [UIButton buttonWithType:UIButtonTypeCustom];
    btnClean.backgroundColor = [UIColor orangeColor];
    btnClean.frame = CGRectMake(260, 20, 60, 20);
    [btnClean setTitle:@"清除" forState:UIControlStateNormal];
    
    [btnClean addTarget:self action:@selector(btnCleanClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnClean];
    
    
    
    UIButton *btnCurve = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCurve.backgroundColor = [UIColor orangeColor];
    btnCurve.frame = CGRectMake(20, 50, 60, 20);
    [btnCurve setTitle:@"曲线" forState:UIControlStateNormal];
    
    [btnCurve addTarget:self action:@selector(btnCurveClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnCurve];
    
    
    UIButton *btnLine = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLine.backgroundColor = [UIColor orangeColor];
    btnLine.frame = CGRectMake(100, 50, 60, 20);
    [btnLine setTitle:@"直线" forState:UIControlStateNormal];
    
    [btnLine addTarget:self action:@selector(btnLineClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnLine];
    
    
    UIButton *btnEllipse = [UIButton buttonWithType:UIButtonTypeCustom];
    btnEllipse.backgroundColor = [UIColor orangeColor];
    btnEllipse.frame = CGRectMake(180, 50, 60, 20);
    [btnEllipse setTitle:@"椭圆" forState:UIControlStateNormal];
    
    [btnEllipse addTarget:self action:@selector(btnEllipseClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnEllipse];
    
    
    UIButton *btnRect = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRect.backgroundColor = [UIColor orangeColor];
    btnRect.frame = CGRectMake(260, 50, 60, 20);
    [btnRect setTitle:@"矩形" forState:UIControlStateNormal];
    
    [btnRect addTarget:self action:@selector(btnRectClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnRect];
    
    
    UIButton *btnRec = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRec.backgroundColor = [UIColor orangeColor];
    btnRec.frame = CGRectMake(20, 80, 60, 20);
    [btnRec setTitle:@"录制" forState:UIControlStateNormal];
    
    [btnRec addTarget:self action:@selector(btnRecClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnRec];
    
    UIButton *btnPlay = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPlay.backgroundColor = [UIColor orangeColor];
    btnPlay.frame = CGRectMake(100, 80, 60, 20);
    [btnPlay setTitle:@"绘制" forState:UIControlStateNormal];
    
    [btnPlay addTarget:self action:@selector(btnPlayClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnPlay];
    
    UIButton *btnEraser = [UIButton buttonWithType:UIButtonTypeCustom];
    btnEraser.backgroundColor = [UIColor orangeColor];
    btnEraser.frame = CGRectMake(180, 80, 60, 20);
    [btnEraser setTitle:@"橡皮擦" forState:UIControlStateNormal];
    [btnEraser setTitle:@"画笔" forState:UIControlStateSelected];
    
    [btnEraser addTarget:self action:@selector(btnEraserClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnEraser];
    
    
}

- (void)btnRecClicked:(id)sender
{
    [drawView testRecToFile];
}

- (void)btnPlayClicked:(id)sender
{
    [drawView testPlayFromFile];
}


- (void)btnSaveClicked:(id)sender
{
    [drawView save];
}

- (void)btnCleanClicked:(id)sender
{
    [drawView clean];
}


- (void)btnRectClicked:(id)sender
{
    drawView.shapeType = LSShapeRect;
}

- (void)btnEllipseClicked:(id)sender
{
    drawView.shapeType = LSShapeEllipse;
}

- (void)btnLineClicked:(id)sender
{
    drawView.shapeType = LSShapeLine;
}

- (void)btnCurveClicked:(id)sender
{
    drawView.shapeType = LSShapeCurve;
}

- (void)btnEraserClicked:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    if (btn.selected)
    {
        btn.selected = NO;
        
        //使用画笔
        drawView.isEraser = NO;
    }
    else
    {
        btn.selected = YES;
        
        //使用橡皮擦
        drawView.isEraser = YES;
    }
}

- (void)btnUndoClicked:(id)sender
{
    [drawView unDo];
}

- (void)btnRedoClicked:(id)sender
{
    [drawView reDo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
