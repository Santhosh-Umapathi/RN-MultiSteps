import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  View,
  NativeModules,
  Button,
} from 'react-native';

import {Header} from 'react-native/Libraries/NewAppScreen';
// import {Button} from 'rn-module';
import {IUser, TCheck} from 'rn-module/dist/typings';

const App = () => {
  const user: IUser = {firstName: 'stes', id: 'asd', lastName: 'tes'};
  const check: TCheck = 123;
  console.log('🚀 --- App --- user', user, check);

  console.log('NativeModules', NativeModules.Fastis);

  NativeModules.Fastis.incrementCount(callback =>
    console.log('Callback:', callback),
  );

  const decreaseCount = async () => {
    try {
      const results = await NativeModules.Fastis.decrementCount();
      console.log('🚀 --- App --- results', results);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <Header />
        <View>
          <Button title="decrement" onPress={decreaseCount} />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
