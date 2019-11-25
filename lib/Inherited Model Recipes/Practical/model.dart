//TODO: Create an example that works.
/* 
InheritedModel is a one-to-many render-cost controller.
Some views give it a message when they ask for data.
The model will change that category of views when it decides to.

Suppose we have data-types:
  Features
  Activities
  Templates

Widgets can subscribe to a model with a protected enum.

enum Subscriptions {
  features
  activities
  templates
}

The model can then have logic to say whether listeners need to rerender.
*/
