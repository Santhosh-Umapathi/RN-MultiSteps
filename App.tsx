import React from 'react';
import {SafeAreaView, ScrollView, View} from 'react-native';

import {Header} from 'react-native/Libraries/NewAppScreen';
import {Button} from 'rn-module';
import {IUser, TCheck} from 'rn-module/dist/typings';

const App = () => {
  const user: IUser = {firstName: 'stes', id: 'asd', lastName: 'tes'};
  const check: TCheck = 123;
  console.log('🚀 --- App --- user', user, check);
  return (
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <Header />
        <View>
          <Button />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
