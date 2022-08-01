# top_hat_2

# Program Overview

Project-based learning to understand a flutter-based application that incorporates the composite design pattern and rudimentary state management.

## Intended Composite Structure

Collection
 ||
|Children|
 ||
 Topic
 ||
|Children|
 ||
|Children|
 ||
 Hatch

abstract class Component {
 void addToChildren(M.ObjectId id, String title, String? payload);
 Widget render(BuildContext context, int? index, Function statefulFx);
}

class CompositeData implements Component {
 
 ObjectId? id;
 String name;
 List<CompositeData>? children;
 ScrollDirection scrollDirection;
 String? payload;

 String? get address;
 String get title;
 get identifier;
 int get length;

 set address(String? webAddress);
 set title(String value);
 setId(ObjectId? id);
 
 void changeYouTubeAddress(String youTubeLocation);
 void remove(int index);
 void rename(String newName);

 @override
 addToChildren(M.ObjectId id, String title, String? payload);
 @override
 Widget render(BuildContext context, int? index, Function statefulFx);

 Map<String, dynamic> toJson();
 factory CompositeData.fromJson(Map<String, dynamic> json);
 }

## Principles

ListViews with a built-in button.
Dismissible ListView cells.
Composite Design Pattern.
Flutter enums. 
State Management - SetState.
Json.
YouTube.
MongoDB.

## Principle Concepts

The code relies on the composite design pattern to leverage the widget tree features provided by flutter.
In brief, a ListView is stored in the three leaf elements and has unique characteristic cell widgets.

The composite pattern has a client, Component, composite, and leaves. The Component is an abstract class that contains add and render functions. The component implements the component and contains the major functionality for the extended leafs: collection_type_leaf, topic_type_leaf and item_type_leaf. The leaves are responsible for most heavy lifting and contain the concrete elements for the UI.

It is important to remember that each leaf is responsible for a level of the composite, which means that reaching child-level information, each needs to change its appropriate level (i.e. title or children). The composite provides direct access to the actions taken at each level. To deal with the nested composite data, use the functions at the layer level to alter its data.

The statefulFx is a simple setState function that accepts a void function at the appropriate state layer level and allows the UI to redraw when information is changed. The UI state management passes the statefulFx method along the widget tree from the stateful client widget. This method is essential; otherwise, UI will not update when needed using this state management paradigm.

## Stateful Actions

The stateful actions mainly were designed to occur in the token widgets. Please do not change the pages to StatefulWidgets; instead, use the statefulFx functions to update the UI. The Collection_page.dart file needs review to determine if the file could maintain this ideal.

## YouTube Videos

It was necessary to modify the incoming website links that youTube provides using its 'share' button; because the youtube_player_flutter package is not compatible with all the different formats YouTube is now offering. The processor class is my answer to modifying the different URLs into something useful for the package.

## TopHat Json Format Example (debugging stub)

We can access merchant collections by adding them to the collection level children.

var jsonTopHat = {
 _id: 62d36670e7cd1b409ac14ecf, 
 name: collection, 
 children: [
 {
 _id: 62d2548f00e837706141414e,
 name: bachata,
 children: [
 {
 _id: 62d2548f00e837706141414f,
 name: Marius and Elena,
 children: [
 {
 _id: 62d2548f00e8377061414150,
 name: Basics, 
 children: [],
 listType: ScrollDirection.vertical,
 youtube: https://www.youtube.com/watch?v=uYogZ8wGrv0
 },
 {
 _id: 62d2548f00e8377061414151,
 name: Intermediate,
 children: [],
 listType: ScrollDirection.vertical,
 youtube: https://www.youtube.com/watch?v=Vx3AWpgnoVQ
 }
 ],
 listType: 
 ScrollDirection.horizontal,
 youtube: null
 }
 ], 
 listType: ScrollDirection.vertical, 
 youtube: null
 }, 
 {
 _id: 62d270614271446d42b41edd, 
 name: South Park, children: 
 [
 {
 _id: 62d2706f4271446d42b41ede, 
 name: Season 1, 
 children: [
 {
 _id: 62d2707b4271446d42b41edf, 
 name: Episode 3, 
 children: [], 
 listType: ScrollDirection.vertical, 
 youtube: https://www.youtube.com/watch?v=Aof7nR1hLYE
 }
 ], 
 listType: ScrollDirection.horizontal, 
 youtube: null
 }
 ], 
 listType: ScrollDirection.vertical, 
 youtube: null
 }
 ], 
 listType: ScrollDirection.vertical,
 youtube: null
 }

## Blank Passing TopHat

var merchantCollection = {
 _id: 62d26d224271446d42b41edb
 'name': 'bachata',
 'children': [
 {
 _id: 62d2548f00e837706141414e
 'name': 'Marius and Elena',
 'children': [
 {
 _id: 62d2548f00e8377061414150
 'name': 'Basics',
 'children': [],
 'listType': 'ScrollDirection.vertical',
 'youtube': 'https://www.youtube.com/watch?v=uYogZ8wGrv0'
 },
 {
 _id: 62d2548f00e8377061414151
 'name': 'Intermediate',
 'children': [],
 'listType': 'ScrollDirection.vertical',
 'youtube': 'https://www.youtube.com/watch?v=Vx3AWpgnoVQ'
 }
 ],
 'listType': 'ScrollDirection.horizontal',
 'youtube': null
 }
 ],
 'listType': 'ScrollDirection.vertical',
 'youtube': null
};

## Loading TopHats (Internal data)

The helper function populateWidgetsFromJson and loads the JSON data passed to it. This method can handle the composite design pattern (so the widgets can use collections or topics without issues). It follows these three steps.

1) Checks to see if the data adding to the topic branch is already present by comparing the name values. The widget will not add the data to the collection if it is already there.

2) For each topic passed in the JSON file, child.addToChildren loads the title of that topic.

3) For the hatches and Episodes, use the do-try-catch block. For every child in loadedCollection.children(), data is added and instantiated with an ItemTypeLeaf to make concrete widgets passed to the copiedTopic.children?[i].children.

