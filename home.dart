import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* 
Authored by: Kevin Vega
Company: HAJIJUJA
Project: CoinFlip
Feature: [COIN-003] Home Screen/Dashboard
Description: A very barebones home screen where the user can access the
menu and add a new chest to track their finances.
 */

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
// Just describes basic states of the app like color, font, etc
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return ChangeNotifierProvider
    (
      create: (context) => MyAppState(),
      child: MaterialApp
      (
        title: 'Dashboard',
        theme: ThemeData
        (
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier
{
  // Will put something here when the buttons have functionality
}

class MyHomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      // Contains the elements of the home screen
      appBar: TopBar(),
      body: HomeContents(),
    );
  }
}

class HomeContents extends StatelessWidget {
  const HomeContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) 
  {
    return Stack
    (
      children: 
      [
        Center
        (
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Container
              (
                alignment: Alignment.center,
                child: EmptyDashboardMessage(),
              ),
            ],
          ),
        ),
        Positioned
        (
          bottom: 16.0, 
          right: 16.0,
          child: RoundButton(),
        ),
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  // Button on the bottom-right corner that will make a new chest
  const RoundButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card
    (
      shape: RoundedRectangleBorder
      (
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell
      (
        onTap: () 
        {
          // Will add something here later
        },
        child: Padding
        (
          padding: const EdgeInsets.all(16.0), 
          child: Text
          (
            '+',
            style: TextStyle(fontSize: 24), 
          ),
        ),
      ),
    );
  }
}

class EmptyDashboardMessage extends StatelessWidget 
{
  // This is the message and the center when no chests are made
  const EmptyDashboardMessage
  (
    {super.key,}
  );

  @override
  Widget build(BuildContext context)
  {
    return Text
    (
      'No Chests here :(\n'
      'Press the button on the bottom-right\n'
      'corner to make a new chest',
      textAlign: TextAlign.center,
    );
  }
}

class TopBar extends StatelessWidget implements PreferredSizeWidget
{
  // Top bar that contains the menu button
  const TopBar
  ({
    super.key,
  });

  @override
  Widget build(BuildContext context) 
  {
    return AppBar
    (
      title: Text('Home'),
      backgroundColor: Colors.blueAccent,
      leading: IconButton
      (
        icon: Text
        (
          '=', 
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        onPressed: () 
        {
          // Will add something fancy here later
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
