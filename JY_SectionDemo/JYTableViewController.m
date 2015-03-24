//
//  JYTableViewController.m
//  JY_SectionDemo
//
//  Created by invoker on 15/3/24.
//  Copyright (c) 2015年 invoker. All rights reserved.
//

#import "JYTableViewController.h"
#import "ChineseString.h"
#import "NSObject+Index.h"
@interface JYTableViewController ()
{
    NSMutableArray * _listArray; //源数据
    NSMutableArray *_AbcSort;   //排序整理后的数组
    NSMutableArray *_sectionHeadsKeys;//存放索引的数组
    
    
}
@end

@implementation JYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _AbcSort=[[NSMutableArray alloc]init];
     _sectionHeadsKeys=[[NSMutableArray alloc]init];
    _listArray = [[NSMutableArray alloc]initWithObjects:@"白居易",@"柳惊涛",@"莫雨",@"王遗风",@"唐大侠",@"李白",@"杜甫",nil];
    
    //获取数据
    _AbcSort = [ self getChineseStringArr : _listArray andSck:_sectionHeadsKeys ];
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- ( NSInteger )tableView:( UITableView *)tableView numberOfRowsInSection:( NSInteger )section

{
    
    return   [[ _AbcSort objectAtIndex :section] count ];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil)
    {
        //默认单元格样式
        //        UITableViewCellStyleDefault,        UITableViewCellStyleValue1,        UITableViewCellStyleValue2,        UITableViewCellStyleSubtitle
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
  
    
    if ([ _AbcSort count ] > indexPath. section )
    {
        NSArray *arr = [ _AbcSort objectAtIndex :indexPath. section ];
        if ([arr count ] > indexPath. row )
        {
            // 之后 , 将数组的元素取出 , 赋值给数据模型
            ChineseString *str = ( ChineseString *) [arr objectAtIndex :indexPath. row ];
            // 给 cell 赋给相应地值 , 从数据模型处获得
            cell. textLabel . text = str. string ;
        }
    }



    return cell;
    

}

- ( NSString *)tableView:( UITableView *)tableView titleForHeaderInSection:( NSInteger )section

{
    return [ _sectionHeadsKeys objectAtIndex :section];
    
}



- (NSArray*)sectionIndexTitlesForTableView:( UITableView *)tableView

{
    
    return _sectionHeadsKeys ;
    
}
- (NSInteger)numberOfSectionsInTableView:( UITableView *)tableView
{
    
    return [ _AbcSort count ];;
    
}
@end
