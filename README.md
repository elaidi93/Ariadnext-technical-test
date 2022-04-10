<h1 align="center">Ariadnext-technical-test</h1>
iOS developer technical Interview for ARIADNEXT company
<p align="center">
  <a href="https://149493502.v2.pressablecdn.com/wp-content/uploads/2019/04/ios-13-logo.jpg"><img alt="ios" src="https://149493502.v2.pressablecdn.com/wp-content/uploads/2019/04/ios-13-logo.jpg"/></a>
</p>

## Implementation

### Contraints
>  unable to use third party libraries
> 
> Apply good practices

## Interface

<p align="center">
  <a href="https://github.com/elaidi93/Ariadnext-technical-test/blob/develop/img/IMG_520250236583-1.jpeg"><img alt="ios" src="https://github.com/elaidi93/Ariadnext-technical-test/blob/develop/img/IMG_520250236583-1.jpeg"/></a>
</p>

## Architecture 

I used an MVVM architecture for my application. 

![MVVM Architecture](https://upload.wikimedia.org/wikipedia/commons/8/87/MVVMPattern.png "")

I found this architecture pretty well because thanks to it. I can easily test the business logic, I just have to test the MEessageViewModel class to do it. 

The whole architecture is designed to make each component as independent as possible.

I used also dependency injection for calling ServerResponseManager to avoid controller creation an instance object for it, and make it easier to call
And i used combibe and GCD (Grand Central Dispatch) to handle response with a delay of 3 secodes (delay can be customised)

## Unit tests

I used [XCTest](https://developer.apple.com/documentation/xctest) 

## Time Challenge

It tooke me over 6 hours to complete the whole teste, it was pretty easy so i tried to implement the best practice that I've learned during my career
