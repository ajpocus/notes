---
title: "React's useReducer Hook Considered Harmful"
date: 2020-12-15T17:57:12-05:00
draft: true
---

useReducer is a crutch, a catch-all for complex state objects that fails in certain key areas, namely the ability to tell _when_ state has actually changed.

Not to mention, the dispatch pattern is horrifically verbose for updating state. At Hacker Noon, we use a pattern like this:

```javascript
  const initialState = {};

  const reducer = (state, action) => {
    switch (action.type) {
      case "set":
        return {...state, ...action.payload};
      case "reset":
        return initialState;
      default:
        return state;
    }
  };

  const MyComponent = () => {
    const [state, dispatch] = useReducer(reducer, initialState);

    // set the "lock" property on the state object
    const setLock = lockId => {
      dispatch({
        type: "set",
        payload: {
          lock: lockId
        }
      });

      // warning: this is not the updated state!
      console.log(state.lock);
    };
  }
```

As you see in the above example, there are a few fundamental problems with this pattern:

- It's overly verbose -- the initial state and reducer are always the same, for one.
- It doesn't handle bad payloads very well.
- Dispatching a change to the state is incredibly verbose. Lots of boilerplate.
- You can't get the changed state unless you use useEffect with a dependency on that state.

This is just a bad pattern. You can create a setter, a function that takes an object and calls the dispatch, but that's just a band-aid on a festering wound.

The real issue here is a fragile abstraction that doesn't fit.

It's a fragile abstraction in the sense that it's inflexible, brittle. The setter function's necessity is just one symptom of this inherent inflexibility.

It doesn't fit in the sense that React usually has better abstractions that fit its inner abstractions like its event/render loop. This abstraction's leaky. I have to worry about stuff I shouldn't have to.

What we really want is a useState hook with a setter, I think. Is there anything else we really need?

Well, we need to know when state has changed, right? We could use a useEffect hook...but how would it call back? A literal callback? Something like this:

```javascript
  const useObjectState = (initialState, listeners) => {
    const [state, setState] = useState(initialState);
    useEffect(() => {
      
    }, [state])
  };
```