# @Aptos
#### Video Demo:  https://www.youtube.com/watch?v=a3uxnCIK95c
#### Description:
This project was written in swift for mobile or ipad use, this app is intended to help any property owners manage their assets (builinds, aparments, houses). Assets information get stored in a database where
will be available for future references.

This app also helps to keep track of tenant and rent information, a payment gets auto generated so you know when the next payment for your tenant is due and mark it as paid when the payment is received.

In the app you can add, update and remove buildings(places) or tenants, you can also add new leases and add rent amount. The rent amount and the dates will autogenerate a payment which will be displayed in the rents section, where you will be able to mark any rents as paid.

The is connected to a google
fire base that will keep all the information available to any IOS device that has this app installed
Google firebase gives a secure connection and will also give you feedback on app analitics which is good to check on your app perfomance.

### Language
This app was designed in xcode using swift, which is a powerfull and very intuitive software. The IDE gives you the option to see how the changes are taking effect in real time. Making coding and debuggin a lot easier.

### Cocoapods
cocoapods was added into the project to a variety of dependencies that helped me with the User interface, icons, keyboard shortcuts and syncing colors.
Also tried to add a CRON job which I wasn't successfull to link to the device and firebase.

### MVC
The app was built in MVC design patter to have a cleaner code

### Database
For the database I initially started with mysqllite to save everything in the phone, but eventually I decided to take it a step further and use Google's firebase, which uses Json data instead of a relational
database. I also chose to use this to have the information available online.
I downloaded a google key that will only work on this app. This database is running in test mode.

### Building and tenants
Building feature allows you to add, update and remove buildings(locations) or tenants
Texboxes, buttons, list views and tables where used to get information from the users.
on Load every page get loaded with a custom set of icon from swift icons a library from cocoadpods.

### Leases

In this section you will have acces to date pickers and listviews, to create a lease from the information stored from your buildings and tenants.
Only available properties will show up on the add lease section, if a lease is created with a specific building that building will become "not available" when you register the new lease.

### Payments

Here you will se a list of the current leases and people's name on the lease, that will help you determine on which date the tenant hast to pay for their rent, you also have the power to mark the rent as paid,
this information will get stored in the database for future references.

### How to run
Import project to xcode, compile and run it.
you can use simulator to run on the mac built in simulator or you can use your iphone or ipad to run this app, you'll just have to change the target.
### Requirements
    - IOS/macosx device
    -firebase
    -swift
    -cocoapods

### Improvements
Create a cron Job or a stored procedure that will trigger upcoming payment dates, 5 days before the payment is due.
