//
//  ViewController.m
//  nineImage
//
//  Created by Secret Wang on 2016/10/28.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "ViewController.h"
#import "MWPhotoBrowser.h"
#import "NineImageView.h"
#import "MyTableViewCell.h"
#import "MJRefresh.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
@interface ViewController ()<MWPhotoBrowserDelegate,NineImageViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray* _selections;
    NSMutableArray* photoArray;
    NSMutableArray *_tableArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图片";
    self.view.backgroundColor = [UIColor whiteColor];
    photoArray = [NSMutableArray array];
    _tableArray = [NSMutableArray array];
   
    [self createTableView];
}
-(void)createData{
    for (int i=0; i<9; i++) {
        MyModel* model = [[MyModel alloc]init];
        model.imageUrl = [NSString stringWithFormat:@"q%d.jpg",i ];
        model.timeString = [NSString stringWithFormat:@"%d分钟前",i+1];
        model.nameString = [NSString stringWithFormat:@"姓名%d",i];
        model.textString = [NSString stringWithFormat:@"四海啥送ID过后回国发哦好我 i 汉溪长隆看法 vi 哦啊让就黄发垂髫你够 is 愤怒的吼 i 啊呢佛 i 还是都 i 个哈恶狗 i 怕黑狗 i%d",i+1];
        for (int j=0; j<= i; j++) {
            [model.strArray addObject:[NSString stringWithFormat:@"qqqqqq%d",j+1]];
            if (j==8) {
                [model.imageArray addObject:[NSString stringWithFormat:@"q8"]];
            }else
                [model.imageArray  addObject:[NSString stringWithFormat:@"q%d.jpg",j]];
        }
        [_tableArray addObject:model];
    }
    [_tableView reloadData];
}
-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height ) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    
    //首页动态的下拉与上拉
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(xialashaxin)];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(shanglajiazai)];
    [_tableView.mj_header beginRefreshing];
}
-(void)xialashaxin{
    NSLog(@"下拉刷新");
    [_tableArray removeAllObjects];
    [self createData];
    [_tableView.mj_header endRefreshing];
}
-(void)shanglajiazai{
    NSLog(@"上拉加载");
    [self createData];
    [_tableView.mj_footer endRefreshing];
}


#pragma mark ****** tableView代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"cell";
    MyTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    for (UIView *ve in cell.contentView.subviews) {
        [ve removeFromSuperview];
    }
    cell.delegate = self;
    MyModel* model = _tableArray[indexPath.row];
    [cell configModel:model];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyModel* model = _tableArray[indexPath.row];
    return [MyTableViewCell cellHeight:model];
}

-(void)createNineImageView{
    photoArray = [NSMutableArray array];
    NineImageView* imageView = [[NineImageView alloc]initWithFrame:CGRectMake(20, 100, SCREEN_SIZE.width - 40, SCREEN_SIZE.width - 40)];
//    imageView.delegate = self;
    [self.view addSubview:imageView];
    for (int i=0; i<9; i++) {
        if (i==8) {
            [photoArray addObject:[NSString stringWithFormat:@"q8"]];
        }else
            [photoArray  addObject:[NSString stringWithFormat:@"q%d.jpg",i]];
    }
    imageView.imageArray = photoArray;
}
-(void)tapGestureTouch:(NSInteger)index andModel:(MyModel *)array{
    [self createImage:index andModel:array];
}
-(void)createImage:(NSInteger)sender andModel:(MyModel *)array{
    // Browser
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    NSMutableArray *thumbs = [[NSMutableArray alloc] init];
    MWPhoto *photo;
    BOOL displayActionButton = YES;
    BOOL displaySelectionButtons = YES;
    BOOL displayNavArrows = YES;
    BOOL enableGrid = YES;
    BOOL startOnGrid = YES;
    
    for (int i=0; i<array.imageArray.count; i++) {
        photo = [MWPhoto photoWithImage:[UIImage imageNamed:array.imageArray[i]]];
        photo.caption = array.strArray[i];
        [photos addObject:photo];
    }
    
    // Options
    self.photos = photos;
    self.thumbs = thumbs;
    
    // Create browser
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displayActionButton = displayActionButton;//分享按钮,默认是
    browser.displayNavArrows = displayNavArrows;//左右分页切换,默认否
//    browser.displaySelectionButtons = displaySelectionButtons;//是否显示选择按钮在图片上,默认否
    browser.alwaysShowControls = displaySelectionButtons;//控制条件控件 是否显示,默认否
    browser.zoomPhotosToFill = YES;//是否全屏,默认是
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    browser.wantsFullScreenLayout = YES;//是否全屏
#endif
    browser.enableGrid = enableGrid;//是否允许用网格查看所有图片,默认是
    browser.startOnGrid = startOnGrid;//是否第一张,默认否
    browser.enableSwipeToDismiss = YES;
    [browser showNextPhotoAnimated:YES];
    [browser showPreviousPhotoAnimated:YES];
    [browser setCurrentPhotoIndex:sender-1];
    
    if (displaySelectionButtons) {
        _selections = [NSMutableArray new];
        for (int i = 0; i < photos.count; i++) {
            [_selections addObject:[NSNumber numberWithBool:NO]];
        }
    }
//    [self presentViewController:browser animated:YES completion:nil];
    [self.navigationController pushViewController:browser animated:YES];
}
-(NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.photos.count;
}
-(id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    if (index<self.photos.count) {
        return [self.photos objectAtIndex:index];
    }
    return nil;
}

@end
