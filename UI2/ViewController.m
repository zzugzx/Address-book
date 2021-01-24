//
//  ViewController.m
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import "ViewController.h"
#import "Contact.h"
#import "ContactGroup.h"
#import <Masonry/Masonry.h>
#import "SecondViewController.h"




@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *contacts;

@property (nonatomic, assign) BOOL isSearch;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *searchContacts;



@property (nonatomic, strong) NSArray *persons;

@end


@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    
    //添加和删除Button 放到rightBar
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    UIBarButtonItem *DelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(delete)];
    UIBarButtonItem *AddButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    NSArray *arr = [NSArray arrayWithObjects:DelButtonItem, AddButtonItem, nil];
    self.navigationItem.rightBarButtonItems = arr;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addSearchBar];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - 数据加载与添加


/*
 从plist中读取数据
*/
- (NSArray *)persons {
    if (_persons == nil) {
        NSURL *fileURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"person.plist"];
        _persons = [NSArray arrayWithContentsOfURL:fileURL];
    }
    return _persons;
}

- (NSURL *)applicationDocumentsDirectory
{
     return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


/*
 加载数据
 */
- (void)initData{
    self.contacts = [[NSMutableArray alloc] init];

    for (int i = 0; i < 26; i++) {
        ContactGroup *group = [[ContactGroup alloc] initWithName:[NSString stringWithFormat:@"%c", (i + 'A')] andDetail:[NSString stringWithFormat:@"With names beginning with %c", (i + 'A')] andContacts: [[NSMutableArray alloc] init]];
        [self.contacts addObject:group];
    }
    
    [self.contacts addObject:[[ContactGroup alloc] initWithName:@"#" andDetail:[NSString stringWithFormat:@"others"] andContacts: [[NSMutableArray alloc] init]]];
    
    for (int i = 0; i < self.persons.count; i++) {
        NSDictionary *person = self.persons[i];
        [self addDataWithPerson:person];
    }
}


/**
 将新的人的信息加入对应的首字母MutableArray
 */
- (void)addDataWithPerson: (NSDictionary *)person {
    NSString *name = person[@"name"];
    for (int j = 0; j < 26; j++) {
        unichar c = [name characterAtIndex:0];
        if (c >= 'a' && c <= 'z') c += 'A' - 'a';
        if (c == j + 'A') {
            ContactGroup *group = self.contacts[j];
            [group.contacts addObject:[Contact initWithName: person[@"name"] andPhoneNumber:person[@"phoneNumber"]]];
            self.contacts[j] = group;
            return;
        }
    }
    ContactGroup *group = self.contacts[26];
    [group.contacts addObject:[Contact initWithName: person[@"name"] andPhoneNumber:person[@"phoneNumber"]]];
    self.contacts[26] = group;
}


#pragma mark - TableView的实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.isSearch) return 1;
    return self.contacts.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isSearch) {
        return self.searchContacts.count;
    }
    ContactGroup *group = self.contacts[section];
    return group.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact *contact = nil;
    if (self.isSearch) {
        contact = self.searchContacts[indexPath.row];
    }
    else {
        ContactGroup *group = self.contacts[indexPath.section];
        contact = group.contacts[indexPath.row];
    }
    // Configure the cell...
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phoneNumber;
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}


- (void)delete {
    [self.tableView setEditing:!self.tableView.isEditing animated:true];
}
- (void)add {
    SecondViewController *nextview = [[SecondViewController alloc] init];
    nextview.callback = ^(NSString *name, NSString *phoneNumber){
        NSDictionary *person = @{@"name":name, @"phoneNumber":phoneNumber};
        [self addDataWithPerson:person];
        [self SaveToFile];
        [self.tableView reloadData];
    };
    [self.navigationController pushViewController:nextview animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ContactGroup *group = self.contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [group.contacts removeObject:contact];
        [self.contacts replaceObjectAtIndex:indexPath.section withObject:group];
        [self SaveToFile];
        [tableView reloadData];
    }
}

- (nullable NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ContactGroup *group = self.contacts[section];
    if (group.contacts.count) return group.name;
    return nil;
}


//- (nullable NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    ContactGroup *group = self.contacts[section];
//    return group.detail;
//}

#pragma  mark - 搜索栏的创建
- (nullable NSArray<NSString *> *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (self.isSearch) return nil;
    NSMutableArray *index = [[NSMutableArray alloc] init];
    for (ContactGroup *group in self.contacts)
         if (group.contacts.count) [index addObject:group.name];
    return index;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *nextview = [[SecondViewController alloc] init];
    ContactGroup *group = self.contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    nextview.name = contact.name;
    nextview.phoneNumber = contact.phoneNumber;
    nextview.callback = ^(NSString *name, NSString *phoneNumber){
        contact.name = name;
        contact.phoneNumber = phoneNumber;
        [group.contacts removeObjectAtIndex:indexPath.row];
        NSDictionary *person = @{@"name":name, @"phoneNumber":phoneNumber};
        [self.contacts replaceObjectAtIndex:indexPath.section withObject:group];
        [self addDataWithPerson:person];
        [self.tableView reloadData];
    };
    [self.navigationController pushViewController:nextview animated:YES];
}



- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.isSearch = NO;
    self.searchBar.text = @"";
    [self.tableView reloadData];
}
- (void) searchDataWithKeyWord:(NSString *) keyWord {
    self.isSearch = YES;
    self.searchContacts = [[NSMutableArray alloc] init];
    [self.contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ContactGroup *group = obj;
        [group.contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Contact *contact = obj;
            if ([contact.name.uppercaseString containsString:keyWord.uppercaseString] || [contact.phoneNumber containsString:keyWord]) {
                [self.searchContacts addObject:contact];
            }
        }];
    }];
    [self.tableView reloadData];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([self.searchBar.text isEqual:@""]) {
        self.isSearch = NO;
        [self.tableView reloadData];
        return;
    }
    [self searchDataWithKeyWord:self.searchBar.text];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchDataWithKeyWord:self.searchBar.text];
    [self.searchBar resignFirstResponder];
}
- (void)addSearchBar{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    self.searchBar.placeholder = @"Please input key word...";
    self.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchBar;
}


#pragma mark - 文件的保存
- (void)SaveToFile {
    
    
    NSMutableArray *data = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 26; i++) {
        ContactGroup *group = self.contacts[i];
        [group.contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Contact *contact = obj;
            NSDictionary *person = @{@"name":contact.name, @"phoneNumber":contact.phoneNumber};
            [data addObject: person];
        }];
    }

    
    NSURL *fileUrl = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"person.plist"];
    BOOL flag = [data writeToURL:fileUrl atomically:NO];
    if (flag) {
        NSLog(@"写入成功");
    }
    else {
        NSLog(@"写入失败");
    }
}
@end
