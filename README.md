# atlas-web_dart

## Async in Dart
The async keyword is used to mark a function as asynchronous. This means the function can perform asynchronous operations and can use await to wait for Future results.
- using Async and Await
When a function is marked with async, it returns a Future implicitly. <-- VERY IMPORTANT
```
Future<void> printData() async {
  String data = await fetchData(); // Wait for the Future to complete
  print(data);
}
```
- await: The await keyword is used within an async function to wait for a Future to complete and get its value.

## Future
A Future in Dart represents a potential value or error that will be available at some time in the future. It's used for asynchronous programming, where you perform operations that take time to complete, such as I/O operations, without blocking the main thread.

- Creating a future
```
Future<String> fetchData() {
  // Simulate a network request
  return Future.delayed(Duration(seconds: 2), () => 'Data received');
}
```
- Using a Future
You can handle the result of a Future using then, catchError, and whenComplete methods, or with async and await (explained later).
```
fetchData().then((data) {
  print(data);
}).catchError((error) {
  print('Error: $error');
}).whenComplete(() {
  print('Operation completed');
});

```
## Final
The final keyword in Dart is used to declare a variable that can only be set once. After it's set, its value cannot be changed.
- Using Final
```
final String name = 'Alice';
// name = 'Bob'; // This will cause an error because name is final.
```
- Difference between Final and Const
While final variables can be set only once and their value can be computed at runtime, const variables are compile-time constants and must be assigned a constant value.
```
final DateTime now = DateTime.now(); // Allowed, computed at runtime
const int age = 30; // Must be a compile-time constant
```

## Example using Async, Future, and Final
```
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () => 'Data received');
}

void main() async {
  final result = await fetchData(); // Using await to wait for the Future
  print(result);
}
```
In this example:
- fetchData returns a Future<String> that completes after 2 seconds.
- main is marked as async, allowing the use of await to wait for fetchData to complete and get the result.
- result is declared as final since its value is set once and does not change.