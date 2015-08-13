//
//  ViewController.m
//  NSURLSessionDemo
//
//  Created by Apple on 8/13/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadJsonData];
    
}

-(void)loadJsonData{
    //1.创建url
    NSString *urlStr=[NSString stringWithFormat:@"http://192.168.40.10/Session/Session.asmx?username=%@&password=%@",@"binbin",@"123"];
    urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];

    //2.创建请求
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    //3.创建会话（这里使用了一个全局会话）并且启动任务
    NSURLSession *session=[NSURLSession sharedSession];
    //从会话创建任务
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSString *dataStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataStr);
        }else{
            NSLog(@"error is :%@",error.localizedDescription);
        }
    }];
    
    [dataTask resume];//恢复线程，启动任务
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
