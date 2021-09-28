import React from 'react';
import {Platform, View} from 'react-native';
import {NavigationBar, CoordinatorLayout, BottomSheet} from 'navigation-react-native';
import Tweets from './Tweets';

export default ({tweets}) => (
  <CoordinatorLayout>
    <NavigationBar title="Home" barTintColor={Platform.OS === 'android' ? '#fff' : 'rgb(247,247,247)'} />
    <Tweets tweets={tweets} />
    <BottomSheet>
      <View style={{flex: 1, backgroundColor: 'lightgreen'}} />
    </BottomSheet>
  </CoordinatorLayout>
);
