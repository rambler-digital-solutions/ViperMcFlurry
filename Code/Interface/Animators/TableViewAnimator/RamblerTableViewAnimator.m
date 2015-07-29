//
//  RamblerTableViewAnimator.m
//  Pods
//
//  Created by Egor Tolstoy on 29/07/15.
//
//

#import "RamblerTableViewAnimator.h"

@interface RamblerTableViewAnimator()

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RamblerTableViewAnimator

#pragma mark - Инициализация

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
    }
    return self;
}

+ (instancetype)objectWithTableView:(UITableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}

#pragma mark - Реализация анимации

- (void)animateTableViewWithInsertedRowsIndexPaths:(NSArray *)insertedRowsIndexPaths
                                     withAnimation:(UITableViewRowAnimation)insertingAnimation
                             updatedRowsIndexPaths:(NSArray *)updatedRowsIndexPaths
                                     withAnimation:(UITableViewRowAnimation)updatingAnimation
                             removedRowsIndexPaths:(NSArray *)removedRowsIndexPaths
                                     withAnimation:(UITableViewRowAnimation)removingAnimation
                                      batchUpdates:(BOOL)isBatchUpdate {
    if (isBatchUpdate) {
        [self.tableView beginUpdates];
    }
    if (insertedRowsIndexPaths) {
        [self.tableView insertRowsAtIndexPaths:insertedRowsIndexPaths withRowAnimation:insertingAnimation];
    }
    
    if (removedRowsIndexPaths) {
        [self.tableView deleteRowsAtIndexPaths:removedRowsIndexPaths withRowAnimation:removingAnimation];
    }
    if (isBatchUpdate) {
        [self.tableView endUpdates];
    }
    if (updatedRowsIndexPaths) {
        [self.tableView reloadRowsAtIndexPaths:updatedRowsIndexPaths withRowAnimation:updatingAnimation];
    }
}

- (void)animateTableViewWithInsertedRowsIndexPaths:(NSArray *)insertedRowsIndexPaths
                             updatedRowsIndexPaths:(NSArray *)updatedRowsIndexPaths
                             removedRowsIndexPaths:(NSArray *)removedRowsIndexPaths
                                      batchUpdates:(BOOL)isBatchUpdate {
    [self animateTableViewWithInsertedRowsIndexPaths:insertedRowsIndexPaths
                                       withAnimation:UITableViewRowAnimationAutomatic
                               updatedRowsIndexPaths:updatedRowsIndexPaths
                                       withAnimation:UITableViewRowAnimationNone
                               removedRowsIndexPaths:removedRowsIndexPaths
                                       withAnimation:UITableViewRowAnimationFade
                                        batchUpdates:isBatchUpdate];
}

- (void)animateTableViewWithInsertedSectionsIndexSet:(NSIndexSet *)insertedSectionsIndexSet
                                       withAnimation:(UITableViewRowAnimation)insertingAnimation
                             updatedSectionsIndexSet:(NSIndexSet *)updatedSectionsIndexSet
                                       withAnimation:(UITableViewRowAnimation)updatingAnimation
                             removedSectionsIndexSet:(NSIndexSet *)removedSectionsIndexSet
                                       withAnimation:(UITableViewRowAnimation)removingAnimation
                                        batchUpdates:(BOOL)isBatchUpdate {
    if (isBatchUpdate) {
        [self.tableView beginUpdates];
    }
    if (insertedSectionsIndexSet) {
        [self.tableView insertSections:insertedSectionsIndexSet
                      withRowAnimation:insertingAnimation];
    }
    
    if (removedSectionsIndexSet) {
        [self.tableView deleteSections:removedSectionsIndexSet
                      withRowAnimation:removingAnimation];
    }
    
    if (isBatchUpdate) {
        [self.tableView endUpdates];
    }
    if (updatedSectionsIndexSet) {
        [self.tableView reloadSections:updatedSectionsIndexSet
                      withRowAnimation:updatingAnimation];
    }
}

- (void)animateTableViewWithInsertedSectionsIndexSet:(NSIndexSet *)insertedSectionsIndexSet
                             updatedSectionsIndexSet:(NSIndexSet *)updatedSectionsIndexSet
                             removedSectionsIndexSet:(NSIndexSet *)removedSectionsIndexSet
                                        batchUpdates:(BOOL)isBatchUpdate {
    [self animateTableViewWithInsertedSectionsIndexSet:insertedSectionsIndexSet
                                         withAnimation:UITableViewRowAnimationNone
                               updatedSectionsIndexSet:updatedSectionsIndexSet
                                         withAnimation:UITableViewRowAnimationNone
                               removedSectionsIndexSet:removedSectionsIndexSet
                                         withAnimation:UITableViewRowAnimationNone
                                          batchUpdates:isBatchUpdate];
}

- (void)beginTableViewUpdates {
    [self.tableView beginUpdates];
}

- (void)endTableViewUpdates {
    [self.tableView endUpdates];
}

- (void)redrawTableView {
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end