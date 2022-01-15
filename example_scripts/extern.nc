// A simple program to demonstrate control flow in nightScript
//
// The nightScript authors

// Extern definitions tell the parser that the definition is
// guranteed to exist in the environment.

extern struct Window {
  location: string,
}

extern function Window.alert(msg: string): void;

extern window: Window;
