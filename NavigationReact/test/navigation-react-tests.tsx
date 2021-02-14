// tsc --jsx react --target es3 --lib ES2015,DOM --esModuleInterop --noImplicitAny true navigation-react-tests.tsx
import { StateNavigator } from 'navigation';
import { NavigationHandler, NavigationContext, NavigationBackLink, NavigationLink, RefreshLink } from 'navigation-react';
import React, { useContext } from 'react';
import ReactDOM from 'react-dom';

const stateNavigator = new StateNavigator([
    { key: 'people', route: 'people/{page?}', defaults: { page: 0 } },
    { key: 'person', route: 'person/{name}', trackCrumbTrail: true }
]);

const People = () => {
    const { data } = useContext(NavigationContext);
    const { page } = data;
    return (
        <div>
            <ul>
                {['Bob', 'Brenda'].map(name => (
                    <li>
                        <NavigationLink
                            stateKey="person"
                            navigationData={{ name }}>
                            {name}
                        </NavigationLink>
                    </li>
                ))}
            </ul>
            <RefreshLink
                navigationData={{ page: page + 1 }}
                disableActive={true}
                includeCurrentData={true}>
                Next
            </RefreshLink>
        </div>
    );
}

const Person = () => {
    const { data } = useContext(NavigationContext);
    const { name } = data;
    return (
        <div>
            <NavigationBackLink distance={1}>List</NavigationBackLink>
            <div>{name}</div>
        </div>
    );
}

const { people, person } = stateNavigator.states;
people.renderScene = () => <People />; 
person.renderScene = () => <Person />;

const App = () => {
    const {state, data} = useContext(NavigationContext);
    return state.renderScene(data);
};
  
ReactDOM.render(
    <NavigationHandler stateNavigator={stateNavigator}>
        <App />
    </NavigationHandler>,
    document.getElementById('root')
);