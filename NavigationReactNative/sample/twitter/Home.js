import React from 'react';
import {Platform, View, Text} from 'react-native';
import {
  NavigationBar,
  CoordinatorLayout,
  BottomSheet,
} from 'navigation-react-native';
import Tweets from './Tweets';

export default ({tweets}) => {
  const [height, setHeight] = React.useState(0);

  return (
    <CoordinatorLayout>
      <NavigationBar
        title="Home"
        barTintColor={Platform.OS === 'android' ? '#fff' : 'rgb(247,247,247)'}
      />
      <Tweets tweets={tweets} />
      <BottomSheet>
        <View
          style={{
            flex: 1,
            alignItems: 'center',
            justifyContent: 'center',
            backgroundColor: 'lightgreen',
            borderWidth: 10,
            borderColor: 'red',
          }}
          // onLayout={e => setHeight(e.nativeEvent.layout.height)}
        >
          <Text>{height}</Text>
        </View>
      </BottomSheet>
    </CoordinatorLayout>
  );
};
